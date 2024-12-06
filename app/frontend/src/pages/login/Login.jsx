import React,{useState} from 'react';
import { useNavigate } from 'react-router-dom';
import "./Login.css";

function Login(){
  const navigate = useNavigate();
  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");

  const updateUsername = (item) =>{
    setUsername(item.target.value);
  }
  const updatePassword = (item) =>{
    setPassword(item.target.value)
  }
  const performLogin = (event) => {
    event.preventDefault(); 

    if(username.length != 0 && password.length != 0){
      navigate('/home');
    }else{
      const message = document.querySelector('#message');
      message.textContent('Please Enter a Username and Password');
    }
  }

  return (
    <>
      <div className='loginPage'>
        <form id="loginForm" onSubmit={performLogin}>
          <label className="loginItem">
            Username
            <input type="text" id='usernameInput' value={username} onChange={updateUsername} placeholder="Enter Your Username"/>
            </label>
          <label className="loginItem">
            Password
            <input type="password" id='passwordInput' value={password} onChange={updatePassword} placeholder="Enter Your Password"/>
          </label>
          <button className="loginItem" type = "submit">Login</button>
          <p id='message'></p>
        </form>
      </div>

      <footer>
        <p>Roast INC.</p>
      </footer>
    </>
  );
}

export default Login;
