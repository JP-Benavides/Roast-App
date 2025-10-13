import React from 'react';
import Navbar from "../../components/Navbar.jsx";
import Newsletter from '../../components/Newsletter.jsx';
import './About.css';

function About(){
    return(
    <>
    <div className = "about-page">
        <h1>About Us</h1>
        <p>
            Whether is finding a gatekept coffee shop or flexing how much caffine you had 
            in a given week we got you. Log and rate your brews and share them with your friends.
        </p>
    </div>
    <Newsletter/>
    </>
    );
}

export default About;