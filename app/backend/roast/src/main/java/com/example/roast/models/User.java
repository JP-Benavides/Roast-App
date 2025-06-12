package com.example.roast.models;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "users") //Still have to create user db
public class User {

    @Id
    private String id;
    private String email;

    public User(String id) {
        this.id = id;
    }
    public User() {}

    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
}
