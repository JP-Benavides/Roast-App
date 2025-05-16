package com.example.roast.services;

import com.example.roast.models.CoffeeShop;
import com.example.roast.repositories.CoffeeShopRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class CoffeeShopService implements CoffeeShopServiceInter{
    private final CoffeeShopRepository coffeeShopRepository;

    public CoffeeShopService(CoffeeShopRepository coffeeShopRepository) {
        this.coffeeShopRepository = coffeeShopRepository;
    }

    @Override
    public CoffeeShop getCoffeeShopByName(String coffeeShopName) {
        return coffeeShopRepository.getCoffeeShopByName(coffeeShopName);
    }

    @Override
    public List<CoffeeShop> getCoffeeShops() {
        return coffeeShopRepository.findAll();
    }
}
