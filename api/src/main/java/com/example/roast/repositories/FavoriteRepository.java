package com.example.roast.repositories;

import com.example.roast.models.Favorite;
import com.example.roast.models.CoffeeShop;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface FavoriteRepository extends JpaRepository<Favorite, Long> {

    // Find all favorites for a user (returns Favorite entities)
    List<Favorite> findByUser_Id(Long userId);

    // Check if a specific shop is already in a user's favorites
    boolean existsByUser_IdAndCoffeeShop_Id(Long userId, Long coffeeShopId);

    // Remove a favorite (for "unstar" functionality)
    void deleteByUser_IdAndCoffeeShop_Id(Long userId, Long coffeeShopId);

    // Directly return all CoffeeShops a user has favorited
    @Query("""
        SELECT f.coffeeShop
        FROM Favorite f
        WHERE f.user.id = :userId
    """)
    List<CoffeeShop> findFavoriteShopsByUserId(@Param("userId") Long userId);

    // Find all favorites for a coffee shop
    List<Favorite> findByCoffeeShop_Id(Long coffeeShopId);

    // Count favorites for a coffee shop
    long countByCoffeeShop_Id(Long coffeeShopId);

    // Delete all favorites for a user
    void deleteByUser_Id(Long userId);

    // Delete all favorites for a coffee shop
    void deleteByCoffeeShop_Id(Long coffeeShopId);
}
