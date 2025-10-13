package com.example.roast.services;

import com.example.roast.models.User;
import com.example.roast.repositories.UserRepository;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
@Transactional
public class UserService {
    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    // Create a new user
    @CacheEvict(value = "userByEmail", key = "#user.email")
    public boolean addUser(User user) {
        if (userRepository.findByEmail(user.getEmail()).isEmpty()) {
            userRepository.save(user);
            return true;
        }
        return false; // User with this email already exists
    }

    // Remove a user by ID
    @CacheEvict(value = {"userByEmail", "allUsers"}, allEntries = true)
    public boolean removeUser(Long userId) {
        if (userRepository.existsById(userId)) {
            userRepository.deleteById(userId);
            return true;
        }
        return false; // User not found
    }

    // Get user by email (cached)
    @Cacheable(value = "userByEmail", key = "#email")
    @Transactional(readOnly = true)
    public User getUserByEmail(String email) {
        return userRepository.findByEmail(email).orElse(null);
    }

    // Get user by ID
    @Transactional(readOnly = true)
    public User getUserById(Long id) {
        return userRepository.findById(id).orElse(null);
    }

    // Get all users
    @Cacheable(value = "allUsers")
    @Transactional(readOnly = true)
    public List<User> getAllUsers() {
        return userRepository.findAll();
    }

    // Check if user exists by ID
    @Transactional(readOnly = true)
    public boolean userExists(Long id) {
        return userRepository.existsById(id);
    }

    // Check if user exists by email
    @Transactional(readOnly = true)
    public boolean userExistsByEmail(String email) {
        return userRepository.findByEmail(email).isPresent();
    }

    // Update user information
    @CacheEvict(value = {"userByEmail", "allUsers"}, allEntries = true)
    public User updateUser(Long userId, User updatedUser) {
        Optional<User> existingUser = userRepository.findById(userId);
        if (existingUser.isPresent()) {
            User user = existingUser.get();
            user.setEmail(updatedUser.getEmail());
            return userRepository.save(user);
        }
        return null; // User not found
    }
}