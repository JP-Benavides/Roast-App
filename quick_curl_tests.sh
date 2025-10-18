# Quick Curl Tests for Roast App API

BASE_URL="http://localhost:8080/api/coffeeshops"

# Basic tests
curl "$BASE_URL" | jq '.[0:2]'                                    # Get all (first 2)
curl "$BASE_URL/by-name?name=Starbucks" | jq                      # Search by name  
curl "$BASE_URL/1" | jq                                           # Get by ID
curl "$BASE_URL/map" | jq '.[0:3]'                               # Map view (first 3)

# Tile system tests  
curl "$BASE_URL/tiles/calculate?north=40.77&south=40.75&east=-73.97&west=-73.99" | jq
curl "$BASE_URL/tiles?tileIds=13589_-24663&tileIds=13590_-24663" | jq

# Create coffee shop
curl -X POST "$BASE_URL" -H "Content-Type: application/json" \
  -d '{"name":"Test Cafe","lat":40.7589,"lon":-73.9851,"rating":4.5}' | jq

# Update rating  
curl -X PATCH "$BASE_URL/1/rating" -H "Content-Type: application/json" \
  -d '{"rating": 4.8}' | jq

# Performance test (hit same tiles multiple times)
for i in {1..5}; do 
  curl -s "$BASE_URL/tiles?tileIds=13589_-24663" > /dev/null
done
curl "$BASE_URL/tiles/stats"