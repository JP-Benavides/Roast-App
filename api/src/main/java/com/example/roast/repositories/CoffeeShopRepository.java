package com.example.roast.repositories;

import com.example.roast.models.CoffeeShop;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface CoffeeShopRepository extends JpaRepository<CoffeeShop, Long> {
    List<CoffeeShop> findAllByName(String name);
    
    @Query("SELECT c FROM CoffeeShop c WHERE c.lat BETWEEN :south AND :north AND c.lon BETWEEN :west AND :east")
    List<CoffeeShop> findCoffeeShopsInBounds(
        @Param("north") Double north,
        @Param("south") Double south,
        @Param("east") Double east,
        @Param("west") Double west
    );
}

