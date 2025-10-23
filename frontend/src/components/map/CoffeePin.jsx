import { useEffect } from 'react';
import PropTypes from 'prop-types';
import L from 'leaflet';

export default function CoffeePin({ shop, markerGroup, isSelected = false }) {
  useEffect(() => {
    if (!markerGroup || !shop || typeof shop.lat !== 'number' || typeof shop.lon !== 'number') {
      console.warn('CoffeePin: Invalid props', { shop, markerGroup });
      return;
    }

    try {
      const scale = isSelected ? 'selected' : '';
      
      const marker = L.marker([shop.lat, shop.lon], {
        icon: L.divIcon({
          html: `<div class="coffee-map-pin ${scale}">
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

      markerGroup.addLayer(marker);
      return () => {
        try {
          markerGroup.removeLayer(marker);
        } catch (e) {
          console.warn('Error removing marker:', e);
        }
      };
    } catch (e) {
      console.error('Error creating coffee shop marker:', e);
    }
  }, [shop, markerGroup, isSelected]);

  return null;
}

CoffeePin.propTypes = {
  shop: PropTypes.shape({
    name: PropTypes.string.isRequired,
    lat: PropTypes.number.isRequired,
    lon: PropTypes.number.isRequired,
    rating: PropTypes.number,
    street: PropTypes.string
  }).isRequired,
  markerGroup: PropTypes.object.isRequired,
  isSelected: PropTypes.bool
};