import { useEffect, useState, useRef } from "react";
import L from "leaflet";
import "leaflet/dist/leaflet.css";
import "./Map.css";
import { useSmartMapLoading } from "../../hooks/useSmartMapLoading";

function Map() {
  const [userLocation, setUserLocation] = useState(null); // user's current location
  const [mapBounds, setMapBounds] = useState(null); // current map bounds
  const [zoom, setZoom] = useState(12); // current zoom level
  const mapRef = useRef(null); // to not rerender component
  const userMarkerRef = useRef(null); // track user location marker
  const existingMarkersRef = useRef({}); // track existing markers by shop ID
  const markerGroupRef = useRef(null); // reference to the marker layer group
  const latestShopsRef = useRef([]);
  
  // Smart loading hook
  const { coffeeShops } = useSmartMapLoading(mapBounds, zoom);

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

  // Smart loading is handled by useSmartMapLoading hook

  // Initialize map only ONCE
  useEffect(() => {
    if (mapRef.current) return; // Already initialized

  // Small delay to ensure DOM is ready
    const timer = setTimeout(() => {
      // Check if map container exists
      const mapContainer = document.getElementById('map');
      if (!mapContainer) {
        return;
      }

      try {
      // Define base layers
      const osmLayer = L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
        attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors',
        maxZoom: 16, // Match map maxZoom
        className: 'apple-maps-tiles'
      });

      // Initialize map with default location (will update when userLocation loads)
      const defaultLocation = [40.7831, -73.9712]; // Manhattan center
      const map = L.map("map", {
        attributionControl: false,
        zoomControl: true,
        minZoom: 12, // Prevent excessive zoom out - keep city overview
        maxZoom: 16  // Allow detailed zoom in for street-level view
      });
      
      // Add the tile layer
      osmLayer.addTo(map);
      
      // Set initial view
      map.setView(defaultLocation, 12);

      // Enforce zoom limits programmatically
      map.setMinZoom(12);
      map.setMaxZoom(16);

      mapRef.current = map;

      const updateMapBounds = () => {
        const bounds = map.getBounds();
        const currentZoom = map.getZoom();
        setMapBounds({
          north: bounds.getNorth(),
          south: bounds.getSouth(),
          east: bounds.getEast(),
          west: bounds.getWest()
        });
        setZoom(currentZoom);
      };

    // Listen for map movement events
    map.on('moveend zoomend', updateMapBounds);

    // Initialize bounds and zoom on map creation
    updateMapBounds();

    // Create layer group for markers
    const markers = L.layerGroup();
    markerGroupRef.current = markers;
    map.addLayer(markers);

    // Cleanup function
    return () => {
      if (map) {
        map.off('moveend zoomend');
        map.remove();
      }
    };
        } catch {
          // Handle map initialization error
        }
    }, 100);

    return () => clearTimeout(timer);
  }, []); // Empty dependency array - initialize only once

  // Update map view when userLocation is available
  useEffect(() => {
    if (userLocation && mapRef.current) {
      const map = mapRef.current;
      
      // Check if map is properly initialized
      if (!map || !map.getContainer()) return;
      
      // Wait for map to be ready before doing anything
      map.whenReady(() => {
        try {
          // Set the map view
          map.setView([userLocation.lat, userLocation.lng], 16);
          
          // Remove existing user marker if it exists
          if (userMarkerRef.current) {
            try {
              map.removeLayer(userMarkerRef.current);
            } catch {
              // Handle marker removal error
            }
          }

          // Add new user location marker
          const userMarker = L.marker([userLocation.lat, userLocation.lng], {
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
          }).bindPopup('<div class="user-popup">📍 Your Location</div>');

          userMarker.addTo(map);
          userMarkerRef.current = userMarker; // Store reference
          
        } catch (error) {
          console.log(error);
        }
      });
    }
  }, [userLocation]);

  // Handle coffee shop markers with smooth animations
  useEffect(() => {
    if (!mapRef.current || !markerGroupRef.current || !coffeeShops) return;

    // Use Set to ensure no duplicates at all
    const shopSet = new Set();
    const uniqueShops = coffeeShops.filter(shop => {
      const id = `${shop.lat}_${shop.lon}_${shop.name}`;
      if (shopSet.has(id)) {
        return false; // Duplicate, skip
      }
      shopSet.add(id);
      return true; // Keep this shop
    });
    
    if (uniqueShops.length !== coffeeShops.length) {
      console.warn(`Removed ${coffeeShops.length - uniqueShops.length} duplicate shops using Set`);
    }

    console.log(`Managing ${uniqueShops.length} shops`);
    
  // keep a ref to the latest shops so the debounced add step can check before adding
  latestShopsRef.current = uniqueShops;
  const currentShopIds = new Set(uniqueShops.map(shop => `${shop.lat}_${shop.lon}_${shop.name}`));
    const existingShopIds = new Set(Object.keys(existingMarkersRef.current));
    
    // Remove markers for shops that are no longer in the data
    const shopsToRemove = Array.from(existingShopIds).filter(id => !currentShopIds.has(id));
    
    shopsToRemove.forEach(shopId => {
      const marker = existingMarkersRef.current[shopId];
      if (!marker) {
        console.warn(`Trying to remove marker ${shopId} but it doesn't exist in existingMarkersRef`);
        return;
      }
      
      console.log(`Removing marker ${shopId} from map`);
      
      try {
        // Check if marker is actually on the map before removing
        const isOnMap = mapRef.current && mapRef.current.hasLayer(marker);
        const isOnLayerGroup = markerGroupRef.current && markerGroupRef.current.hasLayer(marker);
        console.log(`Marker ${shopId} - on map: ${isOnMap}, on layer group: ${isOnLayerGroup}`);
        
        // Remove from both layer group and map directly
        if (markerGroupRef.current) {
          markerGroupRef.current.removeLayer(marker);
          console.log(`Removed ${shopId} from layer group`);
        }
        if (mapRef.current) {
          mapRef.current.removeLayer(marker);
          console.log(`Removed ${shopId} from map directly`);
        }
        
        // Verify removal
        const stillOnMap = mapRef.current && mapRef.current.hasLayer(marker);
        console.log(`Marker ${shopId} still on map after removal: ${stillOnMap}`);
        
        delete existingMarkersRef.current[shopId];
        console.log(`Deleted ${shopId} from existingMarkersRef`);
      } catch (error) {
        console.error(`Error removing marker ${shopId}:`, error);
      }
    });

    // Prepare new shops to add
    const toAdd = uniqueShops.filter(shop => {
      const id = `${shop.lat}_${shop.lon}_${shop.name}`;
      return !existingMarkersRef.current[id] && typeof shop.lat === 'number' && typeof shop.lon === 'number';
    });

    console.log(`Managing ${uniqueShops.length} shops: Removing ${shopsToRemove.length} markers, Adding ${toAdd.length} markers`);
    
    // Add markers immediately
    if (toAdd.length > 0) {
      const BATCH_SIZE = 8;
      let index = 0;
      const addBatch = () => {
        const end = Math.min(index + BATCH_SIZE, toAdd.length);
        for (; index < end; index++) {
          const shop = toAdd[index];
          // Re-check the latest shops — if the shop was removed since scheduling, skip it
          const shopId = `${shop.lat}_${shop.lon}_${shop.name}`;
          const stillPresent = latestShopsRef.current.some(s => `${s.lat}_${s.lon}_${s.name}` === shopId);
          if (!stillPresent) continue;
          try {
            const marker = L.marker([shop.lat, shop.lon], {
              icon: L.divIcon({
                html: `<div class="coffee-map-pin">
                  <div class="pin-body">` +
                  `<svg width="20" height="20" viewBox="0 0 24 24" fill="white" class="coffee-icon">` +
                    `<path d="M17 8h1a4 4 0 1 1 0 8h-1"/>` +
                    `<path d="M3 8h14v9a4 4 0 0 1-4 4H7a4 4 0 0 1-4-4Z"/>` +
                    `<path d="M6 1c0 0 0 1.5 0.5 2.5S6 6 6 6" stroke="white" stroke-width="1.5" fill="none"/>` +
                    `<path d="M10 1c0 0 0 1.5 0.5 2.5S10 6 10 6" stroke="white" stroke-width="1.5" fill="none"/>` +
                    `<path d="M14 1c0 0 0 1.5 0.5 2.5S14 6 14 6" stroke="white" stroke-width="1.5" fill="none"/>` +
                  `</svg>` +
                  `</div></div>`,
                className: 'coffee-pin-marker',
                iconSize: [32, 45],
                iconAnchor: [16, 45]
              })
            }).bindPopup(`
              <div class="min-w-44 font-sans">
                <div class="text-base font-semibold text-gray-800 mb-1.5">${shop.name || 'Unknown Shop'}</div>
                <div class="flex items-center gap-1 mb-1">
                  <span class="text-yellow-500">★</span>
                  <span class="font-medium text-gray-600">${shop.rating?.toFixed(1) || "No rating"}</span>
                </div>
                <div class="text-gray-500 text-sm">${shop.street || 'Manhattan, NY'}</div>
              </div>
            `);
            const shopId = `${shop.lat}_${shop.lon}_${shop.name}`;
            markerGroupRef.current.addLayer(marker);
            existingMarkersRef.current[shopId] = marker;
          } catch {
            // ignore marker errors
          }
        }
        if (index < toAdd.length) requestAnimationFrame(addBatch);
      };
      requestAnimationFrame(addBatch);
    }
  }, [coffeeShops]);

  return (
    <div id="map" style={{ height: "500px", width: "100%" }}></div>
  );

}

export default Map;
