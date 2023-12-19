import 'package:dio/dio.dart';
import 'package:dokkan_firebase/data_source/data_helper.dart';
import 'package:dokkan_firebase/data_source/http_helper.dart';
import 'package:dokkan_firebase/model/post_data_model.dart';
import 'package:dokkan_firebase/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostDataProvider extends ChangeNotifier {
  Status? status;

  DbHelper? dbHelper;
  PostDataModel? postDataModel;
  final TextEditingController amountController = TextEditingController();
  final TextEditingController timeController = TextEditingController();





  Future<Response<dynamic>?> postData({required String time, required String amount}) async {
    print('post posr privider ++++');
    // var response =
    // await dbHelper?.posDataSource(
      // data: {
      //   'amount': amount,
      //   'currency_id': '1',
      //   'from_vault_id': '1',
      //   'to_vault_id': '3',
      //   'time': time,
      // },
    //   amount: amount , time: time
    // )
    // await HttpHelper().postDataHttp(time: time, amount: amount);
    // notifyListeners();
    //     .then((value) {
    //   status = Status.SUCCESS;
    //   postDataModel = PostDataModel.fromJson(value?.data);
    //   print('5555');
    //   notifyListeners();
    // }).catchError((e){
    //   print(('${e.toString()}2222222'));
    // });

    try {
      print('post posr privider 2000');
      status = Status.LOADING;
      notifyListeners();
      // if (response?.statusCode == 200 || response?.statusCode == 201) {
      //   print(response?.statusMessage.toString());
      //   print('post posr privider 25555');
      //   status = Status.SUCCESS;
      //   notifyListeners();
      //   return response;
      // }
      // await HttpHelper().postDataHttp(time: time, amount: amount);
      // notifyListeners();

      // await HttpHelper().postDataHttp(time: time, amount: amount)
    await dbHelper?.posDataSource(time: time, amount: amount)
          .then((value) {
        status = Status.SUCCESS;
        postDataModel = PostDataModel.fromJson(value?.data);
        print('5555');
        notifyListeners();
      }).catchError((e){
        print(('${e.toString()}2222222'));
      });
    } catch (e) {
      debugPrint(e.toString());
      status = Status.ERROR;
      notifyListeners();
    }

  }

  // void postD ({required String time, required String amount})async{
  //   await dbHelper?.posDataSource(
  //     amount: amount , time: time
  //   ).then((value) {
  //     print('lllldddddddd');
  //   });
  //
  //   notifyListeners();
  //
  // }
}
