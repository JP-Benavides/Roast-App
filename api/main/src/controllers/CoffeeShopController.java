package roast.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import roast.models.CoffeeShop;
import roast.services.CoffeeShopService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
    public ResponseEntity<List<CoffeeShop>> getCoffeeShopsForMap(
        @RequestParam double north,
        @RequestParam double south, 
        @RequestParam double east,
        @RequestParam double west) {
        
        System.out.println("🗺️ Map API called with bounds: N=" + north + ", S=" + south + ", E=" + east + ", W=" + west);
        
        // Use your advanced tile system
        List<String> tileIds = coffeeShopService.calculateViewportTiles(north, south, east, west);
        System.out.println("🎯 Calculated tiles: " + tileIds);
        
        List<CoffeeShop> shops = coffeeShopService.getCoffeeShopsByTiles(tileIds);
        System.out.println("📊 Returning " + shops.size() + " coffee shops");
        
        return ResponseEntity.ok(shops);
    }

    @GetMapping("/map-paginated")
    public ResponseEntity<Map<String, Object>> getCoffeeShopsForMapPaginated(@RequestParam double north,
    @RequestParam double south, 
    @RequestParam double east,
    @RequestParam double west,
    @RequestParam int page,
    @RequestParam int size){

    System.out.println("🗺️ Paginated Map API called with bounds: N=" + north + ", S=" + south + ", E=" + east + ", W=" + west);
    System.out.println("📄 Pagination parameters: page=" + page + ", size=" + size);
    
    //Calculates all tiles within bounds
    List<String> tileIds = coffeeShopService.calculateViewportTiles(north, south, east, west);
    System.out.println("🎯 Calculated tiles: " + tileIds);
    
    //Fetch Coffee data with given tile
    List<CoffeeShop> allShops = coffeeShopService.getCoffeeShopsByTiles(tileIds);
    System.out.println("📊 Total coffee shops found: " + allShops.size());
    
    //apply pagination
    int start = page * size;
    int end = Math.min(start + size, allShops.size());
    List<CoffeeShop> paginatedShops = allShops.subList(start, end);
    
    //prep Response
    Map<String, Object> response = new HashMap<>();
    response.put("currentPage", page);
    response.put("pageSize", size);
    response.put("totalItems", allShops.size());
    response.put("totalPages", (int) Math.ceil((double) allShops.size() / size));
    response.put("coffeeShops", paginatedShops);
    
    return ResponseEntity.ok(response);
    }


    // Search coffee shops by name
    @GetMapping("/search/{name}")
    public ResponseEntity<List<CoffeeShop>> searchCoffeeShops(@PathVariable String name) {
        List<CoffeeShop> shops = coffeeShopService.getCoffeeShopsByName(name);
        if(shops.isEmpty()){
            return ResponseEntity.badRequest().body(new ArrayList<>()); 
        }
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
    @PostMapping("/create")
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

    //Update CoffeeShop
}