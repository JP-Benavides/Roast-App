import React from 'react';
import Navbar from "../../components/Navbar.jsx";
import Founders from './AboutComponents/Founders.jsx';
import WhoAreWe from './AboutComponents/WhoAreWe.jsx';
import Newsletter from './AboutComponents/Newsletter.jsx';
import './About.css';

function About(){
    return(
    <div className='background'>
        <NavBar/>
        <div id="AboutSection">
            <div id="leftAbout">
                <Founders/>
            </div>
            <div id="rightAbout">
                <WhoAreWe/>
                <Newsletter/>
            </div>
        </div>
    </div>
    );
}

export default About;