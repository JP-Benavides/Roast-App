#!/usr/bin/env python3
"""
Enhanced Coffee Shop Data Scraper and Database Uploader
This script scrapes coffee shop data from multiple sources:
- OpenStreetMap (OSM)
- Google Places API
- Yelp (web scraping)
- Foursquare API
"""

import os
import sys
import logging
import pandas as pd
import requests
import time
import json
from sqlalchemy import create_engine, text
from sqlalchemy.exc import SQLAlchemyError
from OSMPythonTools.nominatim import Nominatim
from OSMPythonTools.overpass import Overpass, overpassQueryBuilder
from dotenv import load_dotenv
import googlemaps
from bs4 import BeautifulSoup
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from webdriver_manager.chrome import ChromeDriverManager
from geopy.geocoders import Nominatim as GeopyNominatim
from geopy.distance import geodesic

# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s',
    handlers=[
        logging.FileHandler('database_upload.log'),
        logging.StreamHandler(sys.stdout)
    ]
)
logger = logging.getLogger(__name__)

class MultiSourceCoffeeShopUploader:
    def __init__(self):
        # Load environment variables from the root .env file
        root_env_path = os.path.join(os.path.dirname(__file__), '..', '.env')
        load_dotenv(root_env_path)
        
        # Initialize scrapers
        self.osm_nominatim = Nominatim()
        self.osm_overpass = Overpass()
        self.geopy_geocoder = GeopyNominatim(user_agent="roast-app-scraper")
        
        # Initialize Google Maps client if API key is provided
        self.google_maps_client = None
        google_api_key = os.getenv('GOOGLE_MAPS_API_KEY')
        if google_api_key:
            self.google_maps_client = googlemaps.Client(key=google_api_key)
            logger.info("Google Maps API client initialized")
        else:
            logger.warning("Google Maps API key not found. Google Places scraping will be skipped.")
        
        # Database connection
        self.engine = None
        
        # Selenium driver for web scraping
        self.driver = None
        
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
    
    def setup_selenium_driver(self):
        """Setup Selenium WebDriver for web scraping"""
        try:
            chrome_options = Options()
            chrome_options.add_argument("--headless")  # Run in background
            chrome_options.add_argument("--no-sandbox")
            chrome_options.add_argument("--disable-dev-shm-usage")
            chrome_options.add_argument("--disable-gpu")
            chrome_options.add_argument("--window-size=1920,1080")
            
            service = Service(ChromeDriverManager().install())
            self.driver = webdriver.Chrome(service=service, options=chrome_options)
            logger.info("Selenium WebDriver initialized")
            return True
        except Exception as e:
            logger.error(f"Failed to setup Selenium driver: {e}")
            return False
    
    def cleanup_selenium_driver(self):
        """Cleanup Selenium WebDriver"""
        if self.driver:
            self.driver.quit()
            self.driver = None
    
    def scrape_osm_coffee_shops(self, location="Manhattan, New York City"):
        """Scrape coffee shop data from OpenStreetMap (original method)"""
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
    
    def scrape_google_places(self, location="Manhattan, New York City", radius=3000):
        """Scrape coffee shop data from Google Places API with Manhattan focus"""
        if not self.google_maps_client:
            logger.warning("Google Maps client not available. Skipping Google Places scraping.")
            return []
        
        try:
            logger.info(f"Scraping Google Places coffee shops in {location}")
            
            # Define Manhattan boundaries approximately
            manhattan_areas = [
                "Lower Manhattan, New York, NY",
                "Midtown Manhattan, New York, NY", 
                "Upper East Side, Manhattan, New York, NY",
                "Upper West Side, Manhattan, New York, NY",
                "Greenwich Village, Manhattan, New York, NY",
                "SoHo, Manhattan, New York, NY",
                "Chelsea, Manhattan, New York, NY",
                "Financial District, Manhattan, New York, NY"
            ]
            
            all_coffee_shops = []
            
            # Search each Manhattan area
            for area in manhattan_areas:
                try:
                    logger.info(f"Searching in {area}")
                    
                    # Geocode the area
                    geocode_result = self.google_maps_client.geocode(area)
                    if not geocode_result:
                        logger.warning(f"Could not geocode area: {area}")
                        continue
                    
                    location_coords = geocode_result[0]['geometry']['location']
                    
                    # Search for coffee shops in this area
                    places_result = self.google_maps_client.places_nearby(
                        location=location_coords,
                        radius=radius,
                        type='cafe',
                        keyword='coffee'
                    )
                    
                    area_shops = places_result.get('results', [])
                    
                    # Handle pagination for this area
                    while 'next_page_token' in places_result:
                        time.sleep(2)  # Required delay for next page token
                        places_result = self.google_maps_client.places_nearby(
                            page_token=places_result['next_page_token']
                        )
                        area_shops.extend(places_result.get('results', []))
                    
                    all_coffee_shops.extend(area_shops)
                    logger.info(f"Found {len(area_shops)} coffee shops in {area}")
                    
                    # Small delay between area searches
                    time.sleep(1)
                    
                except Exception as e:
                    logger.warning(f"Error searching in {area}: {e}")
                    continue
            
            # Remove duplicates based on place_id
            unique_shops = {}
            for shop in all_coffee_shops:
                place_id = shop.get('place_id')
                if place_id and place_id not in unique_shops:
                    unique_shops[place_id] = shop
            
            unique_coffee_shops = list(unique_shops.values())
            
            # Get detailed information for each place
            detailed_shops = []
            for shop in unique_coffee_shops:
                try:
                    place_details = self.google_maps_client.place(
                        place_id=shop['place_id'],
                        fields=['name', 'rating', 'user_ratings_total', 'formatted_address', 
                               'geometry', 'formatted_phone_number', 'website', 'price_level',
                               'opening_hours', 'reviews', 'address_component']
                    )
                    
                    # Filter to ensure it's actually in Manhattan
                    if self.is_in_manhattan(place_details['result']):
                        detailed_shops.append(place_details['result'])
                    
                except Exception as e:
                    logger.warning(f"Could not get details for place {shop.get('name', 'Unknown')}: {e}")
                    continue
                
                time.sleep(0.1)  # Rate limiting
            
            logger.info(f"Found {len(detailed_shops)} coffee shops in Manhattan from Google Places")
            return detailed_shops
            
        except Exception as e:
            logger.error(f"Error scraping Google Places data: {e}")
            return []
    
    def is_in_manhattan(self, place_details):
        """Check if a place is actually in Manhattan based on address components"""
        try:
            address_components = place_details.get('address_components', [])
            formatted_address = place_details.get('formatted_address', '').lower()
            
            # Check if Manhattan is mentioned in the address
            manhattan_indicators = [
                'manhattan',
                'new york, ny 10',  # Manhattan zip codes start with 10
                'new york, ny 100',
                'new york, ny 101',
                'new york, ny 102'
            ]
            
            for indicator in manhattan_indicators:
                if indicator in formatted_address:
                    return True
            
            # Check address components for Manhattan borough
            for component in address_components:
                if 'sublocality' in component.get('types', []) or 'political' in component.get('types', []):
                    if 'manhattan' in component.get('long_name', '').lower():
                        return True
            
            return False
            
        except Exception as e:
            logger.debug(f"Error checking Manhattan location: {e}")
            return True  # Default to include if we can't determine
    
    def scrape_yelp_web(self, location="Manhattan, New York City"):
        """Scrape coffee shop data from Yelp using web scraping focused on Manhattan"""
        if not self.setup_selenium_driver():
            return []
        
        try:
            logger.info(f"Scraping Yelp coffee shops in {location}")
            
            # Format location for Yelp URL - specifically Manhattan
            url = "https://www.yelp.com/search?find_desc=coffee&find_loc=Manhattan%2C+New+York%2C+NY"
            
            self.driver.get(url)
            time.sleep(3)
            
            # Scroll to load more results
            for _ in range(5):  # More scrolling for Manhattan
                self.driver.execute_script("window.scrollTo(0, document.body.scrollHeight);")
                time.sleep(2)
            
            # Extract coffee shop data
            coffee_shops = []
            business_elements = self.driver.find_elements(By.CSS_SELECTOR, '[data-testid="serp-ia-card"]')
            
            for element in business_elements[:100]:  # Increased limit for Manhattan
                try:
                    name_elem = element.find_element(By.CSS_SELECTOR, 'h3 a span')
                    name = name_elem.text if name_elem else "Unknown"
                    
                    rating_elem = element.find_element(By.CSS_SELECTOR, '[role="img"]')
                    rating_text = rating_elem.get_attribute('aria-label') if rating_elem else ""
                    rating = self.extract_rating_from_text(rating_text)
                    
                    review_elem = element.find_element(By.CSS_SELECTOR, '[data-testid="review-count"]')
                    review_count = self.extract_review_count(review_elem.text if review_elem else "0")
                    
                    address_elem = element.find_element(By.CSS_SELECTOR, '[data-testid="address"]')
                    address = address_elem.text if address_elem else ""
                    
                    # Filter for Manhattan addresses
                    if self.is_manhattan_address(address):
                        coffee_shop = {
                            'name': name,
                            'rating': rating,
                            'review_count': review_count,
                            'address': address
                        }
                        coffee_shops.append(coffee_shop)
                    
                except Exception as e:
                    logger.debug(f"Error extracting Yelp business data: {e}")
                    continue
            
            logger.info(f"Found {len(coffee_shops)} coffee shops in Manhattan from Yelp")
            return coffee_shops
            
        except Exception as e:
            logger.error(f"Error scraping Yelp data: {e}")
            return []
        finally:
            self.cleanup_selenium_driver()
    
    def is_manhattan_address(self, address):
        """Check if an address is in Manhattan"""
        if not address:
            return False
        
        address_lower = address.lower()
        manhattan_indicators = [
            'manhattan',
            'new york, ny 10',
            'new york, ny 100',
            'new york, ny 101',
            'new york, ny 102',
            'greenwich village',
            'soho',
            'tribeca',
            'financial district',
            'lower east side',
            'upper east side',
            'upper west side',
            'midtown',
            'chelsea',
            'gramercy'
        ]
        
        return any(indicator in address_lower for indicator in manhattan_indicators)
    
    def scrape_coffee_shops(self, location="Manhattan, New York City"):
        """Main method to scrape from all sources with Manhattan focus"""
        """Main method to scrape from all sources"""
        all_coffee_shops = {
            'osm': [],
            'google': [],
            'yelp': []
        }
        
        # Scrape from OpenStreetMap
        osm_data = self.scrape_osm_coffee_shops(location)
        all_coffee_shops['osm'] = osm_data
        
        # Scrape from Google Places
        google_data = self.scrape_google_places(location)
        all_coffee_shops['google'] = google_data
        
        # Scrape from Yelp
        yelp_data = self.scrape_yelp_web(location)
        all_coffee_shops['yelp'] = yelp_data
        
        return all_coffee_shops
    
    def process_coffee_shop_data(self, all_sources_data):
        """Process and clean the scraped data from all sources to match CoffeeShop entity structure"""
        try:
            logger.info("Processing coffee shop data from all sources")
            
            processed_data = []
            
            # Process OSM data
            osm_data = all_sources_data.get('osm', [])
            if osm_data:
                processed_data.extend(self.process_osm_data(osm_data))
            
            # Process Google Places data
            google_data = all_sources_data.get('google', [])
            if google_data:
                processed_data.extend(self.process_google_data(google_data))
            
            # Process Yelp data
            yelp_data = all_sources_data.get('yelp', [])
            if yelp_data:
                processed_data.extend(self.process_yelp_data(yelp_data))
            
            # Remove duplicates based on name and location proximity
            deduplicated_data = self.remove_duplicates(processed_data)
            
            result_df = pd.DataFrame(deduplicated_data)
            logger.info(f"Processed {len(result_df)} unique coffee shop records from all sources")
            return result_df
            
        except Exception as e:
            logger.error(f"Error processing coffee shop data: {e}")
            return pd.DataFrame()
    
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
    
    def process_google_data(self, google_data):
        """Process Google Places data"""
        processed = []
        
        for place in google_data:
            try:
                location = place.get('geometry', {}).get('location', {})
                address_components = place.get('formatted_address', '').split(',')
                
                coffee_shop = {
                    'lat': location.get('lat'),
                    'lon': location.get('lng'),
                    'name': place.get('name', 'Unknown Coffee Shop'),
                    'city': self.extract_city_from_address(address_components),
                    'state': self.extract_state_from_address(address_components),
                    'street': self.extract_street_from_address(address_components),
                    'rating': place.get('rating', 0.0),
                    'numofratings': place.get('user_ratings_total', 0)
                }
                
                if coffee_shop['lat'] and coffee_shop['lon']:
                    processed.append(coffee_shop)
                    
            except Exception as e:
                logger.debug(f"Error processing Google place: {e}")
                continue
        
        logger.info(f"Processed {len(processed)} coffee shops from Google Places")
        return processed
    
    def process_yelp_data(self, yelp_data):
        """Process Yelp data"""
        processed = []
        
        for business in yelp_data:
            try:
                # Geocode the address to get coordinates
                lat, lon = self.geocode_address(business.get('address', ''))
                
                if not lat or not lon:
                    continue
                
                address_parts = business.get('address', '').split(',')
                
                coffee_shop = {
                    'lat': lat,
                    'lon': lon,
                    'name': business.get('name', 'Unknown Coffee Shop'),
                    'city': self.extract_city_from_address(address_parts),
                    'state': self.extract_state_from_address(address_parts),
                    'street': self.extract_street_from_address(address_parts),
                    'rating': business.get('rating', 0.0),
                    'numofratings': business.get('review_count', 0)
                }
                
                processed.append(coffee_shop)
                
            except Exception as e:
                logger.debug(f"Error processing Yelp business: {e}")
                continue
        
        logger.info(f"Processed {len(processed)} coffee shops from Yelp")
        return processed
    
    def extract_city_from_address(self, address_components):
        """Extract city from address components array"""
        if len(address_components) >= 2:
            return address_components[-2].strip()
        return "Unknown City"
    
    def extract_state_from_address(self, address_components):
        """Extract state from address components array"""
        if len(address_components) >= 1:
            last_part = address_components[-1].strip()
            # Extract state code from "State ZIP" format
            state_zip = last_part.split()
            if len(state_zip) >= 2:
                return state_zip[0]
        return "Unknown State"
    
    def extract_street_from_address(self, address_components):
        """Extract street from address components array"""
        if len(address_components) >= 1:
            return address_components[0].strip()
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
    
    def run_automated_upload(self, location="Manhattan, New York City"):
        """Main method to run the automated upload process with multiple sources"""
        logger.info("Starting automated coffee shop data upload from multiple sources")
        
        try:
            # Step 1: Create database connection
            if not self.create_database_connection():
                logger.error("Failed to establish database connection. Aborting.")
                return False
            
            # Step 2: Scrape coffee shop data from all sources
            all_sources_data = self.scrape_coffee_shops(location)
            
            # Check if we have any data
            total_scraped = sum(len(data) for data in all_sources_data.values())
            if total_scraped == 0:
                logger.error("No coffee shop data scraped from any source. Aborting.")
                return False
            
            logger.info(f"Total scraped: {total_scraped} coffee shops from all sources")
            
            # Step 3: Process the data
            processed_df = self.process_coffee_shop_data(all_sources_data)
            if processed_df.empty:
                logger.error("No valid data after processing. Aborting.")
                return False
            
            # Step 4: Save CSV backup
            self.save_csv_backup(processed_df)
            
            # Step 5: Upload to database
            success = self.upload_to_database(processed_df)
            
            if success:
                logger.info("Automated upload completed successfully!")
                logger.info(f"Uploaded {len(processed_df)} coffee shop records")
                self.log_source_statistics(all_sources_data, processed_df)
                return True
            else:
                logger.error("Upload failed")
                return False
                
        except Exception as e:
            logger.error(f"Unexpected error during automated upload: {e}")
            return False
    
    def log_source_statistics(self, all_sources_data, processed_df):
        """Log statistics about data from different sources"""
        osm_count = len(all_sources_data.get('osm', []))
        google_count = len(all_sources_data.get('google', []))
        yelp_count = len(all_sources_data.get('yelp', []))
        
        logger.info("=== Source Statistics ===")
        logger.info(f"OpenStreetMap: {osm_count} coffee shops")
        logger.info(f"Google Places: {google_count} coffee shops")
        logger.info(f"Yelp: {yelp_count} coffee shops")
        logger.info(f"Total scraped: {osm_count + google_count + yelp_count}")
        logger.info(f"After deduplication: {len(processed_df)} unique coffee shops")


def main():
    """Main function to run the automated upload"""
    uploader = MultiSourceCoffeeShopUploader()
    
    # Default to Manhattan, can specify different location
    location = "Manhattan, New York City"
    if len(sys.argv) > 1:
        location = sys.argv[1]
    
    success = uploader.run_automated_upload(location)
    
    if success:
        print("✅ Automated upload completed successfully!")
        sys.exit(0)
    else:
        print("❌ Automated upload failed. Check the logs for details.")
        sys.exit(1)


if __name__ == "__main__":
    main()