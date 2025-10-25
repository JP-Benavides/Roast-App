#!/bin/bash

# Roast Database Master Script Runner
# This script sets up the environment and runs the master database operations

set -e  # Exit on any error

echo "🚀 Starting Roast Database Master Script Setup..."

# Check if Python is installed
if ! command -v python3 &> /dev/null; then
    echo "❌ Python 3 is required but not installed. Please install Python 3."
    exit 1
fi

# Get the directory of this script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

echo "📁 Working directory: $SCRIPT_DIR"

# Create virtual environment if it doesn't exist
if [ ! -d "venv" ]; then
    echo "🔧 Creating virtual environment..."
    python3 -m venv venv
fi

# Activate virtual environment
echo "🔧 Activating virtual environment..."
source venv/bin/activate

# Install/upgrade pip
echo "📦 Upgrading pip..."
pip install --upgrade pip

# Install requirements
echo "📦 Installing dependencies..."
pip install -r requirements.txt

# Check if root .env file exists
ROOT_ENV_FILE="$SCRIPT_DIR/../.env"
if [ ! -f "$ROOT_ENV_FILE" ]; then
    echo "❌ .env file not found at $ROOT_ENV_FILE"
    echo "Please create a .env file in the root directory with your database configuration."
    exit 1
else
    echo "✅ Found .env file at $ROOT_ENV_FILE"
fi

# Load environment variables from root .env
if [ -f "$ROOT_ENV_FILE" ]; then
    export $(cat "$ROOT_ENV_FILE" | grep -v '^#' | grep -v '^$' | xargs)
fi

# Run the master database script
echo "🚀 Starting master database operations..."
python3 master_database.py

echo "✅ Master database operations completed!"