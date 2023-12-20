import 'package:dio/dio.dart';
import 'package:dokkan_firebase/data_source/data_helper.dart';
import 'package:dokkan_firebase/data_source/http_helper.dart';
import 'package:dokkan_firebase/model/calender_data.dart';
import 'package:dokkan_firebase/model/deposite_model.dart';
import 'package:dokkan_firebase/utils/constants.dart';
import 'package:flutter/material.dart';

class GetDataProvider extends ChangeNotifier{
  Status ? status;
  DbHelper ? dbHelper = DbHelper();
  DepositeModel ? depositeModel;
  Map<DateTime,List<CalenderData>> data={};
  final TextEditingController inputController = TextEditingController();
  String ? date;

  Future<Map<DateTime,List<CalenderData>>> getData()async{
    data.clear();
    try {
      status = Status.LOADING;
      notifyListeners();
      data = await dbHelper!.getDataByDate(date:inputController.text.isEmpty?DateTime.now().month:
      int.parse(inputController.text));
      status = Status.SUCCESS;
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
      status = Status.ERROR;
      notifyListeners();
    }
    return data;
  }
}