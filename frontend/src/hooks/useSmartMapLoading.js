// Simple conservative loader with tile-based density control to reduce clutter at low zoom
import { useState, useEffect, useRef, useCallback } from 'react';

export const useSmartMapLoading = (mapBounds, zoom) => {
  const [coffeeShops, setCoffeeShops] = useState([]);
  const debounceRef = useRef(null);

  const getMinRatingForZoom = useCallback((z) => {
    const zoomVal = (typeof z === 'number' && !isNaN(z)) ? z : 16;
    if (zoomVal >= 16) return 0;  // Show all at max zoom
    if (zoomVal >= 15) return 3.0; // Show 3.0+ stars
    if (zoomVal >= 14) return 3.5; // Show 3.5+ stars  
    if (zoomVal >= 13) return 4.0; // Show 4.0+ stars
    if (zoomVal >= 12) return 4.2; // Show 4.2+ stars
    return 4.5; // Show 4.5+ stars for zoom < 12
  }, []);

  const filterShopsForZoom = useCallback((shops, z, bounds) => {
    const minRating = getMinRatingForZoom(z);
    console.log(`Filtering ${shops?.length || 0} shops at zoom ${z}, minRating: ${minRating}`);
    return (shops || []).filter(shop => {
      const rating = Number(shop.rating);
      const isInBounds = bounds && typeof shop.lat === 'number' && typeof shop.lon === 'number' &&
        shop.lat >= bounds.south && shop.lat <= bounds.north &&
        shop.lon >= bounds.west && shop.lon <= bounds.east;
      
      const meetsRatingCriteria = z === 16 || (Number.isFinite(rating) && rating >= minRating);
      const shouldShow = isInBounds && meetsRatingCriteria;
      
      // Debug 0-rated shops
      if (rating === 0 || shop.rating === 0 || shop.rating === "0") {
        console.log(`0-rated shop: ${shop.name}, rating: ${shop.rating} (${rating}), zoom: ${z}, minRating: ${minRating}, isInBounds: ${isInBounds}, meetsRating: ${meetsRatingCriteria}, shouldShow: ${shouldShow}`);
      }
      
      return shouldShow;
    });
  }, [getMinRatingForZoom]);

  // Apply density-based filter: show more shops in dense areas, fewer in sparse areas
  const applyDensityBasedFilter = useCallback((shops, bounds, zoom) => {
    if (!shops || shops.length === 0) return [];
    
    // Calculate viewport area (rough approximation in square degrees)
    const viewportArea = (bounds.north - bounds.south) * (bounds.east - bounds.west);
    
    // Calculate shop density (shops per square degree)
    const shopDensity = shops.length / viewportArea;
    
    console.log(`Viewport area: ${viewportArea.toFixed(6)} sq degrees, ${shops.length} shops, density: ${shopDensity.toFixed(2)} shops/sq°`);
    
    // Determine rating threshold and density limits based on zoom
    let ratingThreshold, maxShops;
    if (zoom <= 13) {
      // Low zoom: only best shops, very limited count
      ratingThreshold = 4.2;
      if (shopDensity > 50) maxShops = Math.max(6, Math.floor(viewportArea * 12)); // Dense: 6-24 shops
      else if (shopDensity > 20) maxShops = Math.max(10, Math.floor(viewportArea * 20)); // Medium: 10-40 shops
      else maxShops = Math.max(15, Math.floor(viewportArea * 30)); // Sparse: 15-60 shops
    } else if (zoom <= 14) {
      // Medium-low zoom: good shops, moderate count
      ratingThreshold = 3.8;
      if (shopDensity > 50) maxShops = Math.max(12, Math.floor(viewportArea * 25)); // Dense: 12-50 shops
      else if (shopDensity > 20) maxShops = Math.max(20, Math.floor(viewportArea * 45)); // Medium: 20-90 shops
      else maxShops = Math.max(30, Math.floor(viewportArea * 70)); // Sparse: 30-140 shops
    } else if (zoom <= 15) {
      // Medium-high zoom: decent shops, higher count
      ratingThreshold = 3.0;
      if (shopDensity > 50) maxShops = Math.max(20, Math.floor(viewportArea * 45)); // Dense: 20-90 shops
      else if (shopDensity > 20) maxShops = Math.max(35, Math.floor(viewportArea * 80)); // Medium: 35-160 shops
      else maxShops = Math.max(50, Math.floor(viewportArea * 130)); // Sparse: 50-260 shops
    } else {
      // High zoom (16): show everything above minimum rating
      ratingThreshold = 0; // Show all shops
      maxShops = shops.length; // No limit at max zoom
    }
    
    // Filter shops by rating threshold first
    const ratingFiltered = shops.filter(shop => (shop.rating || 0) >= ratingThreshold);
    
    // Then apply density limit if needed
    const targetCount = Math.min(ratingFiltered.length, maxShops);
    
    // Sort by rating (highest first) and take top shops
    const sortedByRating = [...ratingFiltered].sort((a, b) => (b.rating || 0) - (a.rating || 0));
    const selectedShops = sortedByRating.slice(0, targetCount);
    
    console.log(`Density filter: showing ${selectedShops.length}/${shops.length} shops (target: ${targetCount})`);
    console.log(`Selected shops:`, selectedShops.map(s => `${s.name}(${s.rating})`));
    
    return selectedShops;
  }, []);

  const loadViewportData = useCallback(async (bounds, z) => {
    if (!bounds) return;
    try {
      const resp = await fetch(`/api/coffeeshops/map?north=${bounds.north}&south=${bounds.south}&east=${bounds.east}&west=${bounds.west}`);
      if (!resp.ok) return;
      const data = await resp.json();
      const filtered = filterShopsForZoom(data || [], z, bounds);
      // Apply density-based filter to reduce clutter based on actual shop distribution
      const densityFiltered = applyDensityBasedFilter(filtered, bounds, z);
      setCoffeeShops(densityFiltered);
    } catch {
      // ignore fetch errors
    }
  }, [filterShopsForZoom, applyDensityBasedFilter]);

  useEffect(() => {
    if (!mapBounds) return;
    if (debounceRef.current) clearTimeout(debounceRef.current);
    debounceRef.current = setTimeout(() => loadViewportData(mapBounds, zoom), 250);
    return () => { if (debounceRef.current) clearTimeout(debounceRef.current); };
  }, [mapBounds, zoom, loadViewportData]);

  // Force reload on zoom change to re-filter tiles
  useEffect(() => {
    if (!mapBounds) return;
    loadViewportData(mapBounds, zoom);
  }, [zoom, mapBounds, loadViewportData]);

  const clearAllData = useCallback(() => { setCoffeeShops([]); }, []);
  return { coffeeShops, clearAllData };
};
