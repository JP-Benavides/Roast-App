import React from 'react'; 
import './Home.css';
import Navbar from "../../components/Navbar.jsx";
import Map from '../../components/map/Map.jsx';
import Newsletter from '../../components/Newsletter.jsx'

function Home(){
    return(
        <>
            <Map/>
            <Newsletter/>
        </>
        
    );
}

export default Home; 