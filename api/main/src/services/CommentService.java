package roast.services;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import roast.models.Comment; 
import roast.repositories.CommentRepository; 
import roast.repositories.CoffeeShopRepository;
import roast.repositories.UserRepository; 


import java.time.Duration;
import java.util.*;
import java.util.stream.Collectors;
import java.util.Optional;

@Service
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

    public boolean addComment(String userId, String coffeeShopId, String text){
        
        // Validate that coffee shop exists
        if (!coffeeShopRepository.existsById(coffeeShopId)) {
            System.out.println("Add Comment: Coffee shop not found with ID: " + coffeeShopId);
            return false;
        }

        // Validate that user exists  
        if (!userRepository.existsById(userId)) {
            System.out.println("Add Comment: User not found with ID: " + userId);
            return false;
        }

        Optional<Comment> oldComment = commentRepository.findByUserAndShop(userId, coffeeShopId); 
        if(oldComment.isPresent()){
            return false; 
        }

        // Create new comment
        Comment newComment = new Comment();
        newComment.setUserId(userId);
        newComment.setShopId(coffeeShopId);
        newComment.setText(text);
        
        commentRepository.save(newComment);
        return true; 
    }

    public boolean removeComment(String commentId) {
        
        //Get the comment to validate it exists
        Optional<Comment> commentOpt = commentRepository.findById(commentId);
        if (!commentOpt.isPresent()) {
            System.out.println("Remove Comment: Comment not found with ID: " + commentId);
            return false; 
        }
        
        // Delete the comment
        commentRepository.deleteById(commentId);

        return true;
    }

    public boolean editComment(String commentId, String newText){

        Optional<Comment> commentOpt = commentRepository.findById(commentId);
        if(!commentOpt.isPresent()){
            System.out.println("Edit Comment: Comment not found with ID: " + commentId); 
            return false;
        }

        Comment comment = commentOpt.get();
        comment.setText(newText); 
        commentRepository.save(comment); 
        
        return true;
    }

    public boolean hasUserCommented(String userId, String coffeeShopId){
        Optional<Comment> oldComment = commentRepository.findByUserAndShop(userId, coffeeShopId); 
        return oldComment.isPresent();
    }

}
