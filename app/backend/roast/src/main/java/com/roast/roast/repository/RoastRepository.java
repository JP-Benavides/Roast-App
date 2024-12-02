package com.roast.roast.repository;

import com.roast.roast.model.CoffeeShop;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RoastRepository extends MongoRepository<CoffeeShop, String> {

    List<CoffeeShop> findByName(String name);
    List<CoffeeShop> findByPrice(String price);
    List<CoffeeShop> findNearMe(String location);
    List<CoffeeShop> findByPreferredDrink(String drink);
    CoffeeShop deleteCoffeeShop(String id);

}
