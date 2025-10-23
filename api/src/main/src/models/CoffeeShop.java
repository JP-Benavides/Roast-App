package roast.models;

import jakarta.persistence.*;

@Entity
@Table(name = "coffees")
public class CoffeeShop {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "coffeePK")
    private Long id;

    private Double lat;
    private Double lon;
    private String city;
    private String state;
    private String street;
    private String name;

    @Column(name = "addr")
    private Double address;

    private Double rating;

    @Column(name = "numofratings")
    private Integer numberOfRatings;

    private String zipcode;

    @Column(name = "tile_id")
    private String tileId;

    // Tile calculation constants
    private static final double TILE_SIZE = 0.003;

    // No-arg constructor
    public CoffeeShop() {}

    // Auto-calculate tile ID when lat/lon changes
    @PrePersist
    @PreUpdate
    private void calculateTileId() {
        updateTileId();
    }

    public String getZipcode(){
        return zipcode;
    }

    public void setZipCode(String zipcode){
        this.zipcode = zipcode;
    }

    public String getTileId() {
        return tileId;
    }

    public void setTileId(String tileId) {
        this.tileId = tileId;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Double getLat() {
        return lat;
    }

    public void setLat(Double lat) {
        this.lat = lat;
        updateTileId(); // Auto-recalculate when lat changes
    }

    public Double getLon() {
        return lon;
    }

    public void setLon(Double lon) {
        this.lon = lon;
        updateTileId(); // Auto-recalculate when lon changes
    }

    // Helper method to update tile ID
    private void updateTileId() {
        if (this.lat != null && this.lon != null) {
            int tileX = (int) Math.floor(this.lat / TILE_SIZE);
            int tileY = (int) Math.floor(this.lon / TILE_SIZE);
            this.tileId = tileX + "_" + tileY;
        }
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Double getAddress() {
        return address;
    }

    public void setAddress(Double address) {
        this.address = address;
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

    public void addNewRating(Double newRating){
        numberOfRatings++;
        rating = (rating + newRating) / numberOfRatings;
    }
}

