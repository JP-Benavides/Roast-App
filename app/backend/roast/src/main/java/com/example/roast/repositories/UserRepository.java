package com.example.roast.repositories;

import com.example.roast.models.CoffeeShop;
import com.example.roast.models.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {
    //Add interface for changing user information
}
