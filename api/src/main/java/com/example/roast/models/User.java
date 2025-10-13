package com.example.roast.models;

import jakarta.persistence.*;

@Entity
@Table(name = "users")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String email;

    private Long numberOfReviews; 

    // ---- Constructors ----
    public User() {}

    public User(Long id, String email, Long numberOfReviews) {
        this.id = id;
        this.email = email;
        this.numberOfReviews = numberOfReviews;
    }

    // ---- Getters & Setters ----
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public Long getNumberOfReviews(){return numberOfReviews;}
    public void addReview(){numberOfReviews += 1;}
    public void removeReview(){numberOfReviews -= 1;}
}
