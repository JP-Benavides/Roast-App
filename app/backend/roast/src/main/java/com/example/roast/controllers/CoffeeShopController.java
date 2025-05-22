package com.example.roast.controllers;
import com.example.roast.models.CoffeeShop;
import com.example.roast.services.CoffeeShopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api")
public class CoffeeShopController {
    private final CoffeeShopService coffeeShopService;

    @Autowired
    public CoffeeShopController(CoffeeShopService coffeeShopService) {
        this.coffeeShopService = coffeeShopService;
    }

    @GetMapping("/coffeeshops")
    public ResponseEntity<CoffeeShop> getCoffeeShop(@RequestParam String coffeeShopName){
        CoffeeShop coffeeShop = coffeeShopService.getCoffeeShopByName(coffeeShopName);
        return ResponseEntity.ok(coffeeShop);
    }


    @GetMapping("/allcoffeeshops")
    public ResponseEntity<List<CoffeeShop>> getAllCoffeeShops() {
        List<CoffeeShop> shops = coffeeShopService.getCoffeeShops();
        return ResponseEntity.ok(shops);
    }

    @PostMapping("/coffeeshops")
    public boolean createCoffeeShop(@RequestBody CoffeeShop coffeeShop){
        return coffeeShopService.createCoffeeShop(coffeeShop);
    }

}
