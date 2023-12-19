import 'package:dio/dio.dart';
import 'package:dokkan_firebase/data_source/data_helper.dart';
import 'package:dokkan_firebase/data_source/http_helper.dart';
import 'package:dokkan_firebase/model/deposite_model.dart';
import 'package:dokkan_firebase/utils/constants.dart';
import 'package:flutter/material.dart';

class GetDataProvider extends ChangeNotifier{
  Status ? status;
  DbHelper ? dbHelper = DbHelper();
  DepositeModel ? depositeModel;
  final TextEditingController inputController = TextEditingController();
  String ? date;

  Future<DepositeModel> getData()async{
    // Response? data;
    // try {
      status = Status.LOADING;
      notifyListeners();

      DepositeModel? date= await dbHelper?.getDataOmar(date:inputController.text.isEmpty?'12':inputController.text);
      print("date>>"+date!.message.toString());
      // depositeModel = DepositeModel.fromJson(date?.data);
      // status = Status.SUCCESS;
      // notifyListeners();
      // notifyListeners();
    // } catch (e) {
    //   debugPrint(e.toString());
    //   status = Status.ERROR;
    //   notifyListeners();
    // }
    return date!;
    notifyListeners();
  }
}