package com.example.roast.controllers;
import com.example.roast.models.CoffeeShop;
import com.example.roast.models.User;
import com.example.roast.services.CoffeeShopService;
import org.apache.coyote.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
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

    @GetMapping("/coffeeshops-byname")
    public ResponseEntity<List<CoffeeShop>> getCoffeeShopsByName(@RequestParam String coffeeShopName){
        List<CoffeeShop> shops = coffeeShopService.getCoffeeShopsByName(coffeeShopName);
        return ResponseEntity.ok(shops);
    }


    @GetMapping("/coffeeshops")
    public ResponseEntity<List<CoffeeShop>> getAllCoffeeShops() {
        List<CoffeeShop> shops = coffeeShopService.getCoffeeShops();
        if (shops.isEmpty()) {
            return ResponseEntity.noContent().build();
        }
        return ResponseEntity.ok(shops);
    }

    @PatchMapping("/rating-change")
    public ResponseEntity<String> addRating(@RequestParam String coffeeShopName,
                                            @RequestParam Double lat, @RequestParam Double
                                            lon, @RequestParam Double rating){

        if (!coffeeShopService.addRating(coffeeShopName, lat, lon, rating)) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("No Coffee Shops with that name");
        }
        return ResponseEntity.ok(rating.toString());
    }

    @PostMapping("/coffeeshops-create")
    public ResponseEntity<CoffeeShop> createCoffeeShop(@RequestBody CoffeeShop coffeeShop){
        if (coffeeShopService.createCoffeeShop(coffeeShop)){
            return ResponseEntity.ok(coffeeShop);
        }
        return ResponseEntity.noContent().build();
    }

    @PatchMapping({"/favorites-add", "/favorites-remove"})
    public ResponseEntity<String> addFavoriteCoffeeShop(@RequestParam Long userId,
                                                        @RequestParam Long shopId) {
        if(coffeeShopService.addFavoriteCoffeeShop(userId,shopId)){
            return ResponseEntity.ok("Favorite Coffee Shop Added");
        }
        return ResponseEntity.noContent().build();
    }

    public ResponseEntity<Long> removeFavorite(@RequestBody Long userId, Long shopId){
        if(coffeeShopService.removeFavoriteCoffeeShop(userId, shopId)){
            return ResponseEntity.ok(shopId);
        }
        return ResponseEntity.noContent().build();

    }

}
