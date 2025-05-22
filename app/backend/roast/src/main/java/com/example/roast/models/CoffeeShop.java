package com.example.roast.models;

import jakarta.persistence.*;

@Entity
@Table(name = "coffees")
public class CoffeeShop {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Double lat;
    private Double lon;
    private String city;

    @Column(name = "housenumber")
    private String houseNumber;

    private String state;
    private String street;
    private String name;
    private String phone;
    private Double capacity;
    private String postcode;
    private String email;

    @Column(name = "postal_code")
    private Double postalCode;

    private String instagram;
    private String twitter;
    private String location;

    @Column(name = "addr")
    private Double addr;

    private Double rating;
    private Integer numOfRatings;

    // No-arg constructor
    public CoffeeShop() {}

    // Getters and Setters

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public Double getLat() { return lat; }
    public void setLat(Double lat) { this.lat = lat; }

    public Double getLon() { return lon; }
    public void setLon(Double lon) { this.lon = lon; }

    public String getCity() { return city; }
    public void setCity(String city) { this.city = city; }

    public String getHouseNumber() { return houseNumber; }
    public void setHouseNumber(String houseNumber) { this.houseNumber = houseNumber; }

    public String getState() { return state; }
    public void setState(String state) { this.state = state; }

    public String getStreet() { return street; }
    public void setStreet(String street) { this.street = street; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public Double getCapacity() { return capacity; }
    public void setCapacity(Double capacity) { this.capacity = capacity; }

    public String getPostcode() { return postcode; }
    public void setPostcode(String postcode) { this.postcode = postcode; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public Double getPostalCode() { return postalCode; }
    public void setPostalCode(Double postalCode) { this.postalCode = postalCode; }

    public String getInstagram() { return instagram; }
    public void setInstagram(String instagram) { this.instagram = instagram; }

    public String getTwitter() { return twitter; }
    public void setTwitter(String twitter) { this.twitter = twitter; }

    public String getLocation() { return location; }
    public void setLocation(String location) { this.location = location; }

    public Double getAddr() { return addr; }
    public void setAddr(Double addr) { this.addr = addr; }

    public Double getRating() { return rating; }
    public void setRating(Double rating) { this.rating = rating; }
    public Integer getNumOfRatings() { return numOfRatings; }
    public void setNumOfRatings(Integer numOfRatings) { this.numOfRatings = numOfRatings; }

    public void increaseRating(Double newRating){
        numOfRatings++;
        rating = (numOfRatings + newRating) / numOfRatings;
    }

    public void decreaseRating(Double newRating){
        numOfRatings--;
        rating = (numOfRatings - newRating) / numOfRatings;
    }
}
