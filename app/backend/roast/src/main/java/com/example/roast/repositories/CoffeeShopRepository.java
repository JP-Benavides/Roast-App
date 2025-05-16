package com.example.roast.repositories;

import com.example.roast.models.CoffeeShop;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CoffeeShopRepository extends JpaRepository<CoffeeShop, Long> {
    CoffeeShop getCoffeeShopByName(String name);
}
