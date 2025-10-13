import React from 'react';
import { SignUp } from '@clerk/clerk-react';
import "./Login.css";

function SignUpPage() {
  return (
    <div id="loginForm">
      <SignUp path="/sign-up" routing="path" signInUrl="/login" />
    </div>
  );
}

export default SignUpPage;