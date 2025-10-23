package roast.dto;

public class CoffeeShopDto {
    private Long id;
    private String name;
    private Double lat;
    private Double lon;
    private String city;
    private String state;
    private String street;
    private Double rating;
    private Integer numberOfRatings;
    
    // Constructors
    public CoffeeShopDto() {}
    
    public CoffeeShopDto(Long id, String name, Double lat, Double lon, String city, 
                        String state, String street, Double rating, Integer numberOfRatings) {
        this.id = id;
        this.name = name;
        this.lat = lat;
        this.lon = lon;
        this.city = city;
        this.state = state;
        this.street = street;
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
    
    public String getCity() {
        return city;
    }
    
    public void setCity(String city) {
        this.city = city;
    }
    
    public String getState() {
        return state;
    }
    
    public void setState(String state) {
        this.state = state;
    }
    
    public String getStreet() {
        return street;
    }
    
    public void setStreet(String street) {
        this.street = street;
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