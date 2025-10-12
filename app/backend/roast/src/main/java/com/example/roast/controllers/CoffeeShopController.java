package com.example.roast.controllers;

import com.example.roast.models.CoffeeShop;
import com.example.roast.models.User;
import com.example.roast.services.CoffeeShopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.net.URI;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api")
public class CoffeeShopController {

    private final CoffeeShopService coffeeShopService;

    @Autowired
    public CoffeeShopController(CoffeeShopService coffeeShopService) {
        this.coffeeShopService = coffeeShopService;
    }

    // ---------- COFFEE SHOPS ----------

    // 200 OK (even if empty list)
    @GetMapping("/coffeeshops-byname")
    public ResponseEntity<List<CoffeeShop>> getCoffeeShopsByName(@RequestParam String coffeeShopName) {
        List<CoffeeShop> shops = coffeeShopService.getCoffeeShopsByName(coffeeShopName);
        return ResponseEntity.ok(shops);
    }

    // 200 OK (return empty array instead of 204)
    @GetMapping("/coffeeshops")
    public ResponseEntity<List<CoffeeShop>> getAllCoffeeShops() {
        return ResponseEntity.ok(coffeeShopService.getCoffeeShops());
    }

    // 201 Created on success, 409 Conflict if cannot create (e.g., duplicate)
    @PostMapping("/coffeeshops")
    public ResponseEntity<?> createCoffeeShop(@RequestBody CoffeeShop coffeeShop) {
        boolean created = coffeeShopService.createCoffeeShop(coffeeShop);

        if (!created) {
            return ResponseEntity.status(HttpStatus.CONFLICT)
                    .body(Map.of("error", "Coffee shop could not be created"));
        }

        // Optional: set Location header if you know the new ID
        return ResponseEntity.created(URI.create("/api/coffeeshops/" + coffeeShop.getId()))
                .body(coffeeShop);
    }

    // Patch rating; 200 OK with new rating, 404 if no matching shop
    @PatchMapping("/rating-change")
    public ResponseEntity<?> changeRating(@RequestParam Long shopId,
                                          @RequestParam Double rating) {
        boolean ok = coffeeShopService.addRating(shopId, rating);
        if (!ok) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND)
                    .body(Map.of("error", "No Coffee Shops with that name near the given location"));
        }
        return ResponseEntity.ok(Map.of("newRating", rating));
    }

    // ---------- USERS ----------

    // 201 Created on success, 400 Bad Request on failure
    @PostMapping("/users")
    public ResponseEntity<?> createUser(@RequestBody User user) {
        boolean created = coffeeShopService.addUser(user);
        if (!created) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body(Map.of("error", "User could not be created"));
        }
        return ResponseEntity.status(HttpStatus.CREATED)
                .body(user);
    }

    // 204 No Content on success, 404 Not Found if user doesn’t exist
    @DeleteMapping("/users/{userId}")
    public ResponseEntity<Void> removeUser(@PathVariable Long userId) {
        boolean removed = coffeeShopService.removeUser(userId);
        if (!removed) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }
        return ResponseEntity.noContent().build();
    }

    // Get user by email
    @GetMapping("/users")
    public ResponseEntity<?> getUserByEmail(@RequestParam String email) {
        User user = coffeeShopService.getUserByEmail(email);
        if (user == null) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND)
                    .body(Map.of("error", "User not found"));
        }
        return ResponseEntity.ok(user);
    }

    // Get user favorites
    @GetMapping("/users/{userId}/favorites")
    public ResponseEntity<List<CoffeeShop>> getUserFavorites(@PathVariable Long userId) {
        List<CoffeeShop> favorites = coffeeShopService.getUserFavorites(userId);
        return ResponseEntity.ok(favorites);
    }

    // ---------- FAVORITES ----------
    // Add favorite: 201 Created if added, 409 Conflict if already exists / cannot add
    @PostMapping("/users/{userId}/favorites/{shopId}")
    public ResponseEntity<?> addFavoriteCoffeeShop(@PathVariable Long userId,
                                                   @PathVariable Long shopId) {
        boolean added = coffeeShopService.addFavoriteCoffeeShop(userId, shopId);
        if (!added) {
            return ResponseEntity.status(HttpStatus.CONFLICT)
                    .body(Map.of("error", "Favorite already exists or could not be created"));
        }
        return ResponseEntity.status(HttpStatus.CREATED)
                .body(Map.of("userId", userId, "shopId", shopId, "status", "favorited"));
    }

    // Remove favorite: 204 No Content if removed, 404 if not found
    @DeleteMapping("/users/{userId}/favorites/{shopId}")
    public ResponseEntity<Void> removeFavorite(@PathVariable Long userId,
                                               @PathVariable Long shopId) {
        boolean removed = coffeeShopService.removeFavoriteCoffeeShop(userId, shopId);
        if (!removed) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }
        return ResponseEntity.noContent().build();
    }
}
