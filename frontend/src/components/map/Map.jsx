import { useEffect, useState, useRef } from "react";
import L from "leaflet";
import "leaflet/dist/leaflet.css";
import "./Map.css";
import { useSmartMapLoading } from "../../hooks/useSmartMapLoading";

export default function Map() {
  const [userLocation, setUserLocation] = useState(null);
  const [mapBounds, setMapBounds] = useState(null);
  const [zoom, setZoom] = useState(12);
  const mapRef = useRef(null);
  const markerLayerRef = useRef(null);
  const userMarkerRef = useRef(null);

  // smart data loader
  const { coffeeShops } = useSmartMapLoading(mapBounds, zoom);

  /** 1️⃣ Initialize map once **/
  useEffect(() => {
    const container = L.DomUtil.get("map");
    if (container && container._leaflet_id) {
      // clean up any leftover map instance from hot reload
      container._leaflet_id = null;
    }

    const map = L.map("map", {
      center: [40.7831, -73.9712], // Manhattan center
      zoom: 12,
      minZoom: 12,
      maxZoom: 16,
      zoomControl: true,
    });

    L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
      attribution:
        '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
      className: "apple-maps-tiles",
      maxZoom: 19,
    }).addTo(map);

    // create a marker layer group and add to map
    const markerGroup = L.layerGroup().addTo(map);
    markerLayerRef.current = markerGroup;
    mapRef.current = map;

    const updateBounds = () => {
      const b = map.getBounds();
      setMapBounds({
        north: b.getNorth(),
        south: b.getSouth(),
        east: b.getEast(),
        west: b.getWest(),
      });
      setZoom(map.getZoom());
    };

    map.on("moveend zoomend", updateBounds);
    updateBounds();

    return () => {
      map.off("moveend zoomend", updateBounds);
      map.remove();
    };
  }, []);

  /** 2️⃣ Get user location once **/
  useEffect(() => {
    if (!mapRef.current) return;

    navigator.geolocation.getCurrentPosition(
      (pos) => {
        const { latitude, longitude } = pos.coords;
        const map = mapRef.current;
        setUserLocation({ lat: latitude, lng: longitude });
        map.setView([latitude, longitude], 15);
      },
      () => {
        setUserLocation({ lat: 40.7831, lng: -73.9712 });
      },
      { enableHighAccuracy: true, timeout: 10000 }
    );
  }, []);

  /** 3️⃣ Draw / update user marker **/
  useEffect(() => {
    const map = mapRef.current;
    if (!map || !userLocation) return;

    if (userMarkerRef.current) {
      map.removeLayer(userMarkerRef.current);
    }

    const marker = L.marker([userLocation.lat, userLocation.lng], {
      icon: L.divIcon({
        html: `
          <div class="user-location-pin">
            <div class="user-pin-outer"><div class="user-pin-inner"></div></div>
          </div>`,
        className: "user-location-marker",
        iconSize: [20, 20],
        iconAnchor: [10, 10],
      }),
    }).bindPopup("<div class='user-popup'>📍 Your Location</div>");

    marker.addTo(map);
    userMarkerRef.current = marker;
  }, [userLocation]);

  /** 4️⃣ Update coffee shop markers whenever hook data changes **/
  useEffect(() => {
    const group = markerLayerRef.current;
    if (!group || !coffeeShops) return;

    group.clearLayers(); // remove previous markers

    coffeeShops.forEach((shop) => {
      if (typeof shop.lat !== "number" || typeof shop.lon !== "number") return;

      const marker = L.marker([shop.lat, shop.lon], {
        icon: L.divIcon({
          html: `
            <div class="coffee-map-pin">
              <div class="pin-body">
                <svg width="20" height="20" viewBox="0 0 24 24" fill="white" class="coffee-icon">
                  <path d="M17 8h1a4 4 0 1 1 0 8h-1"/>
                  <path d="M3 8h14v9a4 4 0 0 1-4 4H7a4 4 0 0 1-4-4Z"/>
                  <path d="M6 1c0 0 0 1.5 0.5 2.5S6 6 6 6" stroke="white" stroke-width="1.5" fill="none"/>
                  <path d="M10 1c0 0 0 1.5 0.5 2.5S10 6 10 6" stroke="white" stroke-width="1.5" fill="none"/>
                  <path d="M14 1c0 0 0 1.5 0.5 2.5S14 6 14 6" stroke="white" stroke-width="1.5" fill="none"/>
                </svg>
              </div>
            </div>`,
          className: "coffee-pin-marker",
          iconSize: [32, 45],
          iconAnchor: [16, 45],
        }),
      }).bindPopup(`
        <div class="min-w-44 font-sans">
          <div class="text-base font-semibold text-gray-800 mb-1.5">${shop.name || "Unknown Shop"}</div>
          <div class="flex items-center gap-1 mb-1">
            <span class="text-yellow-500">★</span>
            <span class="font-medium text-gray-600">${shop.rating?.toFixed(1) || "No rating"}</span>
          </div>
          <div class="text-gray-500 text-sm">${shop.street || "Manhattan, NY"}</div>
        </div>
      `);

      marker.addTo(group);
    });
  }, [coffeeShops]);

  return <div id="map" style={{ width: "100%", height: "500px" }} />;
}
