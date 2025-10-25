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

    def process_osm_data(self, osm_data):
        """Process OpenStreetMap data"""
        processed = []

        for cafe in osm_data:
            try:
                # Convert to DataFrame for easier processing
                df_row = pd.Series(cafe)
                if 'tags' in cafe:
                    tags = pd.Series(cafe['tags'])
                    df_row = pd.concat([df_row, tags])

                coffee_shop = {
                    'lat': cafe.get('lat'),
                    'lon': cafe.get('lon'),
                    'name': df_row.get('name', 'Unknown Coffee Shop'),
                    'city': self.extract_city(df_row),
                    'state': self.extract_state(df_row),
                    'street': self.extract_street(df_row),
                    'rating': 0.0,
                    'numofratings': 0
                }

                if coffee_shop['lat'] and coffee_shop['lon']:
                    processed.append(coffee_shop)

            except Exception as e:
                logger.debug(f"Error processing OSM cafe: {e}")
                continue

        logger.info(f"Processed {len(processed)} coffee shops from OSM")
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

            # Step 2: Scrape coffee shop data from OSM
            osm_data = self.scrape_osm_coffee_shops(location)

            if not osm_data:
                logger.error("No coffee shop data scraped from OSM. Aborting.")
                return False

            logger.info(f"Total scraped: {len(osm_data)} coffee shops from OSM")

            # Step 3: Process the data
            processed_data = self.process_osm_data(osm_data)
            deduplicated_data = self.remove_duplicates(processed_data)

            if not deduplicated_data:
                logger.error("No valid data after processing. Aborting.")
                return False

            processed_df = pd.DataFrame(deduplicated_data)

            # Step 4: Save CSV backup
            self.save_csv_backup(processed_df)

            # Step 5: Upload to database
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

    def show_menu(self):
        """Display the main menu"""
        print("\n" + "="*50)
        print("� ROAST APP - MASTER DATABASE MANAGER (OSM ONLY)")
        print("="*50)
        print("1. Run Full Upload (Scrape OSM → Process → Upload)")
        print("2. Scrape OSM Data Only")
        print("3. Process Existing Data")
        print("4. Upload Data to Database")
        print("5. Backup Database")
        print("6. View Database Stats")
        print("7. Exit")
        print("="*50)

    def run_menu(self):
        """Run the interactive menu"""
        while True:
            self.show_menu()
            try:
                choice = input("Enter your choice (1-7): ").strip()

                if choice == '1':
                    location = input("Enter location (default: Manhattan, New York City): ").strip()
                    if not location:
                        location = "Manhattan, New York City"
                    self.run_full_upload(location)

                elif choice == '2':
                    location = input("Enter location (default: Manhattan, New York City): ").strip()
                    if not location:
                        location = "Manhattan, New York City"
                    osm_data = self.scrape_osm_coffee_shops(location)
                    print(f"Scraped {len(osm_data)} coffee shops from OSM")

                elif choice == '3':
                    # This would require loading existing scraped data
                    print("Processing feature not implemented in menu yet")

                elif choice == '4':
                    # This would require loading processed data
                    print("Upload feature not implemented in menu yet")

                elif choice == '5':
                    if self.create_database_connection():
                        self.backup_existing_data()
                        print("Database backup completed")
                    else:
                        print("Failed to connect to database")

                elif choice == '6':
                    if self.create_database_connection():
                        try:
                            with self.engine.connect() as conn:
                                result = conn.execute(text("SELECT COUNT(*) FROM coffees"))
                                count = result.scalar()
                                print(f"Total coffee shops in database: {count}")
                        except SQLAlchemyError as e:
                            print(f"Error querying database: {e}")
                    else:
                        print("Failed to connect to database")

                elif choice == '7':
                    print("Goodbye!")
                    break

                else:
                    print("Invalid choice. Please enter 1-7.")

            except KeyboardInterrupt:
                print("\nGoodbye!")
                break
            except Exception as e:
                print(f"Error: {e}")


def main():
    """Main function"""
    print("🍵 Roast Database Master Manager (OSM Only)")
    print("This script scrapes coffee shop data from OpenStreetMap only.")
    print("No Google Places or Yelp integration required.")

    manager = MasterDatabaseManager()
    manager.run_menu()


if __name__ == "__main__":
    main()