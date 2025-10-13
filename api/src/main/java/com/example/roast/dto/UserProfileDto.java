package com.example.roast.dto;

import java.util.List;

public class UserProfileDto {
    private UserDto user;
    private List<FavoriteDto> favorites;
    private List<UserRatingDto> ratings;
    private Integer totalRatings;
    private Double averageRatingGiven;
    
    // Constructors
    public UserProfileDto() {}
    
    public UserProfileDto(UserDto user, List<FavoriteDto> favorites, List<UserRatingDto> ratings,
                         Integer totalRatings, Double averageRatingGiven) {
        this.user = user;
        this.favorites = favorites;
        this.ratings = ratings;
        this.totalRatings = totalRatings;
        this.averageRatingGiven = averageRatingGiven;
    }
    
    // Getters and Setters
    public UserDto getUser() {
        return user;
    }
    
    public void setUser(UserDto user) {
        this.user = user;
    }
    
    public List<FavoriteDto> getFavorites() {
        return favorites;
    }
    
    public void setFavorites(List<FavoriteDto> favorites) {
        this.favorites = favorites;
    }
    
    public List<UserRatingDto> getRatings() {
        return ratings;
    }
    
    public void setRatings(List<UserRatingDto> ratings) {
        this.ratings = ratings;
    }
    
    public Integer getTotalRatings() {
        return totalRatings;
    }
    
    public void setTotalRatings(Integer totalRatings) {
        this.totalRatings = totalRatings;
    }
    
    public Double getAverageRatingGiven() {
        return averageRatingGiven;
    }
    
    public void setAverageRatingGiven(Double averageRatingGiven) {
        this.averageRatingGiven = averageRatingGiven;
    }
}