import 'package:dio/dio.dart';
import 'package:dokkan_firebase/data_source/data_helper.dart';
import 'package:dokkan_firebase/data_source/http_helper.dart';
import 'package:dokkan_firebase/model/deposite_model.dart';
import 'package:dokkan_firebase/utils/constants.dart';
import 'package:flutter/material.dart';

class GetDataProvider extends ChangeNotifier{
  Status ? status;
  DbHelper ? dbHelper;
  DepositeModel ? depositeModel;
  final TextEditingController inputController = TextEditingController();
  String ? date;

  Future<Response<dynamic>?> getData()async{
    print('post Dio++++');
    //  await HttpHelper().getDataHttp(date: inputController.text);
    // await dbHelper?.getDataSource(date: inputController.text)
    // .then((value) {
    //   depositeModel = DepositeModel.fromJson(value.data);
    //   status = Status.SUCCESS;
    //   notifyListeners();
    //   print('${depositeModel?.data.the20231212.length}');
    // });
    // notifyListeners();

    try {
      status = Status.LOADING;
      notifyListeners();
      // await HttpHelper().getDataHttp(date: inputController.text)
      await dbHelper?.getDataSource(date: inputController.text)
          .then((value) {
        depositeModel = DepositeModel.fromJson(value?.data);
        // depositeModel =depositeModelFromJson(value.data);
        status = Status.SUCCESS;
        notifyListeners();
        print('${depositeModel?.data.the20231212.length}');
      });
      notifyListeners();
      // if (response.statusCode == 200) {
      //   print(response.statusMessage);
      //   status = Status.SUCCESS;
      //   notifyListeners();
      //   return response;
      // }
    } catch (e) {
      debugPrint(e.toString());
      status = Status.ERROR;
      notifyListeners();
    }

    notifyListeners();
  }
}