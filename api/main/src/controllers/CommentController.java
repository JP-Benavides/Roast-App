import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import services.CommentService;
import models.Comment;

@Controller
@RequestMapping("/api/comment")
public class CommentController {

    @Autowired
    final private CommentService commentService; 

    
    public CommentController(){
        commentService = new CommentService(); 
    }

    @GetMapping("/make")
    public ResponseEntity<Comment> createComment(@RequestParam String userId, @RequestParam String coffeeShopId, @RequestParam String text){
        if(commentService.hasUserCommented(userId, coffeeShopId)){
            return ResponseEntity.badRequest("user has already commented");
        }
        commentService.addComment(userId, coffeeShopId, text); 
        return ResponseEntity.ok("Coffee Shop:"+ coffeeShopId + " with UserId:" + userId +" has been created"); 
    } 

    
    
}
