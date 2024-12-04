import React from 'react';
import {Routes, Route, Link} from 'react-router-dom';
import Login from './pages/login/Login.jsx' ;
import Home from './pages/home/Home.jsx';


function App() {
  return (
    <div>
      <nav>
        <Link to="/"> Login</Link>| <Link to="/home">Home</Link>
      </nav>
      <Routes>
        <Route path="/" element={<Login/>}/>
        <Route path="/home" element={<Home/>}/>
      </Routes>
    </div>
  );
}

export default App;