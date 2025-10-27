package roast.repositories;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;
import roast.models.CoffeeShopComment;
import java.util.List;
import java.util.Optional;

@Repository
public interface CommentRepository extends MongoRepository<CoffeeShopComment, String> {
    List<CoffeeShopComment> findById(Long shopId); 
}