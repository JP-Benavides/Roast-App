package com.example.roast.dto;

import java.util.List;

public class CoffeeShopCluster {
    private Double lat;
    private Double lon;
    private Integer count;
    private List<Long> coffeeShopIds;
    private String clusterType; // "individual" or "cluster"
    
    // Constructors
    public CoffeeShopCluster() {}
    
    // For individual coffee shops
    public CoffeeShopCluster(Long coffeeShopId, String name, Double lat, Double lon) {
        this.lat = lat;
        this.lon = lon;
        this.count = 1;
        this.coffeeShopIds = List.of(coffeeShopId);
        this.clusterType = "individual";
    }
    
    // For clustered coffee shops
    public CoffeeShopCluster(Double lat, Double lon, Integer count, List<Long> coffeeShopIds) {
        this.lat = lat;
        this.lon = lon;
        this.count = count;
        this.coffeeShopIds = coffeeShopIds;
        this.clusterType = "cluster";
    }
    
    // Getters and Setters
    public Double getLat() {
        return lat;
    }
    
    public void setLat(Double lat) {
        this.lat = lat;
    }
    
    public Double getLon() {
        return lon;
    }
    
    public void setLon(Double lon) {
        this.lon = lon;
    }
    
    public Integer getCount() {
        return count;
    }
    
    public void setCount(Integer count) {
        this.count = count;
    }
    
    public List<Long> getCoffeeShopIds() {
        return coffeeShopIds;
    }
    
    public void setCoffeeShopIds(List<Long> coffeeShopIds) {
        this.coffeeShopIds = coffeeShopIds;
    }
    
    public String getClusterType() {
        return clusterType;
    }
    
    public void setClusterType(String clusterType) {
        this.clusterType = clusterType;
    }
}