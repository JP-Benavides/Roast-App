import { useEffect, useRef, useState } from "react";
import maplibregl from "maplibre-gl";
import "maplibre-gl/dist/maplibre-gl.css";
import { useSmartMapLoading } from "../../hooks/useSmartMapLoading";

export default function Map() {
  const mapRef = useRef(null);
  const mapInstance = useRef(null);
  const markersRef = useRef({});
  const [mapBounds, setMapBounds] = useState(null);
  const [zoom, setZoom] = useState(12);

  const [coffeeShops, setCoffeeShops] = useState([]);

  useEffect(() => {
    fetch("http://localhost:8080/api/coffeeshops")
      .then(res => res.json())
      .then(data => {
        console.log("Fetched coffee shops:", data.length);
        setCoffeeShops(data);
      })
      .catch(err => console.error("Error fetching coffee shops:", err));
  }, []);

  //const { coffeeShops } = useSmartMapLoading(mapBounds, zoom);

  const mapApiKey = import.meta.env.VITE_MAP_API_KEY;

  // Initialize MapLibre map
  useEffect(() => {
    console.log("Initializing MapLibre map...");
    if (mapInstance.current) return;

    // Small delay to ensure DOM is ready
    const timer = setTimeout(() => {
      const map = new maplibregl.Map({
        container: mapRef.current,
        style: `https://api.maptiler.com/maps/basic-v2/style.json?key=${mapApiKey}`,
        center: [-73.9712, 40.7831],
        zoom: 12,
        minZoom: 12,
        maxZoom: 16
      });

      console.log("Map created:", map);

      // Update bounds and zoom on map movement
      map.on("moveend", () => {
        const currentZoom = map.getZoom();
        console.log("Current zoom level:", currentZoom);
        const b = map.getBounds();
        setMapBounds({
          north: b.getNorth(),
          south: b.getSouth(),
          east: b.getEast(),
          west: b.getWest()
        });
        setZoom(currentZoom);
      });

      // Log zoom changes specifically
      map.on("zoom", () => {
        const zoomLevel = map.getZoom();
        console.log("Zoom changed to:", zoomLevel);
      });

      mapInstance.current = map;

      // Set initial bounds/zoom only after map is loaded
      map.once("load", () => {
        console.log("Map loaded successfully");
        const initialZoom = map.getZoom();
        console.log("Initial zoom level:", initialZoom);
        const b = map.getBounds();
        setMapBounds({
          north: b.getNorth(),
          south: b.getSouth(),
          east: b.getEast(),
          west: b.getWest()
        });
        setZoom(initialZoom);
      });

      map.on("error", (e) => {
        console.error("Map error:", e);
      });

      return () => {
        map.remove();
      };
    }, 100);

    return () => clearTimeout(timer);
  }, []);

  // Manage coffee shop markers
  useEffect(() => {
    if (!mapInstance.current) return;

    // Remove old markers
    Object.values(markersRef.current).forEach(marker => marker.remove());
    markersRef.current = {};

    // Add new markers
    (coffeeShops || []).forEach(shop => {
      if (typeof shop.lat !== "number" || typeof shop.lon !== "number") return;

      const el = document.createElement("div");
      el.className = "coffee-map-pin";
      el.innerHTML = `
        <svg width="44" height="54" viewBox="0 0 44 54" xmlns="http://www.w3.org/2000/svg">
          <defs>
            <!-- Gradient for pin body -->
            <radialGradient id="pinGradient" cx="50%" cy="30%" r="70%">
              <stop offset="0%" style="stop-color:#E0F6FF;stop-opacity:1" />
              <stop offset="70%" style="stop-color:#87CEEB;stop-opacity:1" />
              <stop offset="100%" style="stop-color:#4682B4;stop-opacity:1" />
            </radialGradient>
            <!-- Inner shadow for depth -->
            <filter id="innerShadow" x="-20%" y="-20%" width="140%" height="140%">
              <feGaussianBlur in="SourceAlpha" stdDeviation="1"/>
              <feOffset dx="0" dy="1" result="offset"/>
              <feFlood flood-color="rgba(0,0,0,0.1)"/>
              <feComposite in2="offset" operator="in"/>
              <feMerge>
                <feMergeNode/>
                <feMergeNode in="SourceGraphic"/>
              </feMerge>
            </filter>
            <!-- Drop shadow filter -->
            <filter id="shadow" x="-30%" y="-30%" width="160%" height="160%">
              <feDropShadow dx="2" dy="3" stdDeviation="2" flood-color="rgba(0,0,0,0.25)"/>
            </filter>
          </defs>
          <!-- Main pin shape with gradient -->
          <path d="M22 5C16 5 11 10 11 16c0 5.2 3.5 10.3 7.2 13.8L22 44l3.8-14.2c3.7-3.5 7.2-8.6 7.2-13.8 0-6-5-11-11-11z"
                fill="url(#pinGradient)"
                stroke="#2E5984"
                stroke-width="2.5"
                filter="url(#shadow)"
                style="filter: url(#innerShadow)"/>
          <!-- Metallic highlight ring -->
          <path d="M22 6C17 6 13 10 13 15c0 4 2.5 7.8 5.5 10.5L22 38l3.5-12.5c3-2.7 5.5-6.5 5.5-10.5 0-5-4-9-9-9z"
                fill="none"
                stroke="rgba(255,255,255,0.4)"
                stroke-width="1"/>
          <!-- Top highlight -->
          <ellipse cx="22" cy="11" rx="6" ry="4.5" fill="rgba(255,255,255,0.6)" opacity="0.8"/>
          <!-- Coffee cup inside the pin -->
          <g transform="translate(15.5, 14)">
            <!-- Coffee cup body (light blue) -->
            <path d="M6.5 3.5h1.5a4.5 4.5 0 1 1 0 9H6.5" fill="#87CEEB" stroke="#4682B4" stroke-width="1"/>
            <path d="M1 3.5h11.5v5a4.5 4.5 0 0 1-4.5 4.5h-2.5a4.5 4.5 0 0 1-4.5-4.5Z" fill="#87CEEB" stroke="#4682B4" stroke-width="1"/>
            <!-- Steam lines coming out on top -->
            <path d="M4 0c0 0 0 2.5 0.6 4.2S4 6.8 4 6.8" stroke="#4682B4" stroke-width="1.5" fill="none" opacity="0.9"/>
            <path d="M7 0c0 0 0 2.5 0.6 4.2S7 6.8 7 6.8" stroke="#4682B4" stroke-width="1.5" fill="none" opacity="0.9"/>
            <path d="M10 0c0 0 0 2.5 0.6 4.2S10 6.8 10 6.8" stroke="#4682B4" stroke-width="1.5" fill="none" opacity="0.9"/>
          </g>
        </svg>
      `;

      const marker = new maplibregl.Marker({ element: el })
        .setLngLat([shop.lon, shop.lat])
        .setPopup(
          new maplibregl.Popup({ offset: 25 }).setHTML(`
            <div class="min-w-44 font-sans">
              <div class="text-base font-semibold text-gray-800 mb-1.5">${shop.name || "Unknown Shop"}</div>
              <div class="flex items-center gap-1 mb-1">
                <span class="text-yellow-500">★</span>
                <span class="font-medium text-gray-600">${shop.rating?.toFixed(1) || "No rating"}</span>
              </div>
              <div class="text-gray-500 text-sm">${shop.street || "Manhattan, NY"}</div>
            </div>
          `)
        )
        .addTo(mapInstance.current);

      markersRef.current[`${shop.lat}_${shop.lon}_${shop.name}`] = marker;
    });
  }, [coffeeShops]);

  return (
    <div
      ref={mapRef}
      id="map"
      style={{
        width: "110vw",
        height: "95vh",
        marginLeft: "-5vw",
        marginRight: "-5vw",
        marginBottom: "-5vh",
        position: "relative",
        zIndex: 1
      }}
    />
  );
}
