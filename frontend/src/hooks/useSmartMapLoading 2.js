// Simple conservative loader with tile-based density control to reduce clutter at low zoom
import { useState, useEffect, useRef, useCallback } from 'react';

export const useSmartMapLoading = (mapBounds, zoom) => {
  const [coffeeShops, setCoffeeShops] = useState([]);
  const debounceRef = useRef(null);

  //Filter based on ratings 
  const getMinRatingForZoom = useCallback((z) => {
    const zoomVal = (typeof z === 'number' && !isNaN(z)) ? z : 16;
    if (zoomVal >= 15) return 0;   
    if (zoomVal >= 14) return 3.5; 
    if (zoomVal >= 13) return 4.0; 
    if (zoomVal >= 12) return 4.5; 
    return 4.5; 
  }, []);

  const filterShopsForZoom = useCallback((shops, z, bounds) => {
    const minRating = getMinRatingForZoom(z);
    return (shops || []).filter(shop => { 
      const rating = Number(shop.rating);
      const isInBounds = bounds && typeof shop.lat === 'number' && typeof shop.lon === 'number' &&
        shop.lat >= bounds.south && shop.lat <= bounds.north &&
        shop.lon >= bounds.west && shop.lon <= bounds.east;

      const meetsRatingCriteria = z === 16 || (Number.isFinite(rating) && rating >= minRating);
      const shouldShow = isInBounds && meetsRatingCriteria;

      return shouldShow;
    });
  }, [getMinRatingForZoom]);

  // Apply density-based filter: show more shops in dense areas, fewer in sparse areas
  const applyDensityBasedFilter = useCallback((shops, bounds, zoom) => {
    if (!shops || shops.length === 0) return [];

    const viewportArea = (bounds.north - bounds.south) * (bounds.east - bounds.west);

    // Loosen density filtering: always show at least 40 shops at low zoom, 80 at medium, 160 at high
    let ratingThreshold, maxShops;
    if (zoom <= 10) {
      ratingThreshold = 4.0;
      maxShops = Math.max(40, Math.floor(viewportArea * 100));
    } else if (zoom <= 11) {
      ratingThreshold = 3.5;
      maxShops = Math.max(80, Math.floor(viewportArea * 200));
    } else if (zoom <= 12) {
      ratingThreshold = 3.0;
      maxShops = Math.max(160, Math.floor(viewportArea * 400));
    } else {
      ratingThreshold = 0;
      maxShops = shops.length;
    }

    // Filter shops by rating threshold first
    const ratingFiltered = shops.filter(shop => (shop.rating || 0) >= ratingThreshold);
    const targetCount = Math.min(ratingFiltered.length, maxShops);

    // Sort by rating (highest first) and take top shops
    const sortedByRating = [...ratingFiltered].sort((a, b) => (b.rating || 0) - (a.rating || 0));
    const selectedShops = sortedByRating.slice(0, targetCount);

    return selectedShops;
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
    if (!mapBounds || allShops.length === 0) return;
    const densityFiltered = applyDensityBasedFilter(allShops, mapBounds, zoom);
    setCoffeeShops(densityFiltered);
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
