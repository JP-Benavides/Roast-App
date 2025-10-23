package roast.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import roast.models.UserRating;

import java.util.List;
import java.util.Optional;

@Repository
public interface UserRatingRepository extends JpaRepository<UserRating, Long> {
    
    // Find a specific user's rating for a specific coffee shop
    Optional<UserRating> findByUserIdAndCoffeeShopId(Long userId, Long coffeeShopId);
    
    // Get all ratings by a specific user
    List<UserRating> findByUserIdOrderByCreatedAtDesc(Long userId);
    
    // Get all ratings for a specific coffee shop
    List<UserRating> findByCoffeeShopIdOrderByCreatedAtDesc(Long coffeeShopId);
    
    // Get aggregated rating statistics for a coffee shop
    @Query("SELECT AVG(ur.rating), COUNT(ur.rating) FROM UserRating ur WHERE ur.coffeeShop.id = :coffeeShopId")
    Object[] getAggregatedRatingByCoffeeShopId(@Param("coffeeShopId") Long coffeeShopId);
    
    // Check if a user has already rated a coffee shop
    boolean existsByUserIdAndCoffeeShopId(Long userId, Long coffeeShopId);
    
    // Get recent ratings across all coffee shops (for activity feed)
    @Query("SELECT ur FROM UserRating ur ORDER BY ur.createdAt DESC")
    List<UserRating> findRecentRatings();
    
    // Get top-rated coffee shops based on user ratings
    @Query("SELECT ur.coffeeShop.id, AVG(ur.rating), COUNT(ur.rating) FROM UserRating ur " +
           "GROUP BY ur.coffeeShop.id HAVING COUNT(ur.rating) >= :minRatings " +
           "ORDER BY AVG(ur.rating) DESC")
    List<Object[]> getTopRatedCoffeeShops(@Param("minRatings") Long minRatings);
}