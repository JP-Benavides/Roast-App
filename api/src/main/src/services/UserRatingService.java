package roast.services;

import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import roast.dto.DtoMapper;
import roast.dto.UserRatingDto;
import roast.models.CoffeeShop;
import roast.models.User;
import roast.models.UserRating;
import roast.repositories.CoffeeShopRepository;
import roast.repositories.UserRatingRepository;
import roast.repositories.UserRepository;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
@Transactional
public class UserRatingService {
    
    private final UserRatingRepository userRatingRepository;
    private final UserRepository userRepository;
    private final CoffeeShopRepository coffeeShopRepository;
    
    public UserRatingService(UserRatingRepository userRatingRepository,
                           UserRepository userRepository,
                           CoffeeShopRepository coffeeShopRepository) {
        this.userRatingRepository = userRatingRepository;
        this.userRepository = userRepository;
        this.coffeeShopRepository = coffeeShopRepository;
    }
    
    // Create or update a user's rating for a coffee shop
    @CacheEvict(value = {"userRatings", "coffeeShopRatings", "allCoffeeShops", "coffeeShopsByBounds", "allCoffeeShopsMap", "coffeeShopsBoundsOptimized", "viewportData"}, allEntries = true)
    public UserRatingDto createOrUpdateRating(Long userId, Long coffeeShopId, Double rating, String reviewText) {
        User user = userRepository.findById(userId)
            .orElseThrow(() -> new RuntimeException("User not found"));
        
        CoffeeShop coffeeShop = coffeeShopRepository.findById(coffeeShopId)
            .orElseThrow(() -> new RuntimeException("Coffee shop not found"));
        
        // Check if rating already exists
        Optional<UserRating> existingRating = userRatingRepository
            .findByUserIdAndCoffeeShopId(userId, coffeeShopId);
        
        UserRating userRating;
        if (existingRating.isPresent()) {
            // Update existing rating
            userRating = existingRating.get();
            userRating.setRating(rating);
            userRating.setReviewText(reviewText);
        } else {
            // Create new rating
            userRating = new UserRating(user, coffeeShop, rating, reviewText);
        }
        
        userRating = userRatingRepository.save(userRating);
        return convertToDto(userRating);
    }
    
    // Get a user's rating for a specific coffee shop
    @Cacheable(value = "userSpecificRating", key = "#userId + '_' + #coffeeShopId")
    @Transactional(readOnly = true)
    public Optional<UserRatingDto> getUserRatingForCoffeeShop(Long userId, Long coffeeShopId) {
        Optional<UserRating> rating = userRatingRepository
            .findByUserIdAndCoffeeShopId(userId, coffeeShopId);
        
        return rating.map(this::convertToDto);
    }
    
    // Get all ratings by a user
    @Cacheable(value = "userRatings", key = "#userId")
    @Transactional(readOnly = true)
    public List<UserRatingDto> getUserRatings(Long userId) {
        List<UserRating> ratings = userRatingRepository.findByUserIdOrderByCreatedAtDesc(userId);
        return ratings.stream().map(this::convertToDto).collect(Collectors.toList());
    }
    
    // Get all ratings for a coffee shop
    @Cacheable(value = "coffeeShopRatings", key = "#coffeeShopId")
    @Transactional(readOnly = true)
    public List<UserRatingDto> getCoffeeShopRatings(Long coffeeShopId) {
        List<UserRating> ratings = userRatingRepository.findByCoffeeShopIdOrderByCreatedAtDesc(coffeeShopId);
        return ratings.stream().map(this::convertToDto).collect(Collectors.toList());
    }
    
    // Get aggregated rating stats for a coffee shop
    @Cacheable(value = "aggregatedRatings", key = "#coffeeShopId")
    @Transactional(readOnly = true)
    public Object[] getAggregatedRating(Long coffeeShopId) {
        return userRatingRepository.getAggregatedRatingByCoffeeShopId(coffeeShopId);
    }
    
    // Check if user has already rated a coffee shop
    @Transactional(readOnly = true)
    public boolean hasUserRatedCoffeeShop(Long userId, Long coffeeShopId) {
        return userRatingRepository.existsByUserIdAndCoffeeShopId(userId, coffeeShopId);
    }
    
    // Delete a user's rating
    @CacheEvict(value = {"userRatings", "coffeeShopRatings", "userSpecificRating", "aggregatedRatings", "allCoffeeShops", "coffeeShopsByBounds", "allCoffeeShopsMap", "coffeeShopsBoundsOptimized", "viewportData"}, allEntries = true)
    public boolean deleteUserRating(Long userId, Long coffeeShopId) {
        Optional<UserRating> rating = userRatingRepository
            .findByUserIdAndCoffeeShopId(userId, coffeeShopId);
        
        if (rating.isPresent()) {
            userRatingRepository.delete(rating.get());
            return true;
        }
        return false;
    }
    
    // Convert entity to DTO using DtoMapper
    private UserRatingDto convertToDto(UserRating userRating) {
        return DtoMapper.toUserRatingDto(userRating);
    }
}