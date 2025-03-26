import {auth} from ".firebase";
import { createUserWithEmailAndPassword, sendPasswordResetEmail, signInWithCredential, signInWithEmailAndPassword } from "firebase/auth";

//New User with email and password
export const doCreateUserWithEmailAndPassword = async (email,password) => {
    return createUserWithEmailAndPassword(auth,email,password);
};

export const doSignInWithEmailAndPassword = (email, password) => {
    return signInWithEmailAndPassword(auth,email,password);
};

//New User with Google Sign in
export const doSignInWithGoogle = async () => {
    const provider = new GoogleAuthProvider();
    const result = await signInWithPopup(auth, provider)
    return result
};

//Signs out user
export const doSignOut = () => {
    return auth.signOut();
};

//Password Reset
export const doPasswordReset = (email) => {
    return sendPasswordResetEmail(auth, email);
};

//Password Change
export const doPasswordChange = (password) => {
    return updatePassword(auth.currentUser, password);
}

//Email Verification
export const doSendEmailVerification = () => {
    return sendEmailVerification(auth.currentUser, {
        url: `${window.location.origin}/home`,
    });
};