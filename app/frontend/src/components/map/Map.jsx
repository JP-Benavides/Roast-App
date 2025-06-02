import React, { useEffect, useState, useRef } from "react";
import L from "leaflet";
import "leaflet/dist/leaflet.css";
import "leaflet.markercluster";
import "leaflet.markercluster/dist/MarkerCluster.css";
import "leaflet.markercluster/dist/MarkerCluster.Default.css";
import "./Map.css";
import CoffeePin from "./CoffeePin";

function Map() {
  const [coffeeShops, setCoffeeShops] = useState([]);// holds all coffee shops
  const [markerGroup, setMarkerGroup] = useState(null); // custom coffee pins
  const mapRef = useRef(null); // to not rerender component

  //fills up list of coffee shops
  useEffect(() => {
    fetch("/api/mapdata")
      .then((res) => res.json())
      //checks for dup coffee shops
      .then((data) => {
        const seen = new Set();
        const uniqueShops = data.filter((shop) => {
          const key = `${shop.lat}-${shop.lon}-${shop.name}`;
          if (seen.has(key)) return false;
          seen.add(key);
          return true;
        });
        setCoffeeShops(uniqueShops);
      })
      .catch((err) => console.error("Error fetching coffee shop data:", err));
  }, []);

  useEffect(() => {
    if (!coffeeShops.length || mapRef.current) return;

    const map = L.map("map").setView([40.7831, -73.9712], 13);
    mapRef.current = map; //stores to prevent reinitialization

    L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
      attribution:
        '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
    }).addTo(map);

    const markers = L.markerClusterGroup();
    setMarkerGroup(markers);
    map.addLayer(markers);
    }, [coffeeShops]);

    return (
    <>
      <div id="map" style={{ height: "500px", width: "100%" }}></div>

      {mapRef.current && markerGroup &&
        coffeeShops.map((shop) => (
          <CoffeePin
            key={`${shop.lat}-${shop.lon}-${shop.name}`}
            shop={shop}
            markerGroup={markerGroup}
          />
        ))}
    </>
    );

}

export default Map;
