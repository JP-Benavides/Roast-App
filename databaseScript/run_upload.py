#!/usr/bin/env python3
"""
Simple runner for the automated upload script
Usage: python3 run_upload.py [location]
"""

import sys
import os

# Add the current directory to the path
sys.path.append(os.path.dirname(__file__))

from automated_upload import MultiSourceCoffeeShopUploader

def main():
    """Run the automated upload"""
    location = "Manhattan, New York City"
    if len(sys.argv) > 1:
        location = sys.argv[1]
    
    print(f"🚀 Starting automated coffee shop upload for: {location}")
    
    uploader = MultiSourceCoffeeShopUploader()
    success = uploader.run_automated_upload(location)
    
    if success:
        print("✅ Upload completed successfully!")
    else:
        print("❌ Upload failed. Check the logs for details.")
        sys.exit(1)

if __name__ == "__main__":
    main()