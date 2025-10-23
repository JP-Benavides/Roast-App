// Simple conservative loader: no prefetch cache, filter before setting shops
import { useState, useEffect, useRef, useCallback } from 'react';

export const useSmartMapLoading = (mapBounds, zoom) => {
  const [coffeeShops, setCoffeeShops] = useState([]);
  const debounceRef = useRef(null);

  const getMinRatingForZoom = useCallback((z) => {
    const zoomVal = (typeof z === 'number' && !isNaN(z)) ? z : 16;
    if (zoomVal >= 16) return 0;
    if (zoomVal >= 15) return 3.5;
    if (zoomVal >= 14) return 3.8;
    if (zoomVal >= 13) return 4.0;
    if (zoomVal >= 12) return 4.2;
    return 4.4;
  }, []);

  const filterShopsForZoom = useCallback((shops, z) => {
    const minRating = getMinRatingForZoom(z);
    return (shops || []).filter(shop => {
      const rating = Number(shop.rating);
      return z === 16 || (Number.isFinite(rating) && rating >= minRating);
    });
  }, [getMinRatingForZoom]);

  const loadViewportData = useCallback(async (bounds, z) => {
    if (!bounds) return;
    try {
      const resp = await fetch(`/api/coffeeshops/map?north=${bounds.north}&south=${bounds.south}&east=${bounds.east}&west=${bounds.west}`);
      if (!resp.ok) return;
      const data = await resp.json();
      const filtered = filterShopsForZoom(data || [], z);
      console.log(`Zoom ${z}: minRating ${getMinRatingForZoom(z)}, fetched ${data?.length || 0}, filtered ${filtered.length}`);
      // Set the filtered shops directly so pins show only allowed ones
      setCoffeeShops(filtered);
    } catch {
      // ignore fetch errors
    }
  }, [filterShopsForZoom, getMinRatingForZoom]);

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
