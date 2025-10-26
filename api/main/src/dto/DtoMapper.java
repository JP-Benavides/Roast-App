package roast.dto;

import roast.models.CoffeeShop;
import roast.models.Favorite;
import roast.models.User;
import roast.models.UserRating;

public class DtoMapper {
    
    // Convert User entity to UserDto
    public static UserDto toUserDto(User user) {
        if (user == null) return null;
        
        return new UserDto(
            user.getId(),
            user.getEmail()
        );
    }
    
    // Convert CoffeeShop entity to CoffeeShopDto
    public static CoffeeShopDto toCoffeeShopDto(CoffeeShop coffeeShop) {
        if (coffeeShop == null) return null;
        
        return new CoffeeShopDto(
            coffeeShop.getId(),
            coffeeShop.getName(),
            coffeeShop.getLat(),
            coffeeShop.getLon(),
            coffeeShop.getCity(),
            coffeeShop.getState(),
            coffeeShop.getStreet(),
            coffeeShop.getRating(),
            coffeeShop.getNumberOfRatings(),
            coffeeShop.getTileId()
        );
    }
    
    // Convert UserRating entity to UserRatingDto
    public static UserRatingDto toUserRatingDto(UserRating userRating) {
        if (userRating == null) return null;
        
        return new UserRatingDto(
            userRating.getId(),
            toUserDto(userRating.getUser()),
            toCoffeeShopDto(userRating.getCoffeeShop()),
            userRating.getRating(),
            userRating.getReviewText(),
            userRating.getCreatedAt(),
            userRating.getUpdatedAt()
        );
    }
    
    // Convert Favorite entity to FavoriteDto
    public static FavoriteDto toFavoriteDto(Favorite favorite) {
        if (favorite == null) return null;
        
        return new FavoriteDto(
            favorite.getId(),
            toUserDto(favorite.getUser()),
            toCoffeeShopDto(favorite.getCoffeeShop())
        );
    }
}