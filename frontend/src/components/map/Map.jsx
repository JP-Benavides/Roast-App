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
  const { coffeeShops } = useSmartMapLoading(mapBounds, zoom, userLocation, markerGroupRef, existingMarkersRef);

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

      // 🚀 Smart loading: Update bounds when user pans/zooms
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
          // Handle user location update error
        }
      });
    }
  }, [userLocation]);

  // Handle coffee shop markers with smooth animations
  useEffect(() => {
    if (!mapRef.current || !markerGroupRef.current || !coffeeShops) return;

  // keep a ref to the latest shops so the debounced add step can check before adding
  latestShopsRef.current = coffeeShops;
  const currentShopIds = new Set(coffeeShops.map(shop => `${shop.lat}_${shop.lon}_${shop.name}`));
    const existingShopIds = new Set(Object.keys(existingMarkersRef.current));

    // Remove markers for shops that are no longer in the data (immediate implosion)
    const shopsToRemove = Array.from(existingShopIds).filter(id => !currentShopIds.has(id));
    shopsToRemove.forEach(shopId => {
      const marker = existingMarkersRef.current[shopId];
      if (!marker) return;
      try {
        const el = marker.getElement();
        if (el) {
          const pin = el.querySelector('.coffee-map-pin');
          if (pin) {
            pin.classList.add('implode');
            setTimeout(() => {
              try {
                markerGroupRef.current.removeLayer(marker);
              } catch {
                // ignore removal errors after animation
              }
              delete existingMarkersRef.current[shopId];
            }, 350);
            return;
          }
        }
      } catch {
        // ignore errors accessing marker element
      }
      try {
        markerGroupRef.current.removeLayer(marker);
      } catch {
        // ignore removal error
      }
      delete existingMarkersRef.current[shopId];
    });

    // Prepare new shops to add but debounce additions to avoid brief flicker
    const toAdd = coffeeShops.filter(shop => {
      const id = `${shop.lat}_${shop.lon}_${shop.name}`;
      return !existingMarkersRef.current[id] && typeof shop.lat === 'number' && typeof shop.lon === 'number';
    });

    // Cancel any previous pending adds
    if (markerGroupRef.current._pendingAddTimeout) {
      clearTimeout(markerGroupRef.current._pendingAddTimeout);
      markerGroupRef.current._pendingAddTimeout = null;
    }

    if (toAdd.length === 0) return;

    // Delay adding slightly so the hook's filtering can settle (reduces flicker)
      markerGroupRef.current._pendingAddTimeout = setTimeout(() => {
      markerGroupRef.current._pendingAddTimeout = null;
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
                html: `<div class="coffee-map-pin" style="opacity:0; transition: opacity 300ms ease">
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
            requestAnimationFrame(() => {
              const el = marker.getElement();
              if (el) {
                const pin = el.querySelector('.coffee-map-pin');
                if (pin) pin.style.opacity = '1';
              }
            });
          } catch {
            // ignore marker errors
          }
        }
        if (index < toAdd.length) requestAnimationFrame(addBatch);
      };
      if (toAdd.length > 0) requestAnimationFrame(addBatch);
    }, 120);
  }, [coffeeShops]);

  return (
    <div id="map" style={{ height: "500px", width: "100%" }}></div>
  );

}

export default Map;
