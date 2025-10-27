// Simple conservative loader with tile-based density control to reduce clutter at low zoom
import { useState, useEffect, useRef, useCallback } from 'react';

export const useSmartMapLoading = (mapBounds, zoom) => {
  const [coffeeShops, setCoffeeShops] = useState([]);
  const debounceRef = useRef(null);
  const layoutDebounceRef = useRef(null);

  //Filter based on ratings - legacy code - apply once we are able to rate shops
  /*
  const getMinRatingForZoom = useCallback((z) => {
    const zoomVal = (typeof z === 'number' && !isNaN(z)) ? z : 16;
    if (zoomVal >= 15) return 0;   
    if (zoomVal >= 14) return 3.5; 
    if (zoomVal >= 13) return 4.0; 
    if (zoomVal >= 12) return 4.5; 
    return 4.5; 
  }, []);
  */

  // Basic in-bounds filter (don't filter by rating here anymore)
  const filterShopsForZoom = useCallback((shops, z, bounds) => {
    return (shops || []).filter(shop => {
      const isInBounds = bounds && typeof shop.lat === 'number' && typeof shop.lon === 'number' &&
        shop.lat >= bounds.south && shop.lat <= bounds.north &&
        shop.lon >= bounds.west && shop.lon <= bounds.east;
      return isInBounds;
    });
  }, []);

  // Apply density-based filter: show more shops in dense areas, fewer in sparse areas
  // Density reduction using tile-based sampling (no ratings required)
  // Groups shops into small geo-tiles and picks one representative per tile.
  const applyDensityBasedFilter = useCallback((shops, bounds, zoom) => {
    if (!shops || shops.length === 0 || !bounds) return [];

    // Smooth transition: progressively reveal more markers as zoom increases.
    // We'll interpolate between MIN_ZOOM and MAX_ZOOM; at or above MAX_ZOOM show all.
    const MIN_ZOOM = 8;
    const MAX_ZOOM = 14.35; // user-requested max where full detail is shown
    const zoomVal = (typeof zoom === 'number' && !isNaN(zoom)) ? zoom : MIN_ZOOM;
    const frac = Math.min(1, Math.max(0, (zoomVal - MIN_ZOOM) / (MAX_ZOOM - MIN_ZOOM)));

    // Tile size loosely tied to zoom: larger tiles at low zoom (coarser sampling)
    // Base tile size (degrees) - tuned to backend TILE_SIZE
    const BASE_TILE = 0.003;
    // Adjust tile multiplier by zoom (higher zoom -> smaller tiles)
    const zoomMultiplier = Math.max(1, Math.floor(16 - zoomVal));
    const tileSize = BASE_TILE * Math.max(1, zoomMultiplier);

    // Helper to compute tile id
    const tileId = (lat, lon) => {
      const tx = Math.floor(lat / tileSize);
      const ty = Math.floor(lon / tileSize);
      return `${tx}_${ty}`;
    };

    // Group shops by tile
    const groups = new Map();
    for (const s of shops) {
      if (typeof s.lat !== 'number' || typeof s.lon !== 'number') continue;
      const id = tileId(s.lat, s.lon);
      if (!groups.has(id)) groups.set(id, []);
      groups.get(id).push(s);
    }

    // Pick representative per tile. Prefer the shop closest to viewport center.
    const centerLat = (bounds.north + bounds.south) / 2;
    const centerLon = (bounds.east + bounds.west) / 2;

    const reps = [];
    for (const [, list] of groups.entries()) {
      let best = list[0];
      let bestDist = Number.POSITIVE_INFINITY;
      for (const c of list) {
        const dx = c.lat - centerLat;
        const dy = c.lon - centerLon;
        const d = dx * dx + dy * dy;
        if (d < bestDist) {
          bestDist = d;
          best = c;
        }
      }
      reps.push(best);
    }

    // If fully zoomed in, show all
    if (frac >= 1) {
      return shops.filter(s => typeof s.lat === 'number' && typeof s.lon === 'number');
    }

    // Determine desired number of representatives based on zoom fraction
    const minCap = 8; // minimum markers to show at lowest zoom
    const desiredCount = Math.max(minCap, Math.round(minCap + frac * (reps.length - minCap)));

    if (reps.length <= desiredCount) return reps;

    // Keep those closest to center when we must trim
    reps.sort((a, b) => {
      const ad = Math.pow(a.lat - centerLat, 2) + Math.pow(a.lon - centerLon, 2);
      const bd = Math.pow(b.lat - centerLat, 2) + Math.pow(b.lon - centerLon, 2);
      return ad - bd;
    });

    return reps.slice(0, desiredCount);
  }, []);

  // Real-time density filtering as user moves/zooms
  const [allShops, setAllShops] = useState([]); 

  const loadViewportData = useCallback(async (bounds, z) => {
    if (!bounds) return;
    try {
      const resp = await fetch(`/api/coffeeshops/map?north=${bounds.north}&south=${bounds.south}&east=${bounds.east}&west=${bounds.west}`);
      if (!resp.ok) return;
      const data = await resp.json();
      const filtered = filterShopsForZoom(data || [], z, bounds);
      setAllShops(filtered);

      // Apply density-based filter to reduce clutter based on actual shop distribution
      const densityFiltered = applyDensityBasedFilter(filtered, bounds, z);
      setCoffeeShops(densityFiltered);
    } catch {
      // ignore fetch errors
    }
  }, [filterShopsForZoom, applyDensityBasedFilter]);

  // Real-time filtering effect - runs on every bounds/zoom change
  useEffect(() => {
    // Debounce layout/density calculations so we don't re-run expensive sampling
    // while the user is panning/zooming continuously. Wait until movement stops.
    if (!mapBounds || allShops.length === 0) {
      if (layoutDebounceRef.current) {
        clearTimeout(layoutDebounceRef.current);
        layoutDebounceRef.current = null;
      }
      return;
    }

    if (layoutDebounceRef.current) clearTimeout(layoutDebounceRef.current);
    layoutDebounceRef.current = setTimeout(() => {
      const densityFiltered = applyDensityBasedFilter(allShops, mapBounds, zoom);
      setCoffeeShops(densityFiltered);
      layoutDebounceRef.current = null;
    }, 200); // 200ms debounce for layout update (tunable)

    return () => {
      if (layoutDebounceRef.current) {
        clearTimeout(layoutDebounceRef.current);
      }
    };
  }, [mapBounds, zoom, allShops, applyDensityBasedFilter]);

  useEffect(() => {
    if (!mapBounds) return;
    if (debounceRef.current) clearTimeout(debounceRef.current);
    debounceRef.current = setTimeout(() => loadViewportData(mapBounds, zoom), 250);
    return () => { if (debounceRef.current) clearTimeout(debounceRef.current); };
  }, [mapBounds, zoom, loadViewportData]);

  const clearAllData = useCallback(() => { setCoffeeShops([]); }, []);
  return { coffeeShops, clearAllData };
};
