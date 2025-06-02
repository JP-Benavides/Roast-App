package com.example.roast.dtos;

public class CoffeeMapDTO {
    private Long id;
    private String name;
    private Double lat;
    private Double lon;
    private Double rating;

    public CoffeeMapDTO(Long id, String name, Double lat, Double lon, Double rating) {
        this.id = id;
        this.name = name;
        this.lat = lat;
        this.lon = lon;
        this.rating = rating;
    }

    public Long getId() { return id; }
    public String getName() { return name; }
    public Double getLat() { return lat; }
    public Double getLon() { return lon; }
    public Double getRating() { return rating; }
}