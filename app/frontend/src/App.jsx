import React from 'react';
import {Routes, Route, Link} from 'react-router-dom';
import Login from './pages/login/Login.jsx' ;
import Home from './pages/home/Home.jsx';
import About from './pages/about/About.jsx';
import './App.css';

function App() {
  return (
    <div>
      <Routes>
        <Route path="/" element={<Login/>}/>
        <Route path="/home" element={<Home/>}/>
        <Route path="/about" element={<About/>}/>
      </Routes>
    </div>
  );
}

export default App;