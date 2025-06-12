package com.example.roast.models;
import jakarta.persistence.*;

import java.util.List;

@Entity
@Table(name = "usertocoffee")//Create Join table
public class UserToCoffee {

    @Id
    private Long id;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @ManyToOne
    @JoinColumn(name = "coffee_id")
    private CoffeeShop coffeeShop;


    @OneToMany
    private List<CoffeeShop> usersCoffeeShops;

    private double rating;
    private String review;


    public UserToCoffee(User user, CoffeeShop coffeeShop) {
        this.user = user;
        this.coffeeShop = coffeeShop;
    }

    public UserToCoffee() {}

    public User getUser() { return user; }
    public CoffeeShop getCoffeeShop() { return coffeeShop; }

    public void setRating(double rating) {
        this.rating = rating;
    }

    public void setReview(String review) {
        this.review = review;
    }
}
