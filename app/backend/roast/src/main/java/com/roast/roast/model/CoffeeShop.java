package com.roast.roast.model;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "CoffeeShops")
public class CoffeeShop {

    @Id
    private String id;

    private String name;
    private double rating;
    private String description;
    private String address;
    private String price;
    private String preferredDrink;

    public CoffeeShop() {}

    public CoffeeShop(String id, String name, double rating, String description, String address, String price, String preferredDrink) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.rating = rating;
        this.address = address;
        this.price = price;
        this.preferredDrink = preferredDrink;
    }

    public String getId() {return id;}
    public void setId(String id) {this.id = id;}
    public double getRating() {return rating;}
    public void setRating(double rating) {this.rating = rating;}
    public String getDescription() {return description;}
    public void setDescription(String description) {this.description = description;}
    public String getAddress() {return address;}
    public void setAddress(String address) {this.address = address;}
    public String getPrice() {return price;}
    public void setPrice(String price) {this.price = price;}
    public String getPreferredDrink() {return preferredDrink;}
    public void setPreferredDrink(String drink) {this.preferredDrink = drink;}
}
