import 'package:dokkan_firebase/components/text_field_widget.dart';
import 'package:dokkan_firebase/screens/congratulations_auth.dart';
import 'package:dokkan_firebase/utils/constants.dart';
import 'package:dokkan_firebase/utils/ex.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/auth_with_email_password.dart';

class AuthScreenWithEmailAndPassword extends StatefulWidget {
  const AuthScreenWithEmailAndPassword({Key? key}) : super(key: key);

  @override
  State<AuthScreenWithEmailAndPassword> createState() =>
      _AuthScreenWithEmailAndPasswordState();
}

class _AuthScreenWithEmailAndPasswordState
    extends State<AuthScreenWithEmailAndPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text('Sign Up'),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Consumer<AuthEmailWithPasswordProvider>(
          builder: (context, child, widget) {
            return Form(
              key: child.formState,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Hello, ',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.deepPurple,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    ),
                    10.ph,
                    const Text(
                      'Your Rejester Now as',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold),
                    ),
                    10.ph,

                    const Text(
                      'The Best Easy Way',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold),
                    ),
                    10.ph,
                    // const Spacer(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 8,
                    ),

                    TextFieldWidget(
                        validator: (value) {},
                        controller: child.emailController,
                        hintText: 'Email Address..',
                        obscureText: false,
                        change: (value) {}),
                    20.ph,
                    TextFieldWidget(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Insert Value..';
                        }
                      },
                      controller: child.passwordController,
                      hintText: 'Password',
                      obscureText: child.obx,
                      change: (value) {},
                      suffixIcon: IconButton(
                          onPressed: () {
                            child.obxFun();
                          },
                          icon: child.obx
                              ? const Icon(Icons.remove_red_eye)
                              : const Icon(Icons.remove_red_eye_outlined)),
                    ),
                    30.ph,
                    child.status == Status.LOADING
                        ? const CircularProgressIndicator(
                            color: Colors.amber,
                          )
                        : ElevatedButton(
                            onPressed: () {
                              child
                                  .signInWithEmailAndPassword(
                                      email: child.emailController.text,
                                      password: child.passwordController.text,
                                      context: context)
                                  .then((value) {});
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.green),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0))),
                              textStyle: MaterialStateProperty.all(
                                  const TextStyle(color: Colors.white)),
                              elevation: MaterialStateProperty.all(0.0),
                            ),
                            child: const Text(
                              'Auth With Email ',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
