package roast.models;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.index.CompoundIndex;
import org.springframework.data.mongodb.core.index.Indexed;
import org.springframework.data.mongodb.core.mapping.Document;
import java.time.Instant;
import java.util.List;

@Document(collection = "comments") // The name of your Mongo collection
@CompoundIndex(name = "user_shop_idx", def = "{'userId': 1, 'shopId':1}", unique = true)
public class Comment {

    @Id
    private String id;

    @Indexed
    private Long shopId; 

    @Indexed
    private Long userId; 

    private String text;
    private double rating;
    private Instant createdAt = Instant.now();

    private List<Reply> replies;

    // No-args constructor for Spring/MongoDB
    public Comment() {}

    public Comment(Long userId, Long shopId, String text){
        this.userId = userId;
        this.shopId = shopId;
        this.text = text;
    }

    // --- Inner class for embedded replies ---
    public static class Reply {
        private Long userId;
        private String text;
        private Instant createdAt = Instant.now();

        // Getters and setters
        public Long getUserId() { return userId; }
        public void setUserId(Long userId) { this.userId = userId; }

        public String getText() { return text; }
        public void setText(String text) { this.text = text; }

        public Instant getCreatedAt() { return createdAt; }
        public void setCreatedAt(Instant createdAt) { this.createdAt = createdAt; }
    }

    // --- Getters and setters for Comment fields ---
    public String getId() { return id; }
    public void setId(String id) { this.id = id; }

    public Long getShopId() { return shopId; }
    public void setShopId(Long shopId) { this.shopId = shopId; }

    public Long getUserId() { return userId; }
    public void setUserId(Long userId) { this.userId = userId; }

    public String getText() { return text; }
    public void setText(String text) { this.text = text; }

    public double getRating() { return rating; }
    public void setRating(double rating) { this.rating = rating; }

    public Instant getCreatedAt() { return createdAt; }
    public void setCreatedAt(Instant createdAt) { this.createdAt = createdAt; }

    public List<Reply> getReplies() { return replies; }
    public void setReplies(List<Reply> replies) { this.replies = replies; }
}