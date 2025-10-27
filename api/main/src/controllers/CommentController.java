package roast.controllers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import roast.services.CommentService;
import roast.models.CoffeeShopComment;

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
    public ResponseEntity<String> createComment(@RequestParam Long coffeeShopId, @RequestParam Long userId, @RequestParam String text){
        boolean success = commentService.addCoffeeShopComment(userId, coffeeShopId, text);
        if (!success){
            return ResponseEntity.badRequest().body("User has already commented");
        }
        return ResponseEntity.ok("Coffee Shop:"+ coffeeShopId + " with UserId:" + userId +" has been created");
    }  

    @GetMapping("/edit")
    public ResponseEntity<String> editComment(@RequestParam Long coffeeShopId, @RequestParam Long userId, @RequestParam String newText){
        boolean success = commentService.editComment(coffeeShopId, userId, newText);
        if(!success){
            return ResponseEntity.badRequest().body("Failed to edit comment");
        }
        return ResponseEntity.ok("Comment edited successfully for Coffee Shop:"+ coffeeShopId + " by UserId:" + userId);
    }

    @GetMapping("/remove")
    public ResponseEntity<String> removeComment(@RequestParam Long coffeeShopId){
        boolean success = commentService.removeComment(coffeeShopId);
        if(!success){
            return ResponseEntity.badRequest().body("Failed to remove comment");
        }
        return ResponseEntity.ok("Comment removed successfully for Coffee Shop:" + coffeeShopId);
    }
}