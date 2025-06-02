import { useEffect } from 'react';
import L from 'leaflet';

function CoffeePin({ shop, markerGroup }) {
  useEffect(() => {
    const marker = L.marker([shop.lat, shop.lon]).bindPopup(
      `<strong>${shop.name}</strong><br/>Rating: ${shop.rating ?? "N/A"}`
    );

    markerGroup.addLayer(marker);

    return () => {
      markerGroup.removeLayer(marker);
    };
  }, [shop, markerGroup]);

  return null;
}

export default CoffeePin;