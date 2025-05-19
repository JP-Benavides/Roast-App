import { Marker, Popup } from 'react-leaflet';

function CoffeePin({ shop }) {
  return (
    <Marker position={[shop.lat, shop.lon]}>
      <Popup>
          <div style={{ textAlign: 'center'}}>
            <strong>{shop.name}</strong><br />
            Rating: {shop.rating}
          </div>
        </Popup>
    </Marker>
  );
}

export default CoffeePin;