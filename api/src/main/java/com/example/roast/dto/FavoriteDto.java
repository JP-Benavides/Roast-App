package com.example.roast.dto;

public class FavoriteDto {
    private Long id;
    private UserDto user;
    private CoffeeShopDto coffeeShop;
    
    // Constructors
    public FavoriteDto() {}
    
    public FavoriteDto(Long id, UserDto user, CoffeeShopDto coffeeShop) {
        this.id = id;
        this.user = user;
        this.coffeeShop = coffeeShop;
    }
    
    // Getters and Setters
    public Long getId() {
        return id;
    }
    
    public void setId(Long id) {
        this.id = id;
    }
    
    public UserDto getUser() {
        return user;
    }
    
    public void setUser(UserDto user) {
        this.user = user;
    }
    
    public CoffeeShopDto getCoffeeShop() {
        return coffeeShop;
    }
    
    public void setCoffeeShop(CoffeeShopDto coffeeShop) {
        this.coffeeShop = coffeeShop;
    }
    
}