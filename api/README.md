# ☕ Roast App Backend

A high-performance Spring Boot backend application for discovering and rating coffee shops with advanced features like Apple Maps-style clustering, Redis caching, and intelligent data scraping.

## 🚀 Features

- **Apple Maps-Style Clustering**: Intelligent viewport-based coffee shop clustering with zoom-aware rendering
- **Redis Caching**: High-performance caching with smart coordinate rounding for optimal cache hits
- **Multi-Source Data Scraping**: Automated coffee shop data collection from Google Places API, OpenStreetMap, and Yelp
- **Geographic Optimization**: Bounded queries and viewport-based data retrieval
- **Comprehensive Rating System**: User ratings with junction table architecture
- **RESTful API**: Clean, well-documented endpoints with nested DTO architecture
- **Separated Services**: Modular architecture with focused service classes

## 🛠️ Prerequisites

- **Java 23** or higher
- **PostgreSQL 14+** database
- **Redis Server** (for caching)
- **Maven 3.8+**

## ⚙️ Environment Configuration

### 1. Database Setup
```sql
-- Create the main database
CREATE DATABASE roastdb;

-- Create user and grant permissions
CREATE USER roast_user WITH PASSWORD 'your_secure_password';
GRANT ALL PRIVILEGES ON DATABASE roastdb TO roast_user;
```

### 2. Redis Setup
```bash
# Install Redis (macOS)
brew install redis

# Start Redis server
redis-server
```

### 3. Environment Variables
Create a `.env` file in the project root:
```bash
# Database Configuration
DB_HOST=localhost
DB_PORT=5433
DB_NAME=roastdb
DB_USER=roast_user
DB_PASSWORD=your_secure_password

# Redis Configuration
REDIS_HOST=localhost
REDIS_PORT=6379

# Application Configuration
SERVER_PORT=8080
```

## 🏃‍♂️ Running the Application

### Development Mode
```bash
# Clean and install dependencies
./mvnw clean install

# Run with development profile
./mvnw spring-boot:run -Dspring-boot.run.profiles=dev

# Or compile and run
./mvnw compile
./mvnw spring-boot:run
```

### Production Mode
```bash
# Build JAR
./mvnw clean package -DskipTests

# Run JAR
java -jar target/roast-*.jar
```

The application will start on `http://localhost:8080`

## 📊 Database Population

### Automated Data Scraping
```bash
# Navigate to database scripts
cd databaseScript/

# Run multi-source scraping (populates ~1,277 Manhattan coffee shops)
python automated_upload.py

# Individual scrapers
python google_places_scraper.py    # Google Places API
python osm_scraper.py             # OpenStreetMap
python yelp_scraper.py           # Yelp web scraping
```

## 🔌 API Endpoints

### Coffee Shops
```http
GET    /api/coffeeshops                    # Get all coffee shops
GET    /api/coffeeshops-byname?name=...    # Search by name
POST   /api/coffeeshops                    # Create new coffee shop
PATCH  /api/rating-change?shopId=&rating=  # Update rating
```

### Apple Maps-Style Viewport (New!)
```http
GET    /api/coffeeshops/viewport?north=40.8&south=40.7&east=-73.9&west=-74.0&zoom=14
# Returns: Intelligent clustering based on zoom level and area
# - High zoom: Individual shops
# - Low zoom: Clustered groups with counts
# - Optimized: Redis caching with coordinate rounding
```

### Users
```http
POST   /api/users                         # Create new user
GET    /api/users?email=...              # Get user by email  
DELETE /api/users/{userId}               # Delete user
```

### Favorites
```http
GET    /api/users/{userId}/favorites                    # Get user favorites
POST   /api/users/{userId}/favorites/{shopId}          # Add to favorites
DELETE /api/users/{userId}/favorites/{shopId}          # Remove from favorites
```

### User Ratings
```http
POST   /api/users/{userId}/ratings/{shopId}?rating=4.5  # Add/update rating
GET    /api/users/{userId}/ratings                      # Get user's ratings
DELETE /api/users/{userId}/ratings/{shopId}             # Remove rating
```

## 🏗️ Architecture

### Service Layer (Separated & Focused)
- **CoffeeShopService**: Core shop operations, viewport clustering, geographic queries
- **UserService**: User management and authentication
- **FavoriteService**: User-shop relationship management  
- **UserRatingService**: Rating system with junction table architecture

### Caching Strategy
- **Redis Integration**: Smart coordinate rounding (~100m precision) for cache hits
- **Geographic Bounds**: Efficient viewport-based caching
- **Cache Keys**: `viewport:{roundedCoords}:{zoom}` pattern

### Data Transfer Objects (DTOs)
- **Nested Architecture**: Eliminates repetition with smart nesting
- **CoffeeShopDto**: Complete shop information
- **CoffeeShopMapDto**: Optimized for map rendering
- **ViewportResponse**: Apple Maps-style clustering response
- **CoffeeShopCluster**: Clustered shop groupings

## 🗄️ Database Schema

### Core Tables
```sql
users                 # User accounts and profiles
├── id (BIGINT)
├── email (VARCHAR)
└── created_at (TIMESTAMP)

coffees               # Coffee shop information  
├── id (BIGINT)
├── name (VARCHAR)
├── lat, lon (DOUBLE) # Precise coordinates
├── rating (DOUBLE)   # Average rating
├── street (VARCHAR)
└── created_at (TIMESTAMP)

user_favorite_shops   # Many-to-many favorites
├── user_id (BIGINT)
├── shop_id (BIGINT)
└── created_at (TIMESTAMP)

user_ratings          # Junction table for ratings
├── user_id (BIGINT)
├── shop_id (BIGINT)  
├── rating (DOUBLE)   # Individual user rating
└── created_at (TIMESTAMP)
```

### Indexes (Optimized for Performance)
- **Geographic**: `(lat, lon)` for spatial queries
- **Favorites**: `(user_id, shop_id)` composite
- **Ratings**: `(user_id, shop_id)` composite

## 🛡️ Security & Configuration

### Environment Variables
- **Database credentials**: Secure PostgreSQL connection
- **Redis configuration**: Caching server details  
- **API keys**: External service authentication
- **CORS settings**: Cross-origin request handling

### Best Practices
- Environment variables for all secrets
- `.env` files excluded from Git
- Prepared statements prevent SQL injection
- Input validation on all endpoints

## 🚀 Performance Features

### Intelligent Caching
- **Coordinate Rounding**: ~100m precision for cache efficiency
- **Viewport-Based**: Geographic bounds caching
- **Smart Keys**: Zoom-aware cache invalidation

### Database Optimization  
- **Spatial Indexing**: Efficient geographic queries
- **Connection Pooling**: HikariCP for performance
- **Query Optimization**: Bounded searches, proper joins

### Apple Maps-Style Clustering
- **Zoom-Aware**: Different rendering based on zoom level
- **Area-Based**: Clustering decisions based on viewport size  
- **Performance**: Cached results for repeated queries

## 📈 Data Sources

The application scrapes coffee shop data from multiple sources:
- **Google Places API**: Comprehensive business data
- **OpenStreetMap**: Community-driven geographic data
- **Yelp**: Reviews and rating information

Total: **~1,277 coffee shops** in Manhattan with deduplication logic.

## 🔧 Development

### Hot Reload
Spring Boot DevTools enabled for automatic restarts during development.

### Database Management
Hibernate auto-DDL creates and updates tables from entity classes.

### Testing
```bash
# Run all tests
./mvnw test

# Run with coverage
./mvnw test jacoco:report
```