package roast.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import roast.models.CoffeeShop;
import roast.models.Favorite;
import roast.services.FavoriteService;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/favorites")
public class FavoriteController {

    private final FavoriteService favoriteService;

    @Autowired
    public FavoriteController(FavoriteService favoriteService) {
        this.favoriteService = favoriteService;
    }

    // Get user's favorite coffee shops
    @GetMapping("/user/{userId}")
    public ResponseEntity<List<CoffeeShop>> getUserFavorites(@PathVariable Long userId) {
        List<CoffeeShop> favorites = favoriteService.getUserFavorites(userId);
        return ResponseEntity.ok(favorites);
    }

    // Add a coffee shop to user's favorites
    @PostMapping("/user/{userId}/coffeeshop/{shopId}")
    public ResponseEntity<?> addFavoriteCoffeeShop(@PathVariable Long userId,
                                                   @PathVariable Long shopId) {
        boolean added = favoriteService.addFavoriteCoffeeShop(userId, shopId);
        if (!added) {
            return ResponseEntity.status(HttpStatus.CONFLICT)
                    .body(Map.of("error", "Favorite already exists or could not be created"));
        }
        return ResponseEntity.status(HttpStatus.CREATED)
                .body(Map.of("userId", userId, "shopId", shopId, "status", "favorited"));
    }

    // Remove a coffee shop from user's favorites
    @DeleteMapping("/user/{userId}/coffeeshop/{shopId}")
    public ResponseEntity<Void> removeFavorite(@PathVariable Long userId,
                                               @PathVariable Long shopId) {
        boolean removed = favoriteService.removeFavoriteCoffeeShop(userId, shopId);
        if (!removed) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }
        return ResponseEntity.noContent().build();
    }

    // Check if a coffee shop is in user's favorites
    @GetMapping("/user/{userId}/coffeeshop/{shopId}/exists")
    public ResponseEntity<Map<String, Boolean>> isFavorite(@PathVariable Long userId,
                                                          @PathVariable Long shopId) {
        boolean isFav = favoriteService.isFavorite(userId, shopId);
        return ResponseEntity.ok(Map.of("isFavorite", isFav));
    }

    // Get all users who favorited a specific coffee shop
    @GetMapping("/coffeeshop/{shopId}")
    public ResponseEntity<List<Favorite>> getCoffeeShopFavorites(@PathVariable Long shopId) {
        List<Favorite> favorites = favoriteService.getCoffeeShopFavorites(shopId);
        return ResponseEntity.ok(favorites);
    }

    // Get favorite count for a coffee shop
    @GetMapping("/coffeeshop/{shopId}/count")
    public ResponseEntity<Map<String, Long>> getFavoriteCount(@PathVariable Long shopId) {
        long count = favoriteService.getFavoriteCount(shopId);
        return ResponseEntity.ok(Map.of("favoriteCount", count));
    }

    // Get user's favorite entities (with full details)
    @GetMapping("/user/{userId}/details")
    public ResponseEntity<List<Favorite>> getUserFavoriteEntities(@PathVariable Long userId) {
        List<Favorite> favorites = favoriteService.getUserFavoriteEntities(userId);
        return ResponseEntity.ok(favorites);
    }

    // Remove all favorites for a user (admin/cleanup endpoint)
    @DeleteMapping("/user/{userId}")
    public ResponseEntity<Void> removeAllUserFavorites(@PathVariable Long userId) {
        favoriteService.removeAllUserFavorites(userId);
        return ResponseEntity.noContent().build();
    }

    // Remove all favorites for a coffee shop (admin/cleanup endpoint)
    @DeleteMapping("/coffeeshop/{shopId}")
    public ResponseEntity<Void> removeAllCoffeeShopFavorites(@PathVariable Long shopId) {
        favoriteService.removeAllCoffeeShopFavorites(shopId);
        return ResponseEntity.noContent().build();
    }
}