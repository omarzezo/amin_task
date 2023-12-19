
  import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../screens/congratulations_auth.dart';
import '../utils/constants.dart';

class AuthWithGoogleProvider extends ChangeNotifier{
  static FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Status? status;


  Future<UserCredential?> signInWithGoogle(BuildContext context) async {
    try {
      status = Status.LOADING;
      notifyListeners();

      await InternetAddress.lookup('google.com');
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      return await firebaseAuth.signInWithCredential(credential).then((value) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Success'),
          backgroundColor: Colors.green,
        ));
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const SuccessScreen()),
                (route) => false);
        status =  Status.SUCCESS;
        notifyListeners();

      });
    }on FirebaseException  catch (e) {
      log('\n_signInWithGoogle: $e');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
        backgroundColor: Colors.red,
      ));      return null;
    }
  }

}