import React from 'react';
import './Navbar.css'

function Navbar(){
    return(
        <main id="container">
            <div id="totalItems">
            <svg className="item" width="75px" height="75px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M5 8H13.75M5 12H19M10.25 16L19 16" stroke="#464455" stroke-linecap="round" stroke-linejoin="round"/>
            </svg>
            <h3 className="item">Home</h3>
            <h3 className="item">About Us</h3>
            </div>
        </main>
    );
}

export default Navbar; 