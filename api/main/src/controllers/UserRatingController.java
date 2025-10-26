package roast.controllers;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import roast.models.UserRating;
import roast.services.UserRatingService;

import java.util.List;
import java.util.Map;
import java.util.Optional;

@RestController
@RequestMapping("/api")
public class UserRatingController {

    private final UserRatingService userRatingService;

    public UserRatingController(UserRatingService userRatingService) {
        this.userRatingService = userRatingService;
    }

    // Create or update a rating
    @PostMapping("/ratings")
    public ResponseEntity<?> createOrUpdateRating(@RequestBody Map<String, Object> request) {
        try {
            Long userId = Long.valueOf(request.get("userId").toString());
            Long coffeeShopId = Long.valueOf(request.get("coffeeShopId").toString());
            Double rating = Double.valueOf(request.get("rating").toString());
            String reviewText = request.get("reviewText") != null ? request.get("reviewText").toString() : null;

            UserRating result = userRatingService.createOrUpdateRating(userId, coffeeShopId, rating, reviewText);
            return ResponseEntity.status(HttpStatus.CREATED).body(result);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body(Map.of("error", "Failed to create/update rating: " + e.getMessage()));
        }
    }

    // Get a user's rating for a specific coffee shop
    @GetMapping("/ratings/user/{userId}/coffeeshop/{coffeeShopId}")
    public ResponseEntity<?> getUserRatingForCoffeeShop(@PathVariable Long userId, @PathVariable Long coffeeShopId) {
        Optional<UserRating> rating = userRatingService.getUserRatingForCoffeeShop(userId, coffeeShopId);
        
        if (rating.isPresent()) {
            return ResponseEntity.ok(rating.get());
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND)
                    .body(Map.of("message", "No rating found for this user and coffee shop"));
        }
    }

    // Get all ratings by a user
    @GetMapping("/ratings/user/{userId}")
    public ResponseEntity<List<UserRating>> getUserRatings(@PathVariable Long userId) {
        List<UserRating> ratings = userRatingService.getUserRatings(userId);
        return ResponseEntity.ok(ratings);
    }

    // Get all ratings for a coffee shop
    @GetMapping("/ratings/coffeeshop/{coffeeShopId}")
    public ResponseEntity<List<UserRating>> getCoffeeShopRatings(@PathVariable Long coffeeShopId) {
        List<UserRating> ratings = userRatingService.getCoffeeShopRatings(coffeeShopId);
        return ResponseEntity.ok(ratings);
    }

    // Get aggregated rating stats for a coffee shop
    @GetMapping("/ratings/coffeeshop/{coffeeShopId}/stats")
    public ResponseEntity<?> getAggregatedRating(@PathVariable Long coffeeShopId) {
        Object[] stats = userRatingService.getAggregatedRating(coffeeShopId);
        
        if (stats != null && stats.length >= 2) {
            Double averageRating = (Double) stats[0];
            Long totalRatings = (Long) stats[1];
            
            Map<String, Object> response = Map.of(
                "coffeeShopId", coffeeShopId,
                "averageRating", averageRating != null ? averageRating : 0.0,
                "totalRatings", totalRatings != null ? totalRatings : 0L
            );
            
            return ResponseEntity.ok(response);
        } else {
            Map<String, Object> response = Map.of(
                "coffeeShopId", coffeeShopId,
                "averageRating", 0.0,
                "totalRatings", 0L
            );
            return ResponseEntity.ok(response);
        }
    }

    // Check if user has rated a coffee shop
    @GetMapping("/ratings/user/{userId}/coffeeshop/{coffeeShopId}/exists")
    public ResponseEntity<Map<String, Boolean>> hasUserRatedCoffeeShop(@PathVariable Long userId, @PathVariable Long coffeeShopId) {
        boolean hasRated = userRatingService.hasUserRatedCoffeeShop(userId, coffeeShopId);
        return ResponseEntity.ok(Map.of("hasRated", hasRated));
    }

    // Delete a user's rating
    @DeleteMapping("/ratings/user/{userId}/coffeeshop/{coffeeShopId}")
    public ResponseEntity<?> deleteUserRating(@PathVariable Long userId, @PathVariable Long coffeeShopId) {
        boolean deleted = userRatingService.deleteUserRating(userId, coffeeShopId);
        
        if (deleted) {
            return ResponseEntity.ok(Map.of("message", "Rating deleted successfully"));
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND)
                    .body(Map.of("error", "Rating not found"));
        }
    }
}