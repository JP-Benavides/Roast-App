package com.example.roast.models;

import jakarta.persistence.*;

@Entity
@Table(name = "\"CoffeeShop_Table\"")
public class CoffeeShop {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(name = "\"Unnamed: 0\"")
    private Long unnamed;

    private Double lat;
    private Double lon;

    @Column(name = "\"addr:city\"")
    private String city;

    @Column(name = "\"addr:housenumber\"")
    private String houseNumber;

    @Column(name = "\"addr:state\"")
    private String state;

    @Column(name = "\"addr:street\"")
    private String street;

    private String name;
    private String phone;
    private Double capacity;

    @Column(name = "\"addr:postcode\"")
    private String postcode;

    @Column(name = "\"contact:instagram\"")
    private String contactInstagram;

    private String email;

    @Column(name = "\"postal_code\"")
    private Double postalCode;

    private String instagram;
    private String twitter;

    @Column(name = "\"addr:housename\"")
    private String houseName;

    private String location;

    @Column(name = "\"addr\"")
    private Double addr;

    // No-argument constructor (required by JPA)
    public CoffeeShop() {}

    // Getters and Setters

    public Long getUnnamed() { return unnamed; }
    public void setUnnamed(Long unnamed) { this.unnamed = unnamed; }

    public Double getLat() { return lat; }
    public void setLat(Double lat) { this.lat = lat; }

    public Double getLon() { return lon; }
    public void setLon(Double lon) { this.lon = lon; }

    public String getCity() { return city; }
    public void setCity(String city) { this.city = city; }

    public String getHouseNumber() { return houseNumber; }
    public void setHouseNumber(String houseNumber) { this.houseNumber = houseNumber; }

    public String getState() { return state; }
    public void setState(String state) { this.state = state; }

    public String getStreet() { return street; }
    public void setStreet(String street) { this.street = street; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public Double getCapacity() { return capacity; }
    public void setCapacity(Double capacity) { this.capacity = capacity; }

    public String getPostcode() { return postcode; }
    public void setPostcode(String postcode) { this.postcode = postcode; }

    public String getContactInstagram() { return contactInstagram; }
    public void setContactInstagram(String contactInstagram) { this.contactInstagram = contactInstagram; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public Double getPostalCode() { return postalCode; }
    public void setPostalCode(Double postalCode) { this.postalCode = postalCode; }

    public String getInstagram() { return instagram; }
    public void setInstagram(String instagram) { this.instagram = instagram; }

    public String getTwitter() { return twitter; }
    public void setTwitter(String twitter) { this.twitter = twitter; }

    public String getHouseName() { return houseName; }
    public void setHouseName(String houseName) { this.houseName = houseName; }

    public String getLocation() { return location; }
    public void setLocation(String location) { this.location = location; }

    public Double getAddr() { return addr; }
    public void setAddr(Double addr) { this.addr = addr; }
}
