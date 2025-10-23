#!/usr/bin/env python3
"""
Script to calculate and add tile IDs to coffee shops in PostgreSQL database.
This matches the Java tile calculation logic from CoffeeShopService.java
"""

import psycopg2
import math
import sys
import os
from typing import Optional
from dotenv import load_dotenv

# Load environment variables from .env file
load_dotenv()

# Database configuration - loaded from environment variables
DB_CONFIG = {
    'host': os.getenv('DB_HOST', 'localhost'),
    'port': int(os.getenv('DB_PORT', 5432)),
    'database': os.getenv('DB_NAME', 'roast_db'),
    'user': os.getenv('DB_USER', 'postgres'),
    'password': os.getenv('DB_PASSWORD', 'password')
}


# Tile configuration - MUST MATCH your Java service
TILE_SIZE = 0.003  # This should match the TILE_SIZE in CoffeeShopService.java

def calculate_tile_id(lat: float, lon: float) -> Optional[str]:
    """
    Calculate tile ID for given coordinates.
    This MUST match the calculateTileId method in CoffeeShopService.java
    """
    if lat is None or lon is None:
        return None
    
    tile_x = int(math.floor(lat / TILE_SIZE))
    tile_y = int(math.floor(lon / TILE_SIZE))
    
    return f"{tile_x}_{tile_y}"

def connect_to_database():
    """Connect to PostgreSQL database"""
    try:
        conn = psycopg2.connect(**DB_CONFIG)
        print(f"✅ Connected to database: {DB_CONFIG['database']}")
        return conn
    except Exception as e:
        print(f"❌ Error connecting to database: {e}")
        print("Please check your database configuration in DB_CONFIG")
        sys.exit(1)

def check_tile_column_exists(cursor):
    """Check if tile_id column exists, create it if not"""
    try:
        # Check if tile_id column exists
        cursor.execute("""
            SELECT column_name 
            FROM information_schema.columns 
            WHERE table_name = 'coffees' AND column_name = 'tile_id'
        """)
        
        if cursor.fetchone() is None:
            print("📝 Creating tile_id column...")
            cursor.execute("ALTER TABLE coffees ADD COLUMN tile_id VARCHAR(50)")
            print("✅ tile_id column created")
        else:
            print("✅ tile_id column already exists")
            
    except Exception as e:
        print(f"❌ Error checking/creating tile_id column: {e}")
        sys.exit(1)

def get_coffee_shops(cursor):
    """Get all coffee shops with their coordinates"""
    try:
        cursor.execute("""
            SELECT coffeepk, name, lat, lon 
            FROM coffees 
            WHERE lat IS NOT NULL AND lon IS NOT NULL
        """)
        
        shops = cursor.fetchall()
        print(f"📊 Found {len(shops)} coffee shops with coordinates")
        return shops
        
    except Exception as e:
        print(f"❌ Error fetching coffee shops: {e}")
        sys.exit(1)

def update_tile_ids(cursor, shops):
    """Calculate and update tile IDs for all coffee shops"""
    print("🔄 Calculating and updating tile IDs...")
    
    updated_count = 0
    tile_stats = {}
    
    for coffeepk, name, lat, lon in shops:
        try:
            # Calculate tile ID
            tile_id = calculate_tile_id(lat, lon)
            
            if tile_id:
                # Update the coffee shop with its tile ID
                cursor.execute("""
                    UPDATE coffees 
                    SET tile_id = %s 
                    WHERE coffeepk = %s
                """, (tile_id, coffeepk))
                
                updated_count += 1
                
                # Track tile statistics
                tile_stats[tile_id] = tile_stats.get(tile_id, 0) + 1
                
                # Progress indicator
                if updated_count % 50 == 0:
                    print(f"   Processed {updated_count} shops...")
                
        except Exception as e:
            print(f"⚠️  Error updating shop {name} (ID: {coffeepk}): {e}")
    
    print(f"✅ Updated {updated_count} coffee shops with tile IDs")
    print(f"📊 Tiles created: {len(tile_stats)}")
    
    # Show top 10 tiles by coffee shop count
    top_tiles = sorted(tile_stats.items(), key=lambda x: x[1], reverse=True)[:10]
    print("\n🏆 Top 10 tiles by coffee shop count:")
    for tile_id, count in top_tiles:
        print(f"   {tile_id}: {count} shops")
    
    return updated_count

def verify_updates(cursor):
    """Verify that tile IDs were added correctly"""
    print("\n🔍 Verifying tile ID updates...")
    
    # Count total shops with tile IDs
    cursor.execute("SELECT COUNT(*) FROM coffees WHERE tile_id IS NOT NULL")
    with_tiles = cursor.fetchone()[0]
    
    # Count total shops
    cursor.execute("SELECT COUNT(*) FROM coffees")
    total = cursor.fetchone()[0]
    
    print(f"📊 Shops with tile IDs: {with_tiles}/{total}")
    
    # Show sample shops with their tile IDs
    cursor.execute("""
        SELECT name, lat, lon, tile_id 
        FROM coffees 
        WHERE tile_id IS NOT NULL 
        LIMIT 5
    """)
    
    samples = cursor.fetchall()
    print("\n📋 Sample shops with tile IDs:")
    for name, lat, lon, tile_id in samples:
        print(f"   {name}: ({lat:.6f}, {lon:.6f}) -> {tile_id}")

def main():
    """Main script execution"""
    print("🚀 Starting Tile ID Update Script")
    print(f"📏 Using tile size: {TILE_SIZE}")
    print(f"🗄️  Target database: {DB_CONFIG['database']}")
    
    # Connect to database
    conn = connect_to_database()
    cursor = conn.cursor()
    
    try:
        # Check/create tile_id column
        check_tile_column_exists(cursor)
        
        # Get all coffee shops
        shops = get_coffee_shops(cursor)
        
        if not shops:
            print("⚠️  No coffee shops found with coordinates")
            return
        
        # Calculate and update tile IDs
        updated_count = update_tile_ids(cursor, shops)
        
        # Commit changes
        conn.commit()
        print(f"💾 Changes committed to database")
        
        # Verify updates
        verify_updates(cursor)
        
        print(f"\n🎉 Successfully updated {updated_count} coffee shops with tile IDs!")
        print("\n🔧 Next steps:")
        print("   1. Restart your Spring Boot application")
        print("   2. Test the tile-based API endpoints")
        print("   3. Your map should now load all coffee shops!")
        
    except Exception as e:
        print(f"❌ Error during execution: {e}")
        conn.rollback()
        print("🔄 Changes rolled back")
        
    finally:
        cursor.close()
        conn.close()
        print("🔌 Database connection closed")

if __name__ == "__main__":
    # Safety confirmation
    print("⚠️  This script will modify your database by adding tile IDs to coffee shops.")
    response = input("Do you want to continue? (yes/no): ").lower().strip()
    
    if response in ['yes', 'y']:
        main()
    else:
        print("❌ Script cancelled by user")