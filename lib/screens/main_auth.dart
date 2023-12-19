import 'package:dokkan_firebase/screens/password_email_screen.dart';
import 'package:dokkan_firebase/screens/phone_auth_screen.dart';
import 'package:flutter/material.dart';

import 'google_auth_screen.dart';



class MainAuth extends StatelessWidget {
  const MainAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Main Auth'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (_)=> const AuthGoogleScreen()));
              }, style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.purple),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))),
              textStyle: MaterialStateProperty.all(const TextStyle(color: Colors.white)),
              elevation: MaterialStateProperty.all(0.0),

            ),
              child: const Text('Auth With Google ', style:  TextStyle(color: Colors.white),),
            ),
            const SizedBox(height: 20.0,),
            ElevatedButton(
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (_)=> const AuthPhoneScreen()));

              }, style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))),
                textStyle: MaterialStateProperty.all(const TextStyle(color: Colors.white)),
              elevation: MaterialStateProperty.all(0.0),

            ),
              child: const Text('Auth With Phone ', style:  TextStyle(color: Colors.white),),
            ),
            const SizedBox(height: 20.0,),
            ElevatedButton(
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (_)=> const AuthScreenWithEmailAndPassword()));

              }, style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.deepOrange),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))),
                textStyle: MaterialStateProperty.all(const TextStyle(color: Colors.white)),
              elevation: MaterialStateProperty.all(0.0),

            ),
              child: const Text('Auth With Email ' , style:  TextStyle(color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }
}
