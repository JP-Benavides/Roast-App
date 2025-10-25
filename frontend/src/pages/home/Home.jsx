import Map from '../../components/map/Map.jsx';
import CoffeeCard from "../../components/CoffeeCard.jsx";

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

    const handleSelect = () => {
        console.log("Coffee shop selected:", testShop.name);
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
            }}>
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
        </div>
    );
}

export default Home;