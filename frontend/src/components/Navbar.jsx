import React from 'react';
import './Navbar.css';
import { useNavigate } from 'react-router-dom';

function Navbar() {
    const navigate = useNavigate();

    const aboutClick = () => navigate('/about');
    const homeClick = () => navigate('/home');
    const loginClick = () => navigate('/login');

    return (
        <div id="container">
            <div className="logoClass"> 
                <h1>Roast</h1>
            </div>
            <div id="totalItems">
                <h3 className="item" id="homeButton" onClick={homeClick}>
                    Home
                </h3>
                <h3 className="item" id="aboutButton" onClick={aboutClick}>
                    About
                </h3>
                <h3 className="item" id="loginButton" onClick={loginClick}>
                    Login
                </h3>
            </div>
        </div>
    );
}

export default Navbar;