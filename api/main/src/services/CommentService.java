package roast.services;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import roast.models.CoffeeShopComment; 
import roast.repositories.CommentRepository; 
import roast.repositories.CoffeeShopRepository;
import roast.repositories.UserRepository; 


import java.time.Duration;
import java.util.*;
import java.util.stream.Collectors;

import java.util.Optional;

@Service
@Transactional
public class CommentService {

    private final CommentRepository commentRepository;
    private final CoffeeShopRepository coffeeShopRepository; 
    private final UserRepository userRepository; 

    @Autowired
    public CommentService(CommentRepository commentRepository, 
                         CoffeeShopRepository coffeeShopRepository,
                         UserRepository userRepository) {
        this.commentRepository = commentRepository;
        this.coffeeShopRepository = coffeeShopRepository;
        this.userRepository = userRepository;
    }

    public boolean addCoffeeShopComment(Long userId, Long coffeeShopId, String text){
        
        // Validate that coffee shop exists
        if (!coffeeShopRepository.existsById(coffeeShopId)) {
            return false;
        }

        // Validate that user exists  
        if (!userRepository.existsById(userId)) {
            return false;
        }

        // Get or create CoffeeShopComment
        CoffeeShopComment coffeeShopComment = commentRepository.findById(coffeeShopId.toString())
            .orElse(new CoffeeShopComment(coffeeShopId));

        // Check if user has already commented
        boolean userAlreadyCommented = coffeeShopComment.getComments() != null && 
            coffeeShopComment.getComments().stream()
                .anyMatch(comment -> comment.getUserId().equals(userId));

        if (userAlreadyCommented) {
            return false; // User already commented
        }

        // Create new comment
        CoffeeShopComment.Comment newComment = new CoffeeShopComment.Comment(userId, text);
        
        // Initialize comments list if null
        if (coffeeShopComment.getComments() == null) {
            coffeeShopComment.setComments(new ArrayList<>());
        }
        
        // Add the comment
        coffeeShopComment.getComments().add(newComment);
        commentRepository.save(coffeeShopComment);
        return true;
    }

    public boolean removeComment(Long coffeeShopId) {
        
        // Check if comment exists
        Optional<CoffeeShopComment> commentOpt = commentRepository.findById(coffeeShopId.toString());
        if (!commentOpt.isPresent()) {
            System.out.println("Remove Comment: Comment not found with ID: " + coffeeShopId);
            return false;
        }

        // Remove all comments for this coffee shop
        commentRepository.deleteById(coffeeShopId.toString());
        return true;
    }

    public boolean editComment(Long coffeeShopId, Long userId, String newText){

        Optional<CoffeeShopComment> commentOpt = commentRepository.findById(coffeeShopId.toString());
        if(!commentOpt.isPresent()){
            System.out.println("Edit Comment: Comment not found with ID: " + coffeeShopId); 
            return false;
        }

        CoffeeShopComment coffeeShopComment = commentOpt.get();
        CoffeeShopComment.Comment userComment = coffeeShopComment.getComments().stream()
            .filter(c -> c.getUserId().equals(userId))
            .findFirst()
            .orElse(null);
            
        if (userComment == null) {
            System.out.println("Edit Comment: User has not commented on this coffee shop.");
            return false;
        }
        
        userComment.setText(newText);
        commentRepository.save(coffeeShopComment);
        return true;
    }

    public boolean hasUserCommented(Long userId, Long coffeeShopId){
        Optional<CoffeeShopComment> coffeeShopComment = commentRepository.findById(coffeeShopId.toString());
        return coffeeShopComment.isPresent() && 
               coffeeShopComment.get().getComments() != null &&
               coffeeShopComment.get().getComments().stream()
                   .anyMatch(comment -> comment.getUserId().equals(userId));
    }

}
