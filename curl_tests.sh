# Roast App API - Curl Test Commands

# Set base URL (adjust port if needed)
BASE_URL="http://localhost:8080/api/coffeeshops"

# ===========================================
# 1. GET ALL COFFEE SHOPS
# ===========================================
echo "📍 Getting all coffee shops..."
curl -X GET "$BASE_URL" \
  -H "Content-Type: application/json" | jq '.[0:3]'

# ===========================================
# 2. GET COFFEE SHOPS BY NAME
# ===========================================
echo -e "\n📍 Getting coffee shops by name 'Starbucks'..."
curl -X GET "$BASE_URL/by-name?name=Starbucks" \
  -H "Content-Type: application/json" | jq

# ===========================================
# 3. GET COFFEE SHOP BY ID
# ===========================================
echo -e "\n📍 Getting coffee shop by ID (1)..."
curl -X GET "$BASE_URL/1" \
  -H "Content-Type: application/json" | jq

# ===========================================
# 4. CREATE NEW COFFEE SHOP
# ===========================================
echo -e "\n📍 Creating new coffee shop..."
curl -X POST "$BASE_URL" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Test Cafe",
    "address": "123 Test St",
    "lat": 40.7589,
    "lon": -73.9851,
    "rating": 4.5,
    "numberOfRatings": 1
  }' | jq

# ===========================================
# 5. UPDATE COFFEE SHOP RATING
# ===========================================
echo -e "\n📍 Updating rating for coffee shop ID 1..."
curl -X PATCH "$BASE_URL/1/rating" \
  -H "Content-Type: application/json" \
  -d '{"rating": 4.8}' | jq

# ===========================================
# 6. GET COFFEE SHOPS IN BOUNDS (Legacy)
# ===========================================
echo -e "\n📍 Getting coffee shops in bounds (legacy)..."
curl -X GET "$BASE_URL/bounds?north=40.7700&south=40.7500&east=-73.9700&west=-73.9900" \
  -H "Content-Type: application/json" | jq '.[0:3]'

# ===========================================
# 7. GET ALL COFFEE SHOPS FOR MAP (Lightweight)
# ===========================================
echo -e "\n📍 Getting all coffee shops for map (lightweight)..."
curl -X GET "$BASE_URL/map" \
  -H "Content-Type: application/json" | jq '.[0:3]'

# ===========================================
# 8. GET COFFEE SHOPS IN BOUNDS OPTIMIZED
# ===========================================
echo -e "\n📍 Getting coffee shops in bounds (optimized)..."
curl -X GET "$BASE_URL/bounds/optimized?north=40.7700&south=40.7500&east=-73.9700&west=-73.9900" \
  -H "Content-Type: application/json" | jq '.[0:3]'

# ===========================================
# 9. CALCULATE VIEWPORT TILES (New Tile System)
# ===========================================
echo -e "\n📍 Calculating tiles for viewport..."
curl -X GET "$BASE_URL/tiles/calculate?north=40.7700&south=40.7500&east=-73.9700&west=-73.9900" \
  -H "Content-Type: application/json" | jq

# ===========================================
# 10. GET COFFEE SHOPS BY TILES (New Tile System)
# ===========================================
echo -e "\n📍 Getting coffee shops by specific tiles..."
curl -X GET "$BASE_URL/tiles?tileIds=13589_-24663&tileIds=13590_-24663&tileIds=13591_-24663" \
  -H "Content-Type: application/json" | jq

# Alternative way with multiple tile IDs:
echo -e "\n📍 Getting coffee shops by multiple tiles (alternative format)..."
curl -G "$BASE_URL/tiles" \
  --data-urlencode "tileIds=13589_-24663" \
  --data-urlencode "tileIds=13590_-24663" \
  --data-urlencode "tileIds=13591_-24663" \
  -H "Content-Type: application/json" | jq

# ===========================================
# 11. GET TILE POPULARITY STATS
# ===========================================
echo -e "\n📍 Getting tile popularity stats..."
curl -X GET "$BASE_URL/tiles/stats" \
  -H "Content-Type: application/json"

# ===========================================
# 12. TEST TILE SYSTEM WORKFLOW (Complete Flow)
# ===========================================
echo -e "\n🔄 Testing complete tile workflow..."

# Step 1: Get tiles for Manhattan viewport
echo "Step 1: Calculate tiles for Manhattan area..."
TILES=$(curl -s -X GET "$BASE_URL/tiles/calculate?north=40.7700&south=40.7500&east=-73.9700&west=-73.9900")
echo "Tiles: $TILES"

# Step 2: Use first few tiles to get coffee shops
echo -e "\nStep 2: Get coffee shops for calculated tiles..."
curl -X GET "$BASE_URL/tiles?tileIds=13589_-24663&tileIds=13590_-24663" \
  -H "Content-Type: application/json" | jq '.[0:2]'

# ===========================================
# 13. PERFORMANCE TEST - Cache Hit Testing
# ===========================================
echo -e "\n⚡ Performance test - Testing cache hits..."

# Hit the same tiles multiple times to trigger adaptive caching
for i in {1..6}; do
  echo "Cache hit test #$i"
  curl -s -X GET "$BASE_URL/tiles?tileIds=13589_-24663&tileIds=13590_-24663" > /dev/null
  sleep 1
done

# Check stats after cache hits
echo -e "\nChecking stats after cache hits..."
curl -X GET "$BASE_URL/tiles/stats"

# ===========================================
# 14. ERROR HANDLING TESTS
# ===========================================
echo -e "\n❌ Testing error scenarios..."

# Test invalid coffee shop ID
echo "Testing invalid coffee shop ID..."
curl -X GET "$BASE_URL/999999" \
  -H "Content-Type: application/json" | jq

# Test invalid rating update
echo -e "\nTesting invalid rating..."
curl -X PATCH "$BASE_URL/1/rating" \
  -H "Content-Type: application/json" \
  -d '{"rating": "invalid"}' | jq

# Test missing rating in update
echo -e "\nTesting missing rating field..."
curl -X PATCH "$BASE_URL/1/rating" \
  -H "Content-Type: application/json" \
  -d '{}' | jq

# ===========================================
# 15. COORDINATE EXAMPLES FOR MANHATTAN
# ===========================================
echo -e "\n📍 Manhattan coordinate reference for testing:"
echo "Times Square: lat=40.7580, lon=-73.9855"
echo "Central Park: lat=40.7829, lon=-73.9654" 
echo "Wall Street: lat=40.7074, lon=-73.9776"
echo "Brooklyn Bridge: lat=40.7061, lon=-73.9969"

# Test with Times Square coordinates
echo -e "\nTesting with Times Square area..."
curl -X GET "$BASE_URL/bounds/optimized?north=40.7590&south=40.7570&east=-73.9845&west=-73.9865" \
  -H "Content-Type: application/json" | jq 'length'

echo -e "\n✅ All curl tests completed!"
echo "💡 Pro tip: Pipe any command with '| jq' for pretty JSON formatting"
echo "💡 Use '| jq length' to just see count of results"
echo "💡 Add '-v' flag to curl for verbose output and see headers"