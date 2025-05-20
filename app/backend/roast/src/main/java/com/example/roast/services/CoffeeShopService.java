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
        try {
            List<CoffeeShop> shops = coffeeShopRepository.findAll();
            System.out.println("Fetched shops: " + shops);
            return shops;
        } catch (Exception e) {
            e.printStackTrace();
            return List.of(); // Return empty list on failure
        }
    }


    public boolean createCoffeeShop(CoffeeShop coffeeShop){
        if(coffeeShop.getName() != null) {
            CoffeeShop newCoffeeShop = new CoffeeShop();
            newCoffeeShop.setName(coffeeShop.getName());
            newCoffeeShop.setPhone(coffeeShop.getPhone());
            newCoffeeShop.setEmail(coffeeShop.getEmail());
            newCoffeeShop.setCity(coffeeShop.getCity());
            newCoffeeShop.setState(coffeeShop.getState());
            newCoffeeShop.setInstagram(coffeeShop.getInstagram());
            newCoffeeShop.setLocation(coffeeShop.getLocation());
            newCoffeeShop.setEmail(coffeeShop.getEmail());
            coffeeShopRepository.save(newCoffeeShop);
            return true;
        }
        return false;
    }
}
