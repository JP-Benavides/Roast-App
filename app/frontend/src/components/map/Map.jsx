import React from "react";
import { MapContainer, TileLayer } from "react-leaflet";
import CoffeePin from './CoffeePin';
import "leaflet/dist/leaflet.css";
import "./Map.css";

function Map() {
  //Test
  const coffeeShops = [ 
    { id: 1, name: 'Felix Roasting Co.', lat: 40.745, lon: -73.988 , rating: 4},
    { id: 2, name: 'Maman', lat: 40.730, lon: -73.997, rating: 3},
    { id: 3, name: 'Stumptown Coffee', lat: 40.742, lon: -73.989, rating: 2.5 }
  ];

  return (
    <MapContainer 
      center={[40.7831, -73.9712]}  // Manhattan center
      zoom={13}
      style={{ width: "100%", height: "500px" }}
    >
      <TileLayer
        url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
        attribution='&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
      />

      {coffeeShops.map(shop => (
        <CoffeePin key={shop.id} shop={shop} />
      ))}
    </MapContainer>
  );
}

export default Map;
