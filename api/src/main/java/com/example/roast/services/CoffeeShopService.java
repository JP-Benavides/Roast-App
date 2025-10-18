package com.example.roast.services;
import com.example.roast.dto.CoffeeShopMapDto;
import com.example.roast.models.CoffeeShop;
import com.example.roast.repositories.CoffeeShopRepository;
import com.example.roast.config.AdaptiveCacheManager;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.time.Duration;
import java.util.*;
import java.util.stream.Collectors;

@Service
@Transactional
public class CoffeeShopService {
    private final CoffeeShopRepository coffeeShopRepository;
    private final AdaptiveCacheManager adaptiveCacheManager;

    public CoffeeShopService(CoffeeShopRepository coffeeShopRepository, AdaptiveCacheManager adaptiveCacheManager) {
        this.coffeeShopRepository = coffeeShopRepository;
        this.adaptiveCacheManager = adaptiveCacheManager;
    }

    // Get coffee shops by name
    @Transactional(readOnly = true)
    public List<CoffeeShop> getCoffeeShopsByName(String coffeeShopName) {
        List<CoffeeShop> shops = coffeeShopRepository.findAllByName(coffeeShopName);
        if (shops.isEmpty()) {
            return new ArrayList<>();
        }
        return shops;
    }

    // Add rating to a coffee shop (legacy method - consider using UserRatingService instead)
    public boolean addRating(Long shopId, Double rating) {
        return coffeeShopRepository.findById(shopId)
                .map(shop -> {
                    shop.addNewRating(rating);   // updates average/count in entity
                    coffeeShopRepository.save(shop);
                    return true;
                })
                .orElse(false); // if no shop found
    }

    // Get all coffee shops (cached)
    @Cacheable(value = "allCoffeeShops", unless = "#result.isEmpty()")
    @Transactional(readOnly = true)
    public List<CoffeeShop> getCoffeeShops() {
        List<CoffeeShop> shops = coffeeShopRepository.findAll();
        if (shops.isEmpty()) { 
            return new ArrayList<>(); 
        }
        return shops;
    }

    // Get coffee shops within geographic bounds (cached)
    @Cacheable(value = "coffeeShopsByBounds", key = "#north + '_' + #south + '_' + #east + '_' + #west", unless = "#result.isEmpty()")
    @Transactional(readOnly = true)
    public List<CoffeeShop> getCoffeeShopsInBounds(Double north, Double south, Double east, Double west) {
        List<CoffeeShop> shops = coffeeShopRepository.findCoffeeShopsInBounds(north, south, east, west);
        if (shops.isEmpty()) { 
            return new ArrayList<>(); 
        }
        return shops;
    }
    
    // Create a new coffee shop
    @CacheEvict(value = {"allCoffeeShops", "coffeeShopsByBounds", "allCoffeeShopsMap", "coffeeShopsBoundsOptimized", "coffeeShopsByTiles"}, allEntries = true)
    public boolean createCoffeeShop(CoffeeShop coffeeShop) {
        // For new coffee shops, ID should be null (auto-generated)
        // Check if a coffee shop with the same name already exists instead
        List<CoffeeShop> existingShops = coffeeShopRepository.findAllByName(coffeeShop.getName());
        if (!existingShops.isEmpty()) {
            return false; // Coffee shop with this name already exists
        }
        coffeeShopRepository.save(coffeeShop);
        return true;
    }

    // Get coffee shop by ID
    @Transactional(readOnly = true)
    public CoffeeShop getCoffeeShopById(Long id) {
        return coffeeShopRepository.findById(id).orElse(null);
    }


    // Get all coffee shops for map display (lightweight)
    @Cacheable(value = "allCoffeeShopsMap", unless = "#result.isEmpty()")
    @Transactional(readOnly = true)
    public List<CoffeeShopMapDto> getAllCoffeeShopsForMap() {
        List<CoffeeShop> shops = coffeeShopRepository.findAll();
        return shops.stream()
                .map(shop -> new CoffeeShopMapDto(
                    shop.getId(), 
                    shop.getName(), 
                    shop.getLat(), 
                    shop.getLon(),
                    shop.getRating(),
                    shop.getNumberOfRatings()
                ))
                .collect(Collectors.toList());
    }

    // Get coffee shops in bounds with smart caching (scalable version)
    @Cacheable(value = "coffeeShopsBoundsOptimized", 
               key = "T(Math).round(#north * 1000) + '_' + T(Math).round(#south * 1000) + '_' + T(Math).round(#east * 1000) + '_' + T(Math).round(#west * 1000)")
    @Transactional(readOnly = true)
    public List<CoffeeShopMapDto> getCoffeeShopsInBoundsOptimized(Double north, Double south, Double east, Double west) {
        List<CoffeeShop> shops = coffeeShopRepository.findCoffeeShopsInBounds(north, south, east, west);
        return shops.stream()
                .map(shop -> new CoffeeShopMapDto(
                    shop.getId(), 
                    shop.getName(), 
                    shop.getLat(), 
                    shop.getLon(),
                    shop.getRating(),
                    shop.getNumberOfRatings()
                ))
                .collect(Collectors.toList());
    }

    // ===== TILE SYSTEM METHODS =====
    
    private static final double TILE_SIZE = 0.003; 
    
    // Calculate tile ID for given coordinates
    public String calculateTileId(Double lat, Double lon) {
        if (lat == null || lon == null) return null;
        
        int tileX = (int) Math.floor(lat / TILE_SIZE);
        int tileY = (int) Math.floor(lon / TILE_SIZE);
        return tileX + "_" + tileY;
    }
    
    // Get tile bounds from tile ID
    public Map<String, Double> getTileBounds(String tileId) {
        String[] parts = tileId.split("_");
        int tileX = Integer.parseInt(parts[0]);
        int tileY = Integer.parseInt(parts[1]);
        
        double south = tileX * TILE_SIZE;
        double north = south + TILE_SIZE;
        double west = tileY * TILE_SIZE;
        double east = west + TILE_SIZE;
        
        Map<String, Double> bounds = new HashMap<>();
        bounds.put("north", north);
        bounds.put("south", south);
        bounds.put("east", east);
        bounds.put("west", west);
        return bounds;
    }
    
    // Get coffee shops by tile IDs (the main tile loading method)
    @Cacheable(value = "coffeeShopsByTiles", key = "#tileIds.toString()", unless = "#result.isEmpty()")
    @Transactional(readOnly = true)
    public List<CoffeeShopMapDto> getCoffeeShopsByTiles(List<String> tileIds) {
        if (tileIds == null || tileIds.isEmpty()) {
            return new ArrayList<>();
        }
        
        // Record cache hit for adaptive TTL
        String cacheKey = tileIds.toString();
        adaptiveCacheManager.recordHit("coffeeShopsByTiles::" + cacheKey);
        
        // Log popular tiles
        int hitCount = adaptiveCacheManager.getHitCount("coffeeShopsByTiles::" + cacheKey);
        if (hitCount % 5 == 0) { // Log every 5th hit
            Duration baseTTL = Duration.ofMinutes(10);
            Duration adaptiveTTL = adaptiveCacheManager.calculateAdaptiveTTL("coffeeShopsByTiles::" + cacheKey, baseTTL);
            System.out.println("🔥 Tiles " + tileIds + " accessed " + hitCount + " times. Adaptive TTL: " + adaptiveTTL.toMinutes() + " minutes");
        }
        
        // Much faster: direct database query by tile IDs!
        List<CoffeeShop> shops = coffeeShopRepository.findCoffeeShopsByTileIds(tileIds);
        
        return shops.stream()
                .map(shop -> new CoffeeShopMapDto(
                    shop.getId(), 
                    shop.getName(), 
                    shop.getLat(), 
                    shop.getLon(),
                    shop.getRating(),
                    shop.getNumberOfRatings()
                ))
                .collect(Collectors.toList());
    }
    
    // Calculate which tiles are needed for a given viewport
    public List<String> calculateViewportTiles(Double north, Double south, Double east, Double west) {
        List<String> tileIds = new ArrayList<>();
        
        // Start from south-west corner, go to north-east corner
        for (double lat = south; lat <= north; lat += TILE_SIZE) {
            for (double lon = west; lon <= east; lon += TILE_SIZE) {
                String tileId = calculateTileId(lat, lon);
                if (tileId != null && !tileIds.contains(tileId)) {
                    tileIds.add(tileId);
                }
            }
        }
        
        return tileIds;
    }

}
