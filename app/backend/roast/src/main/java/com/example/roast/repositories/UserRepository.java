package com.example.roast.repositories;

import com.example.roast.models.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface UserRepository extends JpaRepository<User, Long> {
    //Add interface for changing user information

    public Optional<User> findByEmail(String email);
}
