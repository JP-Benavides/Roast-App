import React from 'react';
import "./Login.css";

function Login() {
  return (
    <>
      <main>
        <form id="loginForm">
          <label class="loginLabel">
            Username
            <input type="text" placeholder="Enter Your Username"/>
            </label>
          <br/>
          <label class="loginLabel">
            Password
            <input type="password" placeholder="Enter Your Password"/>
          </label>
          <button type = "submit">Login</button>
        </form>
      </main>
      <footer>
        <p>Roast INC.</p>
      </footer>
    </>
  );
}

export default Login;
