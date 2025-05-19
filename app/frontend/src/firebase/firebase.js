// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import { getAnalytics } from "firebase/analytics";
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
  apiKey: "", //API Key
  authDomain: "roast-nyc.firebaseapp.com",
  projectId: "roast-nyc",
  storageBucket: "roast-nyc.firebasestorage.app",
  messagingSenderId: "746105389059",
  appId: "1:746105389059:web:3d712759e3e1680f558e36",
  measurementId: "G-Q3TKJSDWKK"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const auth = getAuth(app);

export {app,auth};