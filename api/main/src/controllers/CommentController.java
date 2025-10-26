package roast.controllers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import roast.services.CommentService;
import roast.models.Comment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import roast.models.CoffeeShop;
import roast.services.CoffeeShopService;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.Optional;


@RestController
@RequestMapping("/api/comment")
public class CommentController {

    final private CommentService commentService; 

    @Autowired
    public CommentController(CommentService commentService){
        this.commentService = commentService; 
    }

    @GetMapping("/make")
    public ResponseEntity<String> createComment(@RequestParam Long userId, @RequestParam Long coffeeShopId, @RequestParam String text){
        if(commentService.hasUserCommented(userId, coffeeShopId)){
            return ResponseEntity.badRequest().body("user has already commented");
        }
        commentService.addComment(userId, coffeeShopId, text); 
        return ResponseEntity.ok("Coffee Shop:"+ coffeeShopId + " with UserId:" + userId +" has been created"); 
    }  
}
