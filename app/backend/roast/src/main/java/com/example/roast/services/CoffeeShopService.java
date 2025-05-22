package com.example.roast.services;

import com.example.roast.exceptions.NoCoffeeFoundException;
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
        CoffeeShop newCoffeeShop = coffeeShopRepository.getCoffeeShopByName(coffeeShopName);
        if (newCoffeeShop == null) {
            throw new NoCoffeeFoundException();
        }
        return newCoffeeShop;
    }

    public boolean addRating(String coffeeShopName, Double rating){
        CoffeeShop updatedCoffeeShop = coffeeShopRepository.getCoffeeShopByName(coffeeShopName);
        if (updatedCoffeeShop != null) {
            updatedCoffeeShop.increaseRating(rating);
            coffeeShopRepository.save(updatedCoffeeShop);
            return true;
        }
        return false;
    }

    @Override
    public List<CoffeeShop> getCoffeeShops() {
        List<CoffeeShop> shops = coffeeShopRepository.findAll();
        if(shops.isEmpty()){
            throw new NoCoffeeFoundException();
        }
        return shops;
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
