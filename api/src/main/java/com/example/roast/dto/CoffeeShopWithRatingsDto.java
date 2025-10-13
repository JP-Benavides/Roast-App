package com.example.roast.dto;

import java.util.List;

public class CoffeeShopWithRatingsDto {
    private CoffeeShopDto coffeeShop;
    private Double averageRating;
    private Integer totalRatings;
    private List<UserRatingDto> recentRatings;
    private UserRatingDto userRating; // Current user's rating, if any
    
    // Constructors
    public CoffeeShopWithRatingsDto() {}
    
    public CoffeeShopWithRatingsDto(CoffeeShopDto coffeeShop, Double averageRating, 
                                   Integer totalRatings, List<UserRatingDto> recentRatings, 
                                   UserRatingDto userRating) {
        this.coffeeShop = coffeeShop;
        this.averageRating = averageRating;
        this.totalRatings = totalRatings;
        this.recentRatings = recentRatings;
        this.userRating = userRating;
    }
    
    // Getters and Setters
    public CoffeeShopDto getCoffeeShop() {
        return coffeeShop;
    }
    
    public void setCoffeeShop(CoffeeShopDto coffeeShop) {
        this.coffeeShop = coffeeShop;
    }
    
    public Double getAverageRating() {
        return averageRating;
    }
    
    public void setAverageRating(Double averageRating) {
        this.averageRating = averageRating;
    }
    
    public Integer getTotalRatings() {
        return totalRatings;
    }
    
    public void setTotalRatings(Integer totalRatings) {
        this.totalRatings = totalRatings;
    }
    
    public List<UserRatingDto> getRecentRatings() {
        return recentRatings;
    }
    
    public void setRecentRatings(List<UserRatingDto> recentRatings) {
        this.recentRatings = recentRatings;
    }
    
    public UserRatingDto getUserRating() {
        return userRating;
    }
    
    public void setUserRating(UserRatingDto userRating) {
        this.userRating = userRating;
    }
}