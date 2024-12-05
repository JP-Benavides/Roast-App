    import React, {useState} from 'react';
    import './Navbar.css';
    import {useNavigate} from 'react-router-dom';
    import {useMediaQuery} from 'react-responsive';


function Navbar(){
        //Handle Nav Bar Clicking 
        const navigate = useNavigate();

        const aboutClick = () =>{
            navigate('/about');
        }
        const homeClick = () =>{
            navigate('/home');
        }

        //Handle MediaQuery for Hamburger Bar
        let hamburger = document.querySelector('hamburgerBar');
        const [isHamburgerOpen, setHamburgerOpen] = useState(false);
        const toggleHamburger = () => {
            setHamburgerOpen((prev) => !prev);
        };
        const isMobile = useMediaQuery({query: '(max-width:768px)'});    
        

        return(
            <main id="container">
                <div id="totalItems">
                    {isMobile && (
                        <svg
                            id="hamburgerBar"
                            className="item"
                            width="75px"
                            height="75px"
                            viewBox="0 0 24 24"
                            fill="none"
                            xmlns="http://www.w3.org/2000/svg"
                            onClick={toggleHamburger}
                        >
                            <path
                                d="M5 8H13.75M5 12H19M10.25 16L19 16"
                                stroke="#464455"
                                strokeLinecap="round"
                                strokeLinejoin="round"
                            />
                        </svg>
                    )}
                    {!isMobile || isHamburgerOpen ? (
                        <>
                            <h3 className="item" id="homeButton" onClick={homeClick}>
                                Home
                            </h3>
                            <h3 className="item" id="aboutButton" onClick={aboutClick}>
                                About Us
                            </h3>
                        </>
                    ) : null}
                </div>
            </main>
            );
    }

export default Navbar; 