import React from 'react'; 
import './Home.css';
import Navbar from "../../components/Navbar.jsx";
import Map from '../../components/map/Map.jsx';

function Home(){
    return(
        <>
            <Navbar/>
            <Map/>
        </>
        
    );
}

export default Home; 