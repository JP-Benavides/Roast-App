package com.example.roast.services;

import com.example.roast.models.CoffeeShop;

import java.util.List;

public interface CoffeeShopServiceInter {

    public CoffeeShop getCoffeeShopByName(String coffeeShopName);

    public List<CoffeeShop> getCoffeeShops();

    public boolean createCoffeeShop(CoffeeShop coffeeShop);


}
