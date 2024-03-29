import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:unimate/screens/login_screen.dart';
import 'package:unimate/screens/signup.dart';

final _firestore = FirebaseFirestore.instance;

Future<bool> signInWithGoogle(BuildContext context) async {
  bool res = false;
  try {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    // Once signed in, return the UserCredential
    final userCredentials =
        await FirebaseAuth.instance.signInWithCredential(credential);
    final user = userCredentials.user;

    if (user != null) {
      if (userCredentials.additionalUserInfo!.isNewUser) {
        await _firestore.collection('users').doc(user.uid);
        res = true;
      } else {
        res = false;
      }
    }
  } on FirebaseAuthException catch (error) {
    res = false;
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(error.message!),
      ),
    );
  }
  return res;
}

Future<void> logOut(BuildContext context) async {
  await FirebaseAuth.instance.signOut();
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => LoginScreen()));
  return;
}
