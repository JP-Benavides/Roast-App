import React, { useEffect } from 'react';
import mapboxgl from 'mapbox-gl';
import './Map.css'; 

let token = '';
mapboxgl.accessToken = token;

function Map() {

    //Map Box Api call
    useEffect(() => {
        const map = new mapboxgl.Map({
        container: 'map',
        style: 'mapbox://styles/mapbox/streets-v11', 
        center: [-74.5, 40], 
        zoom: 9 
        });
        return () => map.remove();
        }, []
    );

  return <div id="map" style={{ width: '100%', height: 'auto' }}></div>;
}

export default Map;
