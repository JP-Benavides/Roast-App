package com.example.roast.controllers;

import com.example.roast.dto.CoffeeShopMapDto;
import com.example.roast.dto.ViewportResponse;
import com.example.roast.models.CoffeeShop;
import com.example.roast.services.CoffeeShopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.net.URI;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/coffeeshops")
public class CoffeeShopController {

    private final CoffeeShopService coffeeShopService;

    @Autowired
    public CoffeeShopController(CoffeeShopService coffeeShopService) {
        this.coffeeShopService = coffeeShopService;
    }

    // Get coffee shops by name
    @GetMapping("/by-name")
    public ResponseEntity<List<CoffeeShop>> getCoffeeShopsByName(@RequestParam String name) {
        List<CoffeeShop> shops = coffeeShopService.getCoffeeShopsByName(name);
        return ResponseEntity.ok(shops);
    }

    // Get all coffee shops
    @GetMapping
    public ResponseEntity<List<CoffeeShop>> getAllCoffeeShops() {
        return ResponseEntity.ok(coffeeShopService.getCoffeeShops());
    }

    // Get coffee shops within geographic bounds (optimized for map viewport)
    @GetMapping("/bounds")
    public ResponseEntity<List<CoffeeShop>> getCoffeeShopsInBounds(
            @RequestParam Double north,
            @RequestParam Double south,
            @RequestParam Double east,
            @RequestParam Double west) {
        List<CoffeeShop> shops = coffeeShopService.getCoffeeShopsInBounds(north, south, east, west);
        return ResponseEntity.ok(shops);
    }

    // Create a new coffee shop
    @PostMapping
    public ResponseEntity<?> createCoffeeShop(@RequestBody CoffeeShop coffeeShop) {
        boolean created = coffeeShopService.createCoffeeShop(coffeeShop);

        if (!created) {
            return ResponseEntity.status(HttpStatus.CONFLICT)
                    .body(Map.of("error", "Coffee shop could not be created"));
        }

        return ResponseEntity.created(URI.create("/api/coffeeshops/" + coffeeShop.getId()))
                .body(coffeeShop);
    }

    // Update rating for a coffee shop
    @PatchMapping("/{shopId}/rating")
    public ResponseEntity<?> updateRating(@PathVariable Long shopId,
                                        @RequestBody Map<String, Object> body) {
        Object ratingObj = body.get("rating");
        if (ratingObj == null) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body(Map.of("error", "Rating is required"));
        }

        Double rating;
        try {
            rating = Double.valueOf(ratingObj.toString());
        } catch (NumberFormatException e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body(Map.of("error", "Invalid rating format"));
        }

        boolean ok = coffeeShopService.addRating(shopId, rating);
        if (!ok) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND)
                    .body(Map.of("error", "Coffee shop not found"));
        }
        return ResponseEntity.ok(Map.of("newRating", rating));
    }

    // Get coffee shop by ID
    @GetMapping("/{id}")
    public ResponseEntity<?> getCoffeeShopById(@PathVariable Long id) {
        CoffeeShop coffeeShop = coffeeShopService.getCoffeeShopById(id);
        if (coffeeShop == null) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND)
                    .body(Map.of("error", "Coffee shop not found"));
        }
        return ResponseEntity.ok(coffeeShop);
    }

    // Get all coffee shops for map (lightweight)
    @GetMapping("/map")
    public ResponseEntity<List<CoffeeShopMapDto>> getAllCoffeeShopsForMap() {
        List<CoffeeShopMapDto> coffeeShops = coffeeShopService.getAllCoffeeShopsForMap();
        return ResponseEntity.ok(coffeeShops);
    }

    // Get coffee shops in bounds (optimized with smart caching)
    @GetMapping("/bounds/optimized")
    public ResponseEntity<List<CoffeeShopMapDto>> getCoffeeShopsInBoundsOptimized(
            @RequestParam Double north,
            @RequestParam Double south,
            @RequestParam Double east,
            @RequestParam Double west) {
        
        List<CoffeeShopMapDto> coffeeShops = coffeeShopService.getCoffeeShopsInBoundsOptimized(north, south, east, west);
        return ResponseEntity.ok(coffeeShops);
    }

    // Apple Maps-style viewport with smart clustering
    @GetMapping("/viewport")
    public ResponseEntity<ViewportResponse> getViewportData(
            @RequestParam Double north,
            @RequestParam Double south, 
            @RequestParam Double east,
            @RequestParam Double west,
            @RequestParam(defaultValue = "12") Integer zoom) {
        
        ViewportResponse response = coffeeShopService.getViewportData(north, south, east, west, zoom);
        return ResponseEntity.ok(response);
    }
}
