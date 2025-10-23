package roast.services;

import org.springframework.cache.annotation.Cacheable;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import roast.models.CoffeeShop;
import roast.models.Favorite;
import roast.repositories.CoffeeShopRepository;
import roast.repositories.FavoriteRepository;
import roast.repositories.UserRepository;

import java.util.List;

@Service
@Transactional
public class FavoriteService {
    private final FavoriteRepository favoriteRepository;
    private final UserRepository userRepository;
    private final CoffeeShopRepository coffeeShopRepository;

    public FavoriteService(FavoriteRepository favoriteRepository,
                          UserRepository userRepository,
                          CoffeeShopRepository coffeeShopRepository) {
        this.favoriteRepository = favoriteRepository;
        this.userRepository = userRepository;
        this.coffeeShopRepository = coffeeShopRepository;
    }

    // Get user's favorite coffee shops (cached)
    @Cacheable(value = "userFavorites", key = "#userId")
    @Transactional(readOnly = true)
    public List<CoffeeShop> getUserFavorites(Long userId) {
        return favoriteRepository.findFavoriteShopsByUserId(userId);
    }

    // Add a coffee shop to user's favorites
    @CacheEvict(value = {"userFavorites", "coffeeShopFavorites"}, allEntries = true)
    public boolean addFavoriteCoffeeShop(Long userId, Long shopId) {
        // Check if favorite already exists and if both user and shop exist
        if (!favoriteRepository.existsByUser_IdAndCoffeeShop_Id(userId, shopId)
                && userRepository.existsById(userId)
                && coffeeShopRepository.existsById(shopId)) {
            
            Favorite favorite = new Favorite(
                userRepository.getReferenceById(userId), 
                coffeeShopRepository.getReferenceById(shopId)
            );
            favoriteRepository.save(favorite);
            return true;
        }
        return false; // Already favorited or user/shop doesn't exist
    }

    // Remove a coffee shop from user's favorites
    @CacheEvict(value = {"userFavorites", "coffeeShopFavorites"}, allEntries = true)
    public boolean removeFavoriteCoffeeShop(Long userId, Long shopId) {
        if (favoriteRepository.existsByUser_IdAndCoffeeShop_Id(userId, shopId)
                && userRepository.existsById(userId)
                && coffeeShopRepository.existsById(shopId)) {
            
            favoriteRepository.deleteByUser_IdAndCoffeeShop_Id(userId, shopId);
            return true;
        }
        return false; // Favorite doesn't exist or user/shop doesn't exist
    }

    // Check if a coffee shop is in user's favorites
    @Transactional(readOnly = true)
    public boolean isFavorite(Long userId, Long shopId) {
        return favoriteRepository.existsByUser_IdAndCoffeeShop_Id(userId, shopId);
    }

    // Get all users who favorited a specific coffee shop
    @Cacheable(value = "coffeeShopFavorites", key = "#shopId")
    @Transactional(readOnly = true)
    public List<Favorite> getCoffeeShopFavorites(Long shopId) {
        return favoriteRepository.findByCoffeeShop_Id(shopId);
    }

    // Get count of favorites for a coffee shop
    @Transactional(readOnly = true)
    public long getFavoriteCount(Long shopId) {
        return favoriteRepository.countByCoffeeShop_Id(shopId);
    }

    // Get all favorites for a user (returns Favorite entities, not just coffee shops)
    @Transactional(readOnly = true)
    public List<Favorite> getUserFavoriteEntities(Long userId) {
        return favoriteRepository.findByUser_Id(userId);
    }

    // Remove all favorites for a user (useful when deleting a user)
    @CacheEvict(value = {"userFavorites", "coffeeShopFavorites"}, allEntries = true)
    public void removeAllUserFavorites(Long userId) {
        favoriteRepository.deleteByUser_Id(userId);
    }

    // Remove all favorites for a coffee shop (useful when deleting a coffee shop)
    @CacheEvict(value = {"userFavorites", "coffeeShopFavorites"}, allEntries = true)
    public void removeAllCoffeeShopFavorites(Long shopId) {
        favoriteRepository.deleteByCoffeeShop_Id(shopId);
    }
}