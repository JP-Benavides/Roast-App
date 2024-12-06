import React from 'react';
import {Routes, Route} from 'react-router-dom';
import Login from './pages/login/Login.jsx' ;
import Home from './pages/home/Home.jsx';
import About from './pages/about/About.jsx';
import './App.css';

function App() {
  return (
    <div className='app-container'>
      <Routes>
        <Route path="/" element={<Login/>}/>
        <Route path="/home" element={<Home/>}/>
        <Route path="/about" element={<About/>}/>
      </Routes>
    </div>
  );
}

export default App;