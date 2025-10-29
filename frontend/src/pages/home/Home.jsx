import React, { useState, useEffect } from 'react';
import Map from '../../components/map/Map.jsx';
import CoffeeCard from "../../components/CoffeeCard.jsx";
import LargeCoffeeCard from "../../components/LargeCoffeeCard.jsx";

function Home(){
    // Test data for the CoffeeCard
    const testShop = {
        id: 1,
        name: "Test Coffee Shop",
        lat: 40.7831,
        lon: -73.9712,
        rating: 4.5,
        numberOfRatings: 25
    };

    // Track the selected coffee shop
    const [selectedShop, setSelectedShop] = useState(null);

    const handleSelect = (shop) => {
        if (selectedShop?.id === shop.id) {
            setSelectedShop(null);
        } else {
            setSelectedShop(shop);
        }
        console.log("Selected shop:", shop);
    };

    const handleToggleFavorite = () => {
        console.log("Favorite toggled for:", testShop.name);
    };

    return(
        <div style={{ position: 'relative', height: '100vh' }}>
            <Map/>
            <div style={{
                position: 'absolute',
                top: '20px',
                left: '20px',
                right: '20px',
                zIndex: 1000,
                pointerEvents: 'none'
            }}
            >
                {/* Coffee Card display */}
                <div style={{ pointerEvents: 'auto', maxWidth: '400px' }}>
                    <CoffeeCard
                        shop={testShop}
                        isSelected={false}
                        onSelect={handleSelect}
                        onToggleFavorite={handleToggleFavorite}
                        isAuthenticated={true}
                        isFavorite={false}
                    />
                </div>
            </div>
            {/* Large Coffee Card on the right side */}
            {selectedShop && (
                <LargeCoffeeCard
                    shop={selectedShop}  // Pass the selected shop to LargeCoffeeCard
                    onSelect={() => setSelectedShop(null)}  // Close the card when clicked
                    onToggleFavorite={() => handleToggleFavorite(selectedShop.id)}
                    isAuthenticated={true}
                    isFavorite={false}
                />
            )}
        </div>
    );
}

export default Home;