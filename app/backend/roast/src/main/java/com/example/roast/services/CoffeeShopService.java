package com.example.roast.services;
import com.example.roast.models.CoffeeShop;
import com.example.roast.models.User;
import com.example.roast.models.Favorite;
import com.example.roast.repositories.CoffeeShopRepository;
import com.example.roast.repositories.FavoriteRepository;
import com.example.roast.repositories.UserRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Service
@Transactional
public class CoffeeShopService implements CoffeeShopServiceInter{
    private final CoffeeShopRepository coffeeShopRepository;
    private final FavoriteRepository favoriteRepository;
    private final UserRepository userRepository;

    public CoffeeShopService(CoffeeShopRepository coffeeShopRepository,
                             FavoriteRepository favoriteRepository,
                             UserRepository userRepository) {
        this.coffeeShopRepository = coffeeShopRepository;
        this.favoriteRepository = favoriteRepository;
        this.userRepository = userRepository;
    }

    @Override
    public List<CoffeeShop> getCoffeeShopsByName(String coffeeShopName) {
        List<CoffeeShop> shops = coffeeShopRepository.findAllByName(coffeeShopName);
        if (shops.isEmpty()) {
            return new ArrayList<>();
        }
        return shops;
    }

    public boolean addRating(String coffeeShopName,Double lat, Double lon ,Double rating){
        List<CoffeeShop> shops = coffeeShopRepository.findAllByName(coffeeShopName);
        CoffeeShop shop = new CoffeeShop();
        if (!shops.isEmpty()) {
            for(CoffeeShop coffeeShop : shops) {
                if (Objects.equals(coffeeShop.getLat(), lat) && Objects.equals(coffeeShop.getLon(), lon)) {
                    coffeeShop.addNewRating(rating);
                    coffeeShopRepository.save(coffeeShop);
                    return true;
                }
            }
        }
        return false;
    }

    @Override
    public List<CoffeeShop> getCoffeeShops() {
        List<CoffeeShop> shops = coffeeShopRepository.findAll();
        if (shops.isEmpty()) { return new ArrayList<>(); }
        return shops;
    }

    public boolean createCoffeeShop(CoffeeShop coffeeShop) {
        if (coffeeShopRepository.existsById(coffeeShop.getId())){
            return false;
        }
        coffeeShopRepository.save(coffeeShop);
        return true;
    }


    public boolean addFavoriteCoffeeShop(Long userId, Long shopId) {
        if(!favoriteRepository.existsByUser_IdAndCoffeeShop_Id(userId,shopId)
                && coffeeShopRepository.existsById(shopId)){
            favoriteRepository.addNewFavoriteCoffeeShop(userId, shopId);
            return true;
        }
        return false;
    }

    public boolean removeFavoriteCoffeeShop(Long userId, Long shopId) {
        if(favoriteRepository.existsByUser_IdAndCoffeeShop_Id(userId, shopId) &&
                coffeeShopRepository.existsById(shopId)){
            favoriteRepository.deleteByUser_IdAndCoffeeShop_Id(userId,shopId);
            return true;
        }
        return false;
    }
}
