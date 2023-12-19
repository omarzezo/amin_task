// static Future<void> createUser() async {
//   final time = DateTime.now().millisecondsSinceEpoch.toString();

//   final chatUser = ChatUser(
//       id: user.uid,
//       name: user.displayName.toString(),
//       email: user.email.toString(),
//       about: "Hey, I'm using Five Chat!",
//       image: user.photoURL.toString(),
//       createdAt: time,
//       isOnline: false,
//       lastActive: time,
//       pushToken: '');

//   return await fireStore
//       .collection('users')
//       .doc(user.uid)
//       .set(chatUser.toJson());
// }

//  static Future<bool> userExists() async {
//     return (await fireStore.collection('users').doc(user.uid).get()).exists;
//   }

// for authentication
// static FirebaseAuth auth = FirebaseAuth.instance;

// for accessing cloud fireStore database
// static FirebaseFirestore fireStore = FirebaseFirestore.instance;

import 'package:dokkan_firebase/screens/congratulations_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';

class AuthEmailWithPasswordProvider extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formState = GlobalKey<FormState>();
  bool obx = true;

  static FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Status? status;

  void obxFun() {
    obx = !obx;
    notifyListeners();
  }

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    // status = Status.LOADING;
    // notifyListeners();
    try {
      status = Status.LOADING;
      notifyListeners();
      await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Success'),
          backgroundColor: Colors.green,
        ));
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const SuccessScreen()),
            (route) => false);

        status = Status.SUCCESS;
        emailController.clear();
        passwordController.clear();
        notifyListeners();
      });
    } on FirebaseException catch (e) {
      String message = "${e.message}";
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'Email Already In Use') {
        print('The account already exists for that email.');
        message = 'The account already exists for that email.';
      } else {
        message = e.message.toString();
      }
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ));
      notifyListeners();
    }
  }
}
