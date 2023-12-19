import 'package:dokkan_firebase/controller/post_date.dart';
import 'package:dokkan_firebase/utils/ex.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/text_field_widget.dart';
import '../utils/constants.dart';

class PostData extends StatelessWidget {
  const PostData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PostDataProvider>(builder: (context, state, child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          bottomOpacity: 0.5,
          title: Text('Add Post'),
          centerTitle: true,
          // bottom: const PreferredSize(preferredSize: Size.square(100), child: Icon(Icons.abc)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFieldWidget(
                    validator: (value) {},
                    controller: state.amountController,
                    hintText: 'Amount Address..',
                    obscureText: false,
                    change: (value) {}),
                30.ph,
                TextFieldWidget(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Insert Value..';
                    }
                  },
                  onTap: () async {},
                  controller: state.timeController,
                  hintText: 'Time',
                  obscureText: false,
                  readOnly: true,
                  change: (value) {},
                  suffixIcon: IconButton(
                      onPressed: () {
                        showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                            builder: (context, child) {
                              return Theme(
                                data: Theme.of(context).copyWith(
                                  colorScheme: const ColorScheme.light(
                                    primary: Colors.green, //
                                    // onPrimary: MyColor.green, //
                                    onPrimary: Colors.white,
                                    onSurface: Colors.amber, //
                                  ),
                                  textButtonTheme: TextButtonThemeData(
                                    style: TextButton.styleFrom(
                                      foregroundColor:
                                          Colors.purple, // button text color
                                    ),
                                  ),
                                ),
                                child: child!,
                              );
                            }).then((value) {
                          state.timeController.text =
                              value!.format(context).toString();
                          print(value.format(context));
                        });
                      },
                      icon: const Icon(Icons.timelapse)),
                ),
                30.ph,
                state.status == Status.LOADING
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () {
                          print('jjjj');
                          // if(state.postDataModel!.status){
                          state
                              .postData(
                                  time: state.timeController.text,
                                  amount: state.amountController.text)
                              .then((value) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                                    '${state.postDataModel?.message.toString()}')));
                          }).catchError((e) {
                            debugPrint(e.toString());
                          });
                          // }else{
                          //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          //       content: Text(
                          //           '${state.postDataModel?.message.toString()}')));
                          // }
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.green),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0))),
                          textStyle: MaterialStateProperty.all(
                              const TextStyle(color: Colors.white)),
                          elevation: MaterialStateProperty.all(0.0),
                        ),
                        child: const Text(
                          'Post ',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
