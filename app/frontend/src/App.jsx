import React from 'react';
import {Routes, Route} from 'react-router-dom';
import Login from './pages/login/Login.jsx' ;
import Home from './pages/home/Home.jsx';
import About from './pages/about/About.jsx';
import Reviews from './pages/reviews/Reviews.jsx';
import './App.css';

function App() {
  return (
    <div className='app-container'>
      <Routes>
        <Route path="/" element={<Login/>}/>
        <Route path="/home" element={<Home/>}/>
        <Route path="/about" element={<About/>}/>
        <Route path="/reviews" element={<Reviews/>}/>
      </Routes>
    </div>
  );
}

export default App;