import React from 'react';
import NavBar from '../sharedComponents/Navbar.jsx';
import Founders from './AboutComponents/Founders.jsx';
import WhoAreWe from './AboutComponents/WhoAreWe.jsx';
import Newsletter from './AboutComponents/Newsletter.jsx';
import './About.css';

function About(){
    return(
    <div className='background'>
        <NavBar/>
        <body id="AboutSection">
            <div id="leftAbout">
                <Founders/>
            </div>
            <div id="rightAbout">
                <WhoAreWe/>
                <Newsletter/>
            </div>
        </body>
    </div>
    );
}

export default About;