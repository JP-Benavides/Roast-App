# Roast Database Scripts

This directory contains scripts for managing the Roast app's coffee shop database.

## Files

- `master_database.py` - **NEW MASTER SCRIPT** - Combines all database operations
- `AddTileIDs.py` - Adds tile IDs to coffee shops for efficient map loading
- `zipcodes.py` - Extracts ZIP codes from city field
- `run_upload.py` - Runner script for data scraping (requires automated_upload.py)
- `requirements.txt` - Python dependencies
- `README.md` - This documentation

## Master Script (`master_database.py`)

The new master script combines all database maintenance operations into one convenient script:

### Features
- ✅ **OSM Data Scraping**: Scrapes coffee shop data from OpenStreetMap (free, no API keys needed)
- ✅ **Data Processing**: Cleans and deduplicates the scraped data
- ✅ **Database Upload**: Safely uploads data with backups
- ✅ **Interactive Menu**: Easy-to-use menu system for different operations

### Data Sources
- **OpenStreetMap (OSM)** - Free, community-driven map data (no API keys required)

### Usage

```bash
# Install dependencies
pip install -r requirements.txt

# Run the master script
python master_database.py
```

The script provides an interactive menu with options to:
1. Run full upload (scrape → process → upload)
2. Scrape OSM data only
3. Process existing data
4. Upload data to database
5. Backup database
6. View database stats

## Individual Scripts

### AddTileIDs.py
Calculates tile IDs for coffee shops to enable efficient map loading.

```bash
python AddTileIDs.py
```

### zipcodes.py
Extracts 5-digit ZIP codes from the city field using regex.

```bash
python zipcodes.py
```

### run_upload.py
Runner for the automated upload functionality (requires `automated_upload.py` which is currently missing).

## Prerequisites

1. **Python 3.7+** installed
2. **PostgreSQL database** running
3. **Environment variables** in `.env` file:

```env
DB_HOST=localhost
DB_PORT=5432
DB_NAME=roast_db
DB_USER=postgres
DB_PASSWORD=your_password
```

## Installation

```bash
# Install Python dependencies
pip install -r requirements.txt
```

## Database Schema

The scripts expect a `coffees` table with these columns:
- `coffeepk` (primary key)
- `name`, `city`, `lat`, `lon`
- `tile_id` (added by AddTileIDs.py)
- `zipcode` (added by zipcodes.py)

## Troubleshooting

### Database Connection Issues
- Verify PostgreSQL is running
- Check `.env` file has correct credentials
- Ensure database and user exist

### Missing Dependencies
```bash
pip install -r requirements.txt
```

### Permission Issues
- Ensure your database user has CREATE and UPDATE permissions

## Next Steps

1. Run the master script to set up tile IDs and ZIP codes
2. Implement the scraping functionality in `master_database.py` if needed
3. Test with your Spring Boot application
4. Verify map loading performance improvements
   - Geocoding API
   - Maps JavaScript API
4. Create credentials (API Key)
5. Add the API key to your `.env` file

**Note:** Google Places API provides the richest data including accurate ratings, review counts, phone numbers, websites, and more detailed location information.

## Installation

1. Navigate to the databaseScript directory:
   ```bash
   cd /path/to/Roast-App/databaseScript
   ```

2. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```

   Or use the automated setup script:
   ```bash
   ./run_upload.sh
   ```

## Usage

### Option 1: Direct Python execution
```bash
python3 automated_upload.py
```

Or specify a different location:
```bash
python3 automated_upload.py "Los Angeles"
```

### Option 2: Using the runner script
```bash
python3 run_upload.py
```

### Option 3: Using the shell script (includes setup)
```bash
./run_upload.sh
```

## What the Enhanced Script Does

1. **Multi-source data scraping**:
   - Scrapes OpenStreetMap for basic coffee shop locations
   - Uses Google Places API for detailed business information
   - Web scrapes Yelp for additional ratings and reviews

2. **Intelligent data processing**:
   - Combines data from all sources
   - Removes duplicates based on name similarity and location proximity
   - Prioritizes data quality (keeps entries with better ratings/more reviews)

3. **Geocoding and validation**:
   - Converts addresses to coordinates when needed
   - Validates data quality before database insertion

4. **Database operations**:
   - Creates backups of existing data
   - Uploads processed data to PostgreSQL
   - Provides detailed logging and statistics

5. **Comprehensive logging**:
   - Logs operations to console and file
   - Reports statistics from each data source
   - Shows deduplication results

## Enhanced Database Schema

The script uploads data to the `coffees` table with enhanced structure:
- `lat` (Double) - Latitude coordinate
- `lon` (Double) - Longitude coordinate  
- `name` (String) - Coffee shop name
- `city` (String) - City name
- `state` (String) - State abbreviation
- `street` (String) - Street address
- `rating` (Double) - Average rating (from best available source)
- `numofratings` (Integer) - Number of ratings
- `source` (String) - Data source (osm/google/yelp)
- `phone` (String) - Phone number (when available)
- `website` (String) - Website URL (when available)
- `price_level` (Integer) - Price level indicator (when available)

## Data Quality and Deduplication

The script includes intelligent deduplication that:
- Identifies duplicates by name similarity and location proximity (within 100 meters)
- Keeps the entry with better rating or more reviews
- Logs the number of duplicates removed
- Ensures data quality by validating coordinates and essential information

## Sample Output

```
🚀 Starting automated coffee shop upload for: New York City
📊 Found 150 coffee shops from OSM
📊 Found 245 coffee shops from Google Places
📊 Found 189 coffee shops from Yelp
🔄 Processed 584 total coffee shops
🔄 Removed 126 duplicates
✅ Uploaded 458 unique coffee shop records

=== Source Statistics ===
OpenStreetMap: 150 coffee shops
Google Places: 245 coffee shops
Yelp: 189 coffee shops
Total scraped: 584
After deduplication: 458 unique coffee shops

Final data source distribution:
  google: 234 shops
  yelp: 145 shops
  osm: 79 shops
```

## Error Handling and Fallbacks

- **No Google API key**: Script continues with OSM and Yelp data only
- **Web scraping failures**: Script continues with available sources
- **Rate limiting**: Built-in delays and retry logic
- **Invalid coordinates**: Geocoding fallback for address-only data

## Troubleshooting

1. **Chrome driver issues**: The script auto-downloads ChromeDriver via webdriver-manager
2. **Rate limiting**: Built-in delays prevent API/scraping rate limits
3. **Missing Google API key**: Script logs warning but continues with other sources
4. **Geocoding failures**: Some Yelp entries may be skipped if addresses can't be geocoded

## Performance Considerations

- **Google Places API**: Limited by daily quotas and per-request costs
- **Web scraping**: Respectful delays built in, limited to ~50 results per source
- **Processing time**: Expect 2-5 minutes for major cities depending on data volume
- **Memory usage**: Efficient processing handles thousands of records

## Customization Options

You can modify the script to:
- Adjust deduplication distance threshold
- Change the number of results per source
- Add additional data sources
- Modify data processing and validation rules
- Customize logging levels and output formats