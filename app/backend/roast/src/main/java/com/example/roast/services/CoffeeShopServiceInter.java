package com.example.roast.services;

import com.example.roast.models.CoffeeShop;

import java.util.List;

public interface CoffeeShopServiceInter {

    public List<CoffeeShop> getCoffeeShopsByName(String coffeeShopName);

    public List<CoffeeShop> getCoffeeShops();

    public boolean addRating(String coffeeShopName,Double lat, Double lon ,Double rating);

}
