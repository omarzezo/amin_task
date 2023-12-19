import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';

class AuthPhoneProvider extends ChangeNotifier{

final TextEditingController phoneController = TextEditingController();
final GlobalKey<ScaffoldState> scaffoldKey =  GlobalKey<ScaffoldState>();
final TextEditingController c1 = TextEditingController();
final TextEditingController c2 = TextEditingController();
final TextEditingController c3 = TextEditingController();
final TextEditingController c4 = TextEditingController();
final TextEditingController c5 = TextEditingController();
final TextEditingController c6 = TextEditingController();


FirebaseAuth firebaseAuth = FirebaseAuth.instance;
String ? verify;
Status? status;


Future<void> authPhone (String phoneNum , BuildContext context)async{
  try{
    status = Status.LOADING;
    notifyListeners();

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+2$phoneNum',
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }
        ScaffoldMessenger.of(context).showSnackBar( SnackBar(
          content: Text(e.message.toString()),
          backgroundColor: Colors.red,
        ));
      },
      codeSent: (String verificationId, int? resendToken) {
        verify = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
    notifyListeners();
  }on FirebaseException catch(e){
    ScaffoldMessenger.of(context).showSnackBar( SnackBar(
      content: Text(e.message.toString()),
      backgroundColor: Colors.red,
    ));
    status = Status.SUCCESS;
    notifyListeners();
  }
}


Future<void> codeSent(BuildContext context)async{

  try{
    status = Status.LOADING;
    notifyListeners();
        String smsCode = c1.text+c2.text+c3.text+c4.text+c5.text+c6.text;
        PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verify!, smsCode: smsCode);
        await firebaseAuth.signInWithCredential(credential).then((value){
          ScaffoldMessenger.of(context).showSnackBar( const SnackBar(
            content: Text('Success Auth '),
            backgroundColor: Colors.red,
          ));
        });
        notifyListeners();
  }on FirebaseAuth catch(e){
    ScaffoldMessenger.of(context).showSnackBar( SnackBar(
      content: Text(e.toString()),
      backgroundColor: Colors.red,
    ));
    notifyListeners();
  }
}


late String verificationId;


Future<void> submitPhoneNumber(String phoneNumber) async {
  status = Status.LOADING;
  notifyListeners();

  await FirebaseAuth.instance.verifyPhoneNumber(
    phoneNumber: '+2$phoneNumber',
    timeout: const Duration(seconds: 14),
    verificationCompleted: verificationCompleted,
    verificationFailed: verificationFailed,
    codeSent: codeSentOtp,
    codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
  );
}

void verificationCompleted(PhoneAuthCredential credential) async {
  print('verificationCompleted');
  await signIn(credential);
  notifyListeners();
}

void verificationFailed(FirebaseAuthException error) {
  print('verificationFailed : ${error.toString()}');
  notifyListeners();
}

void codeSentOtp(String verificationId, int? resendToken) {
  print('codeSent');
  this.verificationId = verificationId;
  notifyListeners();
}

void codeAutoRetrievalTimeout(String verificationId) {
  print('codeAutoRetrievalTimeout');
}

Future<void> submitOTP(String otpCode) async {
  status = Status.LOADING;
  notifyListeners();
  PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId, smsCode: otpCode);

  await signIn(credential).then((value) {
    status = Status.SUCCESS;
    notifyListeners();
  });
  notifyListeners();
}

Future<void> signIn(PhoneAuthCredential credential) async {
  try {
    await FirebaseAuth.instance.signInWithCredential(credential);
    notifyListeners();
  } catch (error) {
    notifyListeners();
  }
}

Future<void> logOut() async {
  await FirebaseAuth.instance.signOut();
}

User getLoggedInUser() {
  User firebaseUser = FirebaseAuth.instance.currentUser!;
  return firebaseUser;
}


}