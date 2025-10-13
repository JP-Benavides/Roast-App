package com.example.roast.services;
import com.example.roast.dto.CoffeeShopCluster;
import com.example.roast.dto.CoffeeShopMapDto;
import com.example.roast.dto.ViewportResponse;
import com.example.roast.models.CoffeeShop;
import com.example.roast.repositories.CoffeeShopRepository;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.*;
import java.util.stream.Collectors;

@Service
@Transactional
public class CoffeeShopService {
    private final CoffeeShopRepository coffeeShopRepository;

    public CoffeeShopService(CoffeeShopRepository coffeeShopRepository) {
        this.coffeeShopRepository = coffeeShopRepository;
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
    @CacheEvict(value = {"allCoffeeShops", "coffeeShopsByBounds", "allCoffeeShopsMap", "coffeeShopsBoundsOptimized", "viewportData"}, allEntries = true)
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

    // Check if coffee shop exists
    @Transactional(readOnly = true)
    public boolean coffeeShopExists(Long id) {
        return coffeeShopRepository.existsById(id);
    }

    // Smart viewport-aware clustering
    @Cacheable(value = "viewportData", 
               key = "T(Math).round(#north * 1000) + '_' + T(Math).round(#south * 1000) + '_' + T(Math).round(#east * 1000) + '_' + T(Math).round(#west * 1000) + '_' + #zoom")
    @Transactional(readOnly = true)
    public ViewportResponse getViewportData(Double north, Double south, Double east, Double west, Integer zoom) {
        // Calculate viewport area
        double area = (north - south) * (east - west);
        
        // Get coffee shops in bounds first
        List<CoffeeShop> shopsInBounds = coffeeShopRepository.findCoffeeShopsInBounds(north, south, east, west);
        
        // Decide clustering strategy based on zoom and area
        if (zoom >= 15 || area <= 0.005 || shopsInBounds.size() <= 20) {
            // High zoom or small area or few shops - return individual shops
            List<CoffeeShopMapDto> individualShops = shopsInBounds.stream()
                    .map(shop -> new CoffeeShopMapDto(
                        shop.getId(), 
                        shop.getName(), 
                        shop.getLat(), 
                        shop.getLon(),
                        shop.getRating(),
                        shop.getNumberOfRatings()
                    ))
                    .collect(Collectors.toList());
            
            return new ViewportResponse(individualShops);
        } else {
            // Low zoom or large area - return clusters
            List<CoffeeShopCluster> clusters = createClusters(shopsInBounds, area);
            return new ViewportResponse(clusters, shopsInBounds.size());
        }
    }

    // Create clusters using simple grid-based clustering
    private List<CoffeeShopCluster> createClusters(List<CoffeeShop> shops, double area) {
        // Determine grid size based on area
        double gridSize = Math.max(0.002, Math.sqrt(area) / 10); // Adaptive grid size
        
        Map<String, List<CoffeeShop>> grid = new HashMap<>();
        
        // Group shops by grid cell
        for (CoffeeShop shop : shops) {
            String gridKey = getGridKey(shop.getLat(), shop.getLon(), gridSize);
            if (!grid.containsKey(gridKey)) {
                grid.put(gridKey, new ArrayList<>());
            }
            grid.get(gridKey).add(shop);
        }
        
        // Convert grid cells to clusters
        List<CoffeeShopCluster> clusters = new ArrayList<>();
        for (List<CoffeeShop> cellShops : grid.values()) {
            if (cellShops.size() == 1) {
                // Single shop - return as individual
                CoffeeShop shop = cellShops.get(0);
                clusters.add(new CoffeeShopCluster(
                    shop.getId(), 
                    shop.getName(), 
                    shop.getLat(), 
                    shop.getLon()
                ));
            } else {
                // Multiple shops - create cluster
                double avgLat = cellShops.stream().mapToDouble(CoffeeShop::getLat).average().orElse(0.0);
                double avgLon = cellShops.stream().mapToDouble(CoffeeShop::getLon).average().orElse(0.0);
                List<Long> shopIds = cellShops.stream().map(CoffeeShop::getId).collect(Collectors.toList());
                
                clusters.add(new CoffeeShopCluster(avgLat, avgLon, cellShops.size(), shopIds));
            }
        }
        
        return clusters;
    }

    // Helper method to create grid keys
    private String getGridKey(Double lat, Double lon, double gridSize) {
        int latGrid = (int) Math.floor(lat / gridSize);
        int lonGrid = (int) Math.floor(lon / gridSize);
        return latGrid + "_" + lonGrid;
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


}
