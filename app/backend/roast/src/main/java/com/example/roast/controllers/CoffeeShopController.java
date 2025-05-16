package com.example.roast.controllers;
import ch.qos.logback.core.model.Model;
import com.example.roast.models.CoffeeShop;
import com.example.roast.repositories.CoffeeShopRepository;
import com.example.roast.services.CoffeeShopService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
public class CoffeeShopController {
    private final CoffeeShopService coffeeShopService;

    public CoffeeShopController(CoffeeShopService coffeeShopService) {
        this.coffeeShopService = coffeeShopService;
    }

    @GetMapping("/api/coffeeshops")
    public ResponseEntity<CoffeeShop> getCoffeeShop(@RequestParam String coffeeShopName){
        CoffeeShop coffeeShop = coffeeShopService.getCoffeeShopByName(coffeeShopName);
        return ResponseEntity.ok(coffeeShop);
    }

    @PostMapping("/api/coffeeshops")
    public boolean createCoffeeShop(@RequestBody CoffeeShop coffeeShop){
        return coffeeShopService.createCoffeeShop(coffeeShop);
    }

}
