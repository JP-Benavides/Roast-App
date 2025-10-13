import { useEffect, useState, useRef } from "react";
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
  const [userLocation, setUserLocation] = useState(null); // user's current location
  const mapRef = useRef(null); // to not rerender component

  // Get user's current location
  useEffect(() => {
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(
        (position) => {
          const { latitude, longitude } = position.coords;
          setUserLocation({ lat: latitude, lng: longitude });
        },
        (error) => {
          console.log("Location access denied or unavailable:", error);
          // Fallback to Manhattan center if location denied
          setUserLocation({ lat: 40.7831, lng: -73.9712 });
        },
        { enableHighAccuracy: true, timeout: 10000, maximumAge: 300000 }
      );
    } else {
      // Fallback if geolocation not supported
      setUserLocation({ lat: 40.7831, lng: -73.9712 });
    }
  }, []);

  //fills up list of coffee shops
  useEffect(() => {
    fetch("/api/coffeeshops")
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
    if (!coffeeShops.length || !userLocation || mapRef.current) return;

    // Center map on user location
    const map = L.map("map", {
      attributionControl: false,
      zoomControl: true
    }).setView([userLocation.lat, userLocation.lng], 16);
    mapRef.current = map; //stores to prevent reinitialization

    L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
      attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
      maxZoom: 20,
      className: 'apple-maps-tiles'
    }).addTo(map);


    // Add user location marker
    L.marker([userLocation.lat, userLocation.lng], {
      icon: L.divIcon({
        html: `<div class="user-location-pin">
          <div class="user-pin-outer">
            <div class="user-pin-inner"></div>
          </div>
        </div>`,
        className: 'user-location-marker',
        iconSize: [20, 20],
        iconAnchor: [10, 10]
      })
    }).bindPopup('<div class="user-popup">📍 Your Location</div>').addTo(map);

    const markers = L.markerClusterGroup();
    setMarkerGroup(markers);
    map.addLayer(markers);
    }, [coffeeShops, userLocation]);

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
