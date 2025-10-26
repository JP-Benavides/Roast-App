package roast.repositories;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import roast.models.Comment;

import java.util.List;

@Repository
public interface CommentRepository extends MongoRepository<Comment, String> {
    List<Comment> findByUserId(String userId); 
    List<Comment> findByShopId(String shopId); 
    Optional<Commen> findByUserAndShop(String userId, String shopId);
}