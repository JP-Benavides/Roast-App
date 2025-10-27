package roast.services;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import roast.models.CoffeeShop;
import roast.repositories.CoffeeShopRepository;
import org.springframework.data.redis.core.RedisTemplate;

import java.time.Duration;
import java.util.*;
import java.util.stream.Collectors;

@Service
@Transactional
public class CoffeeShopService {
    private final CoffeeShopRepository coffeeShopRepository;
    private final RedisTemplate<String, Object> redisTemplate;

    public CoffeeShopService(CoffeeShopRepository coffeeShopRepository, RedisTemplate<String, Object> redisTemplate) {
        this.coffeeShopRepository = coffeeShopRepository;
        this.redisTemplate = redisTemplate;
    }

    // Get coffee shops by name
    @Transactional(readOnly = true)
    public List<CoffeeShop> getCoffeeShopsByName(String coffeeShopName) {
        return coffeeShopRepository.findAllByName(coffeeShopName);
    }


    // Get coffee shop by ID
    @Transactional(readOnly = true)
    public Optional<CoffeeShop> getCoffeeShopById(Long id) {
        return coffeeShopRepository.findById(id);
    }

    // Get all coffee shops (cached)
    @Cacheable(value = "allCoffeeShops", unless = "#result.isEmpty()")
    @Transactional(readOnly = true)
    public List<CoffeeShop> getAllCoffeeShops() {
        return coffeeShopRepository.findAll();
    }

    // Create a new coffee shop
    @CacheEvict(value = {"allCoffeeShops", "coffeeShopsByTiles"}, allEntries = true)
    public boolean createCoffeeShop(CoffeeShop coffeeShop) {
        List<CoffeeShop> existingShops = coffeeShopRepository.findAllByName(coffeeShop.getName());
        
        boolean locationExists = existingShops.stream()
            .anyMatch(shop -> Objects.equals(shop.getLat(), coffeeShop.getLat()) && 
                            Objects.equals(shop.getLon(), coffeeShop.getLon()));
        
        if (locationExists) {
            return false;
        }
        
        // Manually recalculate tileId
        coffeeShop.updateTileId();

        coffeeShopRepository.save(coffeeShop);
        return true;
    }

    // Update CoffeeShop
    public boolean updateCoffeeShop(Long shopId, CoffeeShop coffeeShop) {
        Optional<CoffeeShop> existingOpt = coffeeShopRepository.findById(shopId);
        if (existingOpt.isEmpty()) {
            return false;
        }
        if (coffeeShop.getId() == null) {
            coffeeShop.setId(shopId);
        }

        // Manually recalculate tileId
        coffeeShop.updateTileId();

        CoffeeShop updated = coffeeShopRepository.save(coffeeShop);
        redisTemplate.opsForValue().set("coffeeShop:" + shopId, updated, Duration.ofMinutes(5)); // Update cache with 5-minute TTL
        return true;
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
    public List<CoffeeShop> getCoffeeShopsByTiles(List<String> tileIds) {
        if (tileIds == null || tileIds.isEmpty()) {
            return new ArrayList<>();
        }
        
        System.out.println("🎯 Getting coffee shops for tiles: " + tileIds);
        
        // First, let's see what tiles all our coffee shops are in
        List<CoffeeShop> allShops = coffeeShopRepository.findAll();
        System.out.println("📊 Total shops in DB: " + allShops.size());
        
        for (CoffeeShop shop : allShops) {
            String shopTileId = calculateTileId(shop.getLat(), shop.getLon());
            boolean inRequestedTiles = tileIds.contains(shopTileId);
            System.out.println("   " + shop.getName() + " at (" + shop.getLat() + ", " + shop.getLon() + ") -> tile " + shopTileId + " (requested: " + inRequestedTiles + ")");
        }
        
        // Direct database query by tile IDs
        List<CoffeeShop> shops = coffeeShopRepository.findCoffeeShopsByTileIds(tileIds);
        System.out.println("� Repository returned " + shops.size() + " shops for tiles: " + tileIds);
        
        return shops;
    }
    
    // Calculate which tiles are needed for a given viewport
    public List<String> calculateViewportTiles(Double north, Double south, Double east, Double west) {
        // Validate input bounds
        if (north == null || south == null || east == null || west == null) {
            throw new IllegalArgumentException("Bounds cannot be null");
        }
        if (north <= south || east <= west) {
            throw new IllegalArgumentException("Invalid bounds: north must be greater than south, and east must be greater than west");
        }

        System.out.println("🔍 Calculating viewport tiles:");
        System.out.println("   Bounds: N=" + north + ", S=" + south + ", E=" + east + ", W=" + west);
        System.out.println("   Lat range: " + (north - south) + ", Lon range: " + (east - west));
        System.out.println("   Tile size: " + TILE_SIZE);

        List<String> tileIds = new ArrayList<>();

        // Start from south-west corner, go to north-east corner
        int latSteps = 0, lonSteps = 0;
        for (double lat = south; lat <= north; lat += TILE_SIZE) {
            latSteps++;
            lonSteps = 0;
            for (double lon = west; lon <= east; lon += TILE_SIZE) {
                lonSteps++;
                String tileId = calculateTileId(lat, lon);
                if (tileId != null && !tileIds.contains(tileId)) {
                    tileIds.add(tileId);
                }
            }
        }

        System.out.println("🎯 Calculated " + tileIds.size() + " unique tiles from " + latSteps + "x" + lonSteps + " grid");
        System.out.println("   Tiles: " + tileIds);

        return tileIds;
    }
}
