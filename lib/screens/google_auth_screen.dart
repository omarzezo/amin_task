import 'package:dokkan_firebase/controller/auth_with_google.dart';
import 'package:dokkan_firebase/utils/constants.dart';
import 'package:dokkan_firebase/utils/ex.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthGoogleScreen extends StatelessWidget {
  const AuthGoogleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Sign Up'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body:  Consumer<AuthWithGoogleProvider>(
        builder: (context , state , widget){
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.garage_outlined , size: 100,color: Colors.purple,),
                30.ph,
                state.status == Status.LOADING ? const CircularProgressIndicator(color: Colors.amber,) :  ElevatedButton(
                  onPressed: (){
                    state.signInWithGoogle(context);
                  }, style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.purple),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))),
                  textStyle: MaterialStateProperty.all(const TextStyle(color: Colors.white)),
                  elevation: MaterialStateProperty.all(0.0),

                ),
                  child: const Text('Auth With Email ' , style:  TextStyle(color: Colors.white),),
                ),
              ],
            ),
          );
        },
      )
    );
  }
}
