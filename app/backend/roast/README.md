# Roast App Backend

A Spring Boot backend application for discovering and rating coffee shops.

## Setup Instructions

### Prerequisites
- Java 23
- PostgreSQL database
- Maven

### Environment Configuration

1. **Copy the environment template:**
   ```bash
   cp .env.example .env
   ```

2. **Update the `.env` file with your database credentials:**
   ```bash
   # Database Configuration
   DB_HOST=localhost
   DB_PORT=5432
   DB_NAME=roast_db
   DB_USER=your_username
   DB_PASSWORD=your_password
   
   # Application Configuration
   SERVER_PORT=8080
   ```

3. **Create the PostgreSQL database:**
   ```sql
   CREATE DATABASE roast_db;
   ```

### Running the Application

1. **Install dependencies:**
   ```bash
   mvn clean install
   ```

2. **Run the application:**
   ```bash
   mvn spring-boot:run
   ```

The application will start on `http://localhost:8080` (or the port specified in your `.env` file).

**🚀 Development Mode:** Hibernate automatically creates and updates database tables from your entity classes. Perfect for rapid development!

## API Endpoints

### Coffee Shops
- `GET /api/coffeeshops` - Get all coffee shops
- `GET /api/coffeeshops-byname?coffeeShopName=` - Search coffee shops by name
- `POST /api/coffeeshops` - Create a new coffee shop
- `PATCH /api/rating-change?shopId=&rating=` - Update coffee shop rating

### Users
- `POST /api/users` - Create a new user
- `GET /api/users?email=` - Get user by email
- `DELETE /api/users/{userId}` - Delete a user

### Favorites
- `GET /api/users/{userId}/favorites` - Get user's favorite coffee shops
- `POST /api/users/{userId}/favorites/{shopId}` - Add coffee shop to favorites
- `DELETE /api/users/{userId}/favorites/{shopId}` - Remove coffee shop from favorites

## Database Schema

### Tables
- `users` - User information (id, email)
- `coffees` - Coffee shop information (location, name, rating, etc.)
- `user_favorite_shops` - User-coffee shop favorites relationship

## Security Notes

- The `.env` file contains sensitive database credentials and is excluded from Git
- Always use the `.env.example` as a template for new setups
- Never commit actual credentials to version control