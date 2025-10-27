package roast.models;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.index.CompoundIndex;
import org.springframework.data.mongodb.core.index.Indexed;
import org.springframework.data.mongodb.core.mapping.Document;

import java.time.Instant;
import java.util.List;


@Document(collection = "comments")
public class CoffeeShopComment {

    @Id
    private String id; // Unique identifier for MongoDB

    private Long coffeeShopId; 

    private List<Comment> comments;

    // No-args constructor for Spring/MongoDB
    public CoffeeShopComment() {}

    public CoffeeShopComment(Long coffeeShopId){
        this.coffeeShopId = coffeeShopId;
    }

    // --- Getters and setters for CoffeeShopComment fields ---
    public Long getCoffeeShopId() { return coffeeShopId; }
    public void setCoffeeShopId(Long coffeeShopId) { this.coffeeShopId =
    coffeeShopId; }

    public List<Comment> getComments() { return comments; }
    public void setComments(List<Comment> comments) { this.comments = comments; }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public static class Comment{
        @Indexed
        private Long userId; 

        private String text;
        private Instant createdAt = Instant.now();

        private List<Reply> replies;

        // No-args constructor for Spring/MongoDB
        public Comment() {}

        public Comment(Long userId, String text){
            this.userId = userId;
            this.text = text;
        }

        // --- Getters and setters for Comment fields ---
        public Long getUserId() { return userId; }
        public void setUserId(Long userId) { this.userId = userId; }

        public String getText() { return text; }
        public void setText(String text) { this.text = text; }

        public Instant getCreatedAt() { return createdAt; }
        public void setCreatedAt(Instant createdAt) { this.createdAt = createdAt; }

        public List<Reply> getReplies() { return replies; }
        public void setReplies(List<Reply> replies) { this.replies = replies; }

        // --- Inner class for embedded replies ---
        public static class Reply {
            private Long userId;
            private String text;
            private Instant createdAt = Instant.now();

            public Reply() {}

            public Reply(Long userId, String text){
                this.userId = userId;
                this.text = text;
            }

            // Getters and setters
            public Long getUserId() { return userId; }
            public void setUserId(Long userId) { this.userId = userId; }

            public String getText() { return text; }
            public void setText(String text) { this.text = text; }

            public Instant getCreatedAt() { return createdAt; }
            public void setCreatedAt(Instant createdAt) { this.createdAt = createdAt;}
        }
    }
    
}