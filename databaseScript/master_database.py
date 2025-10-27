#!/usr/bin/env python3
"""
Master Database Script for Roast App
Combines all database operations: scraping from OSM only, processing, uploading, and maintenance
"""

import os
import sys
import logging
import pandas as pd
from sqlalchemy import create_engine, text
from sqlalchemy.exc import SQLAlchemyError
from OSMPythonTools.nominatim import Nominatim
from OSMPythonTools.overpass import Overpass, overpassQueryBuilder
from dotenv import load_dotenv
from geopy.geocoders import Nominatim as GeopyNominatim
from geopy.distance import geodesic
import math

# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s',
    handlers=[
        logging.FileHandler('master_database.log'),
        logging.StreamHandler(sys.stdout)
    ]
)
logger = logging.getLogger(__name__)

TILE_SIZE = 0.003  # Same as in Java

def calculate_tile_id(lat, lon):
    """Calculate tile ID for given coordinates."""
    if lat is None or lon is None:
        return None

    tile_x = int(lat // TILE_SIZE)
    tile_y = int(lon // TILE_SIZE)
    return f"{tile_x}_{tile_y}"

class MasterDatabaseManager:
    def __init__(self):
        # Load environment variables from the root .env file
        root_env_path = os.path.join(os.path.dirname(__file__), '..', '.env')
        load_dotenv(root_env_path)

        # Initialize OSM tools only
        self.osm_nominatim = Nominatim()
        self.osm_overpass = Overpass()
        self.geopy_geocoder = GeopyNominatim(user_agent="roast-app-scraper")

        # Database connection
        self.engine = None

    def get_database_config(self):
        """Get database configuration from environment variables"""
        config = {
            'host': os.getenv('DB_HOST', 'localhost'),
            'port': os.getenv('DB_PORT', '5433'),
            'database': os.getenv('DB_NAME', 'roastdb'),
            'username': os.getenv('DB_USER', 'jean-pierrebenavidescruzatte').strip('"'),
            'password': os.getenv('DB_PASSWORD', 'BenavidesJ23')
        }
        logger.info(f"Using database: {config['username']}@{config['host']}:{config['port']}/{config['database']}")
        return config

    def create_database_connection(self):
        """Create database connection using SQLAlchemy"""
        try:
            config = self.get_database_config()
            connection_string = f"postgresql+psycopg2://{config['username']}:{config['password']}@{config['host']}:{config['port']}/{config['database']}"
            self.engine = create_engine(connection_string)

            # Test connection
            with self.engine.connect() as conn:
                conn.execute(text("SELECT 1"))
            logger.info("Database connection established successfully")
            return True

        except SQLAlchemyError as e:
            logger.error(f"Failed to connect to database: {e}")
            return False

    def scrape_osm_coffee_shops(self, location="Manhattan, New York City"):
        """Scrape coffee shop data from OpenStreetMap"""
        try:
            logger.info(f"Scraping OSM coffee shops in {location}")

            area = self.osm_nominatim.query(location)
            query = overpassQueryBuilder(area=area, elementType='node', selector='"amenity"="cafe"', out='body')

            result = self.osm_overpass.query(query)
            cafes_data = result.toJSON()
            cafes = cafes_data['elements']

            logger.info(f"Found {len(cafes)} coffee shops from OSM")
            return cafes

        except Exception as e:
            logger.error(f"Error scraping OSM coffee shop data: {e}")
            return []

    def calculate_tile(self, lat, lon, zoom=15):
        """Calculate tile based on latitude, longitude, and zoom level."""
        n = 2 ** zoom
        x_tile = int((lon + 180.0) / 360.0 * n)
        y_tile = int((1.0 - (math.log(math.tan(math.radians(lat)) + 1 / math.cos(math.radians(lat))) / math.pi)) / 2.0 * n)
        return {'x': x_tile, 'y': y_tile, 'z': zoom}

    def process_osm_data(self, osm_data):
        """Process OpenStreetMap data"""
        processed = []
        coffeepk = 1  # Initialize primary key counter

        # Define Manhattan boundaries (latitude and longitude)
        manhattan_bounds = {
            'min_lat': 40.7003,
            'max_lat': 40.8776,
            'min_lon': -74.0479,
            'max_lon': -73.9067
        }

        for cafe in osm_data:
            try:
                # Convert to DataFrame for easier processing
                df_row = pd.Series(cafe)
                if 'tags' in cafe:
                    tags = pd.Series(cafe['tags'])
                    df_row = pd.concat([df_row, tags])

                # Extract latitude and longitude, filter to Manhattan bounds
                lat = cafe.get('lat')
                lon = cafe.get('lon')

                if lat is None or lon is None or not (
                    manhattan_bounds['min_lat'] <= lat <= manhattan_bounds['max_lat'] and
                    manhattan_bounds['min_lon'] <= lon <= manhattan_bounds['max_lon']):
                    continue  # Skip locations outside Manhattan

                # Calculate tile ID using the updated Python implementation
                tile = calculate_tile_id(lat, lon)

                coffee_shop = {
                    'coffeepk': coffeepk,  # Assign primary key
                    'lat': lat,
                    'lon': lon,
                    'name': df_row.get('name', 'Unknown Coffee Shop'),
                    'city': self.extract_city(df_row),
                    'state': self.extract_state(df_row),
                    'street': self.extract_street(df_row),
                    'tile': tile  # Ensure tile is a string
                }

                processed.append(coffee_shop)
                coffeepk += 1  # Increment primary key

            except Exception as e:
                logger.debug(f"Error processing OSM cafe: {e}")
                continue

        logger.info(f"Processed {len(processed)} coffee shops from OSM within Manhattan")
        return processed

    def extract_city(self, row):
        """Extract city from address components"""
        city_fields = ['addr:city', 'city']
        for field in city_fields:
            if field in row and pd.notna(row[field]):
                return str(row[field])
        return "New York"  # Default city

    def extract_state(self, row):
        """Extract state from address components"""
        state_fields = ['addr:state', 'state']
        for field in state_fields:
            if field in row and pd.notna(row[field]):
                return str(row[field])
        return "NY"  # Default state

    def extract_street(self, row):
        """Extract street from address components"""
        street_fields = ['addr:street', 'addr:housenumber', 'street']
        street_parts = []

        for field in street_fields:
            if field in row and pd.notna(row[field]):
                street_parts.append(str(row[field]))

        if street_parts:
            return " ".join(street_parts)
        return "Unknown Street"

    def remove_duplicates(self, coffee_shops, distance_threshold=100):
        """Remove duplicate coffee shops based on name similarity and location proximity"""
        if not coffee_shops:
            return []

        unique_shops = []

        for shop in coffee_shops:
            is_duplicate = False

            for existing_shop in unique_shops:
                # Check name similarity (case-insensitive)
                name_similar = shop['name'].lower() == existing_shop['name'].lower()

                # Check location proximity (within threshold meters)
                if shop['lat'] and shop['lon'] and existing_shop['lat'] and existing_shop['lon']:
                    distance = geodesic(
                        (shop['lat'], shop['lon']),
                        (existing_shop['lat'], existing_shop['lon'])
                    ).meters
                    location_close = distance < distance_threshold
                else:
                    location_close = False

                if name_similar and location_close:
                    is_duplicate = True
                    # Keep the one with better rating/more reviews
                    if (shop.get('rating', 0) > existing_shop.get('rating', 0) or
                        shop.get('numofratings', 0) > existing_shop.get('numofratings', 0)):
                        # Replace existing with current (better data)
                        unique_shops.remove(existing_shop)
                        unique_shops.append(shop)
                    break

            if not is_duplicate:
                unique_shops.append(shop)

        logger.info(f"Removed {len(coffee_shops) - len(unique_shops)} duplicates")
        return unique_shops

    def backup_existing_data(self):
        """Create a backup of existing data before uploading new data"""
        try:
            logger.info("Creating backup of existing data")

            # Check if table exists and has data
            with self.engine.connect() as conn:
                result = conn.execute(text("SELECT COUNT(*) FROM coffees"))
                count = result.scalar()

                if count > 0:
                    # Create backup
                    backup_query = """
                    CREATE TABLE IF NOT EXISTS coffees_backup AS
                    SELECT * FROM coffees
                    """
                    conn.execute(text(backup_query))
                    conn.commit()
                    logger.info(f"Backed up {count} existing records")
                else:
                    logger.info("No existing data to backup")

        except SQLAlchemyError as e:
            logger.warning(f"Could not create backup (table might not exist yet): {e}")

    def create_coffees_table(self):
        """Create the coffees table if it does not exist"""
        create_table_query = """
        CREATE TABLE IF NOT EXISTS coffees (
            coffeepk SERIAL PRIMARY KEY,
            lat DOUBLE PRECISION NOT NULL,
            lon DOUBLE PRECISION NOT NULL,
            name VARCHAR(255) NOT NULL,
            city VARCHAR(255) NOT NULL,
            state VARCHAR(255) NOT NULL,
            street VARCHAR(255),
            tile VARCHAR(150) NOT NULL
        );
        """
        try:
            with self.engine.begin() as conn:  # Use begin() to ensure the transaction is committed
                conn.execute(text(create_table_query))
            logger.info("Coffees table created or already exists.")
        except SQLAlchemyError as e:
            logger.error(f"Error creating coffees table: {e}")

    def upload_to_database(self, df):
        """Upload processed data to PostgreSQL database"""
        try:
            if df.empty:
                logger.warning("No data to upload")
                return False

            logger.info(f"Uploading {len(df)} records to database")

            # Create backup first
            self.backup_existing_data()

            # Instead of replacing the table (which drops it), truncate and insert
            # This preserves foreign key constraints
            with self.engine.connect() as conn:
                # Start a transaction
                trans = conn.begin()
                try:
                    # Truncate the table to remove existing data but keep structure
                    conn.execute(text("TRUNCATE TABLE coffees RESTART IDENTITY CASCADE"))

                    # Insert new data
                    df.to_sql("coffees", conn, if_exists="append", index=False)

                    # Commit the transaction
                    trans.commit()
                    logger.info("Data uploaded successfully")
                    return True

                except Exception as e:
                    # Rollback on error
                    trans.rollback()
                    logger.error(f"Error during database upload, transaction rolled back: {e}")

                    # Fallback: try to append if table doesn't exist
                    logger.info("Attempting fallback: append to existing table structure")
                    df.to_sql("coffees", self.engine, if_exists="append", index=False)
                    logger.info("Data uploaded successfully using fallback method")
                    logger.info(f"Uploaded {len(df)} coffee shop records")
                    return True

        except SQLAlchemyError as e:
            logger.error(f"Error uploading data to database: {e}")
            return False

    def save_csv_backup(self, df, filename="cafe_data_backup.csv"):
        """Save processed data as CSV backup"""
        try:
            filepath = os.path.join(os.path.dirname(__file__), filename)
            df.to_csv(filepath, index=False)
            logger.info(f"CSV backup saved as {filepath}")
        except Exception as e:
            logger.error(f"Error saving CSV backup: {e}")

    def run_full_upload(self, location="Manhattan, New York City"):
        """Run the full upload process: scrape OSM, process, and upload"""
        logger.info("Starting full coffee shop data upload from OSM only")

        try:
            # Step 1: Create database connection
            if not self.create_database_connection():
                logger.error("Failed to establish database connection. Aborting.")
                return False

            # Step 2: Ensure the coffees table exists
            self.create_coffees_table()

            # Step 3: Scrape coffee shop data from OSM
            osm_data = self.scrape_osm_coffee_shops(location)

            if not osm_data:
                logger.error("No coffee shop data scraped from OSM. Aborting.")
                return False

            logger.info(f"Total scraped: {len(osm_data)} coffee shops from OSM")

            # Step 4: Process the data
            processed_data = self.process_osm_data(osm_data)
            deduplicated_data = self.remove_duplicates(processed_data)

            if not deduplicated_data:
                logger.error("No valid data after processing. Aborting.")
                return False

            processed_df = pd.DataFrame(deduplicated_data)

            # Step 5: Save CSV backup
            self.save_csv_backup(processed_df)

            # Step 6: Upload to database
            success = self.upload_to_database(processed_df)

            if success:
                logger.info("Full upload completed successfully!")
                logger.info(f"Uploaded {len(processed_df)} coffee shop records")
                return True
            else:
                logger.error("Upload failed")
                return False

        except Exception as e:
            logger.error(f"Unexpected error during full upload: {e}")
            return False

def main():
    """Main function to run the full upload process without user input"""
    print("🍵 Roast Database Master Manager (OSM Only)")
    print("Running full upload process for Manhattan, New York City...")

    manager = MasterDatabaseManager()

    # Run the full upload process for Manhattan
    success = manager.run_full_upload(location="Manhattan, New York City")

    if success:
        print("✅ Full upload process completed successfully!")
    else:
        print("❌ Full upload process failed.")

if __name__ == "__main__":
    main()