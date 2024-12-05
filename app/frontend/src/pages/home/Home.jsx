import React from 'react'; 
import './Home.css';
import Navbar from '../sharedComponents/Navbar.jsx';
import Map from './HomeComponents/Map.jsx';

function Home(){
    return(
        <>
            <Navbar/>
            <Map/>
        </>
        
    );
}

export default Home; 