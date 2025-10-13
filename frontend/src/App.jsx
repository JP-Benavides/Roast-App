import React from 'react';
import { ClerkProvider } from '@clerk/clerk-react';
import {Routes, Route, Navigate} from 'react-router-dom';
import Navbar from './components/Navbar.jsx'
import Login from './pages/login/Login.jsx' ;
import SignUpPage from './pages/login/SignUp.jsx';
import Home from './pages/home/Home.jsx';
import About from './pages/about/About.jsx';
import Reviews from './pages/reviews/Reviews.jsx';
import './App.css';

function App() {
  return (
    <div className='app-container'>
      <Navbar/>
      <Routes>
        <Route path="/" element={<Navigate to ="/home"/>}/>
        <Route path="/home" element={<Home/>}/>
        <Route path="/about" element={<About/>}/>
        <Route path="/reviews" element={<Reviews/>}/>
        <Route path="/login" element={<Login/>}/>
        <Route path="/sign-up/*" element={<SignUpPage/>}/>
      </Routes>
    </div>
  );
}

export default App;