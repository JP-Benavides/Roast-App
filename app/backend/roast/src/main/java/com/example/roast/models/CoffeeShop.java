package com.example.roast.models;

import jakarta.persistence.*;

@Entity
@Table(name = "CoffeeShops")

public class CoffeeShop {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(nullable = false)
    private String city;

    @Column(nullable = false)
    private Integer houseNumber;

    @Column(nullable = false)
    private String state;

    @Column(nullable = false)
    private String street;

    @Column(nullable = false)
    private String name;

    @Column(nullable = true)
    private String phone;

    @Column(nullable = true)
    private String instagram;

    @Column(nullable = false)
    private String rating;

    //Constructor
    public CoffeeShop(String city, Integer houseNumber, String state, String street, String name, String phone, String instagram, String rating) {
        this.city = city;
        this.houseNumber = houseNumber;
        this.state = state;
        this.street = street;
        this.name = name;
        this.phone = phone;
        this.instagram = instagram;
        this.rating = rating;
    }

    public CoffeeShop() {}

    //Getters
    String getCity(){
        return city;
    }
    Integer getHouseNumber(){
        return houseNumber;
    }
    String getState(){
        return state;
    }
    String getStreet(){
        return street;
    }
    String getName(){
        return name;
    }
    String getPhone(){
        return phone;
    }
    String getInstagram(){
        return instagram;
    }
    String getRating(){
        return rating;
    }

    //Setters
    void setCity(String city){
        this.city = city;
    }
    void setHouseNumber(Integer houseNumber){
        this.houseNumber = houseNumber;
    }
    void setState(String state){
        this.state = state;
    }
    void setStreet(String street){
        this.street = street;
    }
    void setName(String name){
        this.name = name;
    }
    void setPhone(String phone){
        this.phone = phone;
    }
    void setInstagram(String instagram){
        this.instagram = instagram;
    }
    void setRating(String rating){
        this.rating = rating;
    }


}
