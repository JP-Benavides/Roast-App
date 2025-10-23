package roast.dto;

public class CoffeeShopMapDto {
    private Long id;
    private String name;
    private Double lat;
    private Double lon;
    private Double rating;
    private Integer numberOfRatings;
    
    // Constructors
    public CoffeeShopMapDto() {}
    
    public CoffeeShopMapDto(Long id, String name, Double lat, Double lon, Double rating, Integer numberOfRatings) {
        this.id = id;
        this.name = name;
        this.lat = lat;
        this.lon = lon;
        this.rating = rating;
        this.numberOfRatings = numberOfRatings;
    }
    
    // Getters and Setters
    public Long getId() {
        return id;
    }
    
    public void setId(Long id) {
        this.id = id;
    }
    
    public String getName() {
        return name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    
    public Double getLat() {
        return lat;
    }
    
    public void setLat(Double lat) {
        this.lat = lat;
    }
    
    public Double getLon() {
        return lon;
    }
    
    public void setLon(Double lon) {
        this.lon = lon;
    }
    
    public Double getRating() {
        return rating;
    }
    
    public void setRating(Double rating) {
        this.rating = rating;
    }
    
    public Integer getNumberOfRatings() {
        return numberOfRatings;
    }
    
    public void setNumberOfRatings(Integer numberOfRatings) {
        this.numberOfRatings = numberOfRatings;
    }
}