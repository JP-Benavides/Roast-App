package roast.repositories;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;
import roast.models.Comment;
import java.util.List;
import java.util.Optional;

@Repository
public interface CommentRepository extends MongoRepository<Comment, String> {
    List<Comment> findByUserId(Long userId); 
    List<Comment> findByShopId(Long shopId); 
    Optional<Comment> findByUserIdAndShopId(Long userId, Long shopId);
}