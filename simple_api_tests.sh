#!/bin/bash

# 🚀 Simplified Coffee Shop API Tests
# Now you have a clean, focused API!

BASE_URL="http://localhost:8080/api/coffeeshops"

echo "☕ Testing Simplified Coffee Shop API"
echo "=================================="

# 1. Search for coffee shops
echo -e "\n🔍 Search coffee shops:"
curl -s "$BASE_URL/search?name=Starbucks" | jq '.[0:2]' || echo "No results"

# 2. Get coffee shop by ID
echo -e "\n📍 Get specific coffee shop:"
curl -s "$BASE_URL/1" | jq || echo "Not found"

# 3. Get map data using your tile system (behind the scenes)
echo -e "\n🗺️ Get coffee shops for map (using your tile system internally):"
curl -s "$BASE_URL/map?north=40.77&south=40.75&east=-73.97&west=-73.99" | jq '.[0:3]' || echo "No results"

# 4. Create new coffee shop
echo -e "\n➕ Create new coffee shop:"
curl -s -X POST "$BASE_URL" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Test Cafe",
    "lat": 40.7589,
    "lon": -73.9851,
    "rating": 4.5,
    "numberOfRatings": 1
  }' | jq || echo "Failed to create"

# 5. Update rating
echo -e "\n⭐ Update coffee shop rating:"
curl -s -X PATCH "$BASE_URL/1/rating" \
  -H "Content-Type: application/json" \
  -d '{"rating": 4.8}' | jq || echo "Failed to update"

echo -e "\n✅ Clean API! Only 5 endpoints needed:"
echo "   GET  /search?name=...     (search)"
echo "   GET  /{id}                (get details)" 
echo "   GET  /map?north=...       (map view - uses tiles internally)"
echo "   POST /                    (create)"
echo "   PATCH /{id}/rating        (update rating)"

echo -e "\n🎯 Your tile system works behind the scenes in /map endpoint!"
echo "   - Frontend: 1 API call"
echo "   - Backend: Geographic pagination with caching"
echo "   - Best of both worlds! 🚀"