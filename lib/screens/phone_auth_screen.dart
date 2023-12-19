import 'package:dokkan_firebase/components/otp_widget.dart';
import 'package:dokkan_firebase/components/text_field_widget.dart';
import 'package:dokkan_firebase/controller/auth_with_phone.dart';
import 'package:dokkan_firebase/utils/ex.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/constants.dart';

class AuthPhoneScreen extends StatelessWidget {
  const AuthPhoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthPhoneProvider>(
      builder: (context, state, child) {
        return Scaffold(
          key: state.scaffoldKey,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              title: const Text('Sign Up'),
              centerTitle: true,
              elevation: 0.0,
            ),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFieldWidget(
                      validator: (value) {
                        if(value!.isEmpty){
                          return ' Add Number';
                        }
                      },
                      keyboardType: TextInputType.number,
                      controller: state.phoneController,
                      hintText: 'Add Phone Number',
                      obscureText: false,
                      change: (value) {}),
                  20.ph,
                  // state.status == Status.LOADING ?  const CircularProgressIndicator():
                  ElevatedButton(
                    onPressed: () {
                      if(state.phoneController.text.isEmpty && state.phoneController.text.length >= 10){
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please Add Phone Number') , backgroundColor: Colors.red,));
                      }else{
                        state.submitPhoneNumber(state.phoneController.text).then((value) {
                          state.scaffoldKey.currentState!.showBottomSheet((context) => Container(
                            height: MediaQuery.of(context).size.height/2,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    OTPWidget(textEditingController: state.c1, first: true, last: false),
                                    OTPWidget(textEditingController: state.c2, first: false, last: false),
                                    OTPWidget(textEditingController: state.c3, first: false, last: false),
                                    OTPWidget(textEditingController: state.c4, first: false, last: false),
                                    OTPWidget(textEditingController: state.c5, first: false, last: false),
                                    OTPWidget(textEditingController: state.c6, first: false, last: false),
                                  ],
                                ),
                                 ElevatedButton(
                                  onPressed: (){
                                    state.codeSent(context).then((value) {
                                      Navigator.pop(context);
                                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Success Rejester') , backgroundColor: Colors.green,));

                                    });
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
                          ));
                        });
                      }

                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.purple),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0))),
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
            ));
      },
    );
  }
}
