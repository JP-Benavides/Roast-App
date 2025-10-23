package roast.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import roast.dto.CoffeeShopMapDto;
import roast.models.CoffeeShop;
import roast.services.CoffeeShopService;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.Optional;

@RestController
@RequestMapping("/api/coffeeshops")
@CrossOrigin(origins = "http://localhost:5173")
public class CoffeeShopController {

    private final CoffeeShopService coffeeShopService;

    @Autowired
    public CoffeeShopController(CoffeeShopService coffeeShopService) {
        this.coffeeShopService = coffeeShopService;
    }

    // Main map endpoint - uses tile system
    @GetMapping("/map")
    public ResponseEntity<List<CoffeeShopMapDto>> getCoffeeShopsForMap(
        @RequestParam double north,
        @RequestParam double south, 
        @RequestParam double east,
        @RequestParam double west) {
        
        System.out.println("🗺️ Map API called with bounds: N=" + north + ", S=" + south + ", E=" + east + ", W=" + west);
        
        // Use your advanced tile system
        List<String> tileIds = coffeeShopService.calculateViewportTiles(north, south, east, west);
        System.out.println("🎯 Calculated tiles: " + tileIds);
        
        List<CoffeeShopMapDto> shops = coffeeShopService.getCoffeeShopsByTiles(tileIds);
        System.out.println("📊 Returning " + shops.size() + " coffee shops");
        
        return ResponseEntity.ok(shops);
    }

    // Search coffee shops by name
    @GetMapping("/search")
    public ResponseEntity<List<CoffeeShop>> searchCoffeeShops(@RequestParam String name) {
        List<CoffeeShop> shops = coffeeShopService.getCoffeeShopsByName(name);
        return ResponseEntity.ok(shops);
    }

    // Get all coffee shops
    @GetMapping
    public ResponseEntity<List<CoffeeShop>> getAllCoffeeShops() {
        List<CoffeeShop> shops = coffeeShopService.getCoffeeShops();
        return ResponseEntity.ok(shops);
    }

    // Get coffee shop by ID
    @GetMapping("/{id}")
    public ResponseEntity<CoffeeShop> getCoffeeShopById(@PathVariable Long id) {
        Optional<CoffeeShop> shop = coffeeShopService.getCoffeeShopById(id);
        return shop.map(ResponseEntity::ok)
                  .orElse(ResponseEntity.notFound().build());
    }

    // Create new coffee shop
    @PostMapping
    public ResponseEntity<Map<String, String>> createCoffeeShop(@RequestBody CoffeeShop coffeeShop) {
        boolean created = coffeeShopService.createCoffeeShop(coffeeShop);
        
        Map<String, String> response = new HashMap<>();
        if (created) {
            response.put("status", "success");
            response.put("message", "Coffee shop created successfully");
            return ResponseEntity.ok(response);
        } else {
            response.put("status", "error");
            response.put("message", "Coffee shop with this name already exists");
            return ResponseEntity.badRequest().body(response);
        }
    }

    // Update rating
    @PatchMapping("/{id}/rating")
    public ResponseEntity<Map<String, String>> updateRating(
        @PathVariable Long id, 
        @RequestBody Map<String, Double> ratingRequest) {
        
        Double rating = ratingRequest.get("rating");
        boolean updated = coffeeShopService.addRating(id, rating);
        
        Map<String, String> response = new HashMap<>();
        if (updated) {
            response.put("status", "success");
            response.put("message", "Rating updated successfully");
            return ResponseEntity.ok(response);
        } else {
            response.put("status", "error");
            response.put("message", "Coffee shop not found");
            return ResponseEntity.notFound().build();
        }
    }

    // Debug endpoint to test tile system
    @GetMapping("/debug/tiles")
    public ResponseEntity<Map<String, Object>> debugTiles(
        @RequestParam double lat,
        @RequestParam double lon) {
        
        String tileId = coffeeShopService.calculateTileId(lat, lon);
        Map<String, Double> bounds = coffeeShopService.getTileBounds(tileId);
        
        List<CoffeeShop> allShops = coffeeShopService.getCoffeeShops();
        
        Map<String, Object> debug = new HashMap<>();
        debug.put("inputLat", lat);
        debug.put("inputLon", lon);
        debug.put("tileId", tileId);
        debug.put("tileBounds", bounds);
        debug.put("totalShopsInDB", allShops.size());
        
        if (!allShops.isEmpty()) {
            CoffeeShop sample = allShops.get(0);
            debug.put("sampleShop", Map.of(
                "name", sample.getName(),
                "lat", sample.getLat(),
                "lon", sample.getLon(),
                "tileId", coffeeShopService.calculateTileId(sample.getLat(), sample.getLon())
            ));
        }
        
        return ResponseEntity.ok(debug);
    }
}