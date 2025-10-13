# Multi-Source Coffee Shop Database Upload Scripts

This directory contains scripts to automatically scrape coffee shop data from multiple sources and upload it to your PostgreSQL database.

## Data Sources

The enhanced scraper now collects data from:

1. **OpenStreetMap (OSM)** - Free, community-driven map data
2. **Google Places API** - Comprehensive business data with ratings and reviews (requires API key)
3. **Yelp** - Web scraping for ratings, reviews, and business details

## Files

- `automated_upload.py` - Enhanced multi-source scraping and database upload script
- `run_upload.py` - Simple Python runner script
- `run_upload.sh` - Shell script with environment setup
- `requirements.txt` - Python dependencies (updated with new packages)
- `README.md` - This documentation

## Prerequisites

1. **Python 3.7+** installed on your system
2. **PostgreSQL database** running and accessible
3. **Chrome browser** installed (for web scraping)
4. **Environment variables** configured in the root `.env` file
5. **Google Maps API key** (optional but recommended for best results)

## Environment Configuration

The script uses the `.env` file from the root directory of the Roast-App project. Required variables:

```env
# Database Configuration
DB_HOST=localhost
DB_PORT=5433
DB_NAME=roastdb
DB_USER="your_username"
DB_PASSWORD=your_password

# Google Maps API Key (optional but recommended)
GOOGLE_MAPS_API_KEY=your_google_maps_api_key_here
```

### Setting up Google Maps API (Recommended)

1. Go to [Google Cloud Console](https://console.cloud.google.com/)
2. Create a new project or select existing one
3. Enable the following APIs:
   - Places API
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