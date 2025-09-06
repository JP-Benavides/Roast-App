package com.example.roast.models;

import jakarta.persistence.*;

@Entity
@Table(name = "coffees")
public class CoffeeShop {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "coffeePK")
    private Long id;

    private Double lat;
    private Double lon;
    private String city;
    private String state;
    private String street;
    private String name;

    @Column(name = "addr")
    private Double address;

    private Double rating;

    @Column(name = "numofratings")
    private Integer numberOfRatings;


    // No-arg constructor
    public CoffeeShop() {}

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

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

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Double getAddress() {
        return address;
    }

    public void setAddress(Double address) {
        this.address = address;
    }

    public Double getRating() {
        return rating;
    }


    public Integer getNumberOfRatings() {
        return numberOfRatings;
    }

    public void setNumberOfRatings(Integer numberOfRatings) {
        this.numberOfRatings = numberOfRatings;
    }

    public void addNewRating(Double newRating){
        numberOfRatings++;
        rating = (rating + newRating) / numberOfRatings;
    }
}

