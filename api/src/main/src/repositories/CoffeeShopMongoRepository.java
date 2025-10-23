package roast.repositories;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import roast.models.CoffeeShopMongo;

import org.springframework.roast.models.Comment;

import java.util.List;

@Repository
public interface CoffeeShopMongoRepository extends MongoRepository<Comment> {
    
    List<CoffeeShopMongo> findById(String Id);
}