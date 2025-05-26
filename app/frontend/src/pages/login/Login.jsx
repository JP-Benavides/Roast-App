import React from 'react';
import { SignIn } from '@clerk/clerk-react';
import "./Login.css";

function Login(){
  return (
      <div id="loginForm">
        <SignIn path="/login" routing="path" signUpUrl="/sign-up" />
      </div>
  );
}

export default Login;
