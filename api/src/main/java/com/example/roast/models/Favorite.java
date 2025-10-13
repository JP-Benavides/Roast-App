package com.example.roast.models;

import jakarta.persistence.*;

@Entity
@Table(
        name = "user_favorite_shops",
        uniqueConstraints = @UniqueConstraint(columnNames = {"user_id", "coffee_id"})
)

public class Favorite {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;  // surrogate PK

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "coffee_id", referencedColumnName = "coffeePK", nullable = false)
    private CoffeeShop coffeeShop;

    // ---- constructors ----
    public Favorite() {}

    public Favorite(User user, CoffeeShop coffeeShop) {
        this.user = user;
        this.coffeeShop = coffeeShop;
    }

    // ---- getters & setters ----
    public Long getId() { return id; }

    public User getUser() { return user; }
    public void setUser(User user) { this.user = user; }

    public CoffeeShop getCoffeeShop() { return coffeeShop; }
    public void setCoffeeShop(CoffeeShop coffeeShop) { this.coffeeShop = coffeeShop; }
}
