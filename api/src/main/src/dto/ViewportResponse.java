package roast.dto;

import java.util.List;

public class ViewportResponse {
    private List<CoffeeShopCluster> clusters;
    private List<CoffeeShopMapDto> individualShops;
    private String responseType; // "clustered" or "individual"
    private Integer totalShopsInArea;
    
    // Constructors
    public ViewportResponse() {}
    
    // For clustered response
    public ViewportResponse(List<CoffeeShopCluster> clusters, Integer totalShopsInArea) {
        this.clusters = clusters;
        this.responseType = "clustered";
        this.totalShopsInArea = totalShopsInArea;
    }
    
    // For individual shops response
    public ViewportResponse(List<CoffeeShopMapDto> individualShops) {
        this.individualShops = individualShops;
        this.responseType = "individual";
        this.totalShopsInArea = individualShops.size();
    }
    
    // Getters and Setters
    public List<CoffeeShopCluster> getClusters() {
        return clusters;
    }
    
    public void setClusters(List<CoffeeShopCluster> clusters) {
        this.clusters = clusters;
    }
    
    public List<CoffeeShopMapDto> getIndividualShops() {
        return individualShops;
    }
    
    public void setIndividualShops(List<CoffeeShopMapDto> individualShops) {
        this.individualShops = individualShops;
    }
    
    public String getResponseType() {
        return responseType;
    }
    
    public void setResponseType(String responseType) {
        this.responseType = responseType;
    }
    
    public Integer getTotalShopsInArea() {
        return totalShopsInArea;
    }
    
    public void setTotalShopsInArea(Integer totalShopsInArea) {
        this.totalShopsInArea = totalShopsInArea;
    }
}