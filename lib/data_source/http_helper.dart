import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dokkan_firebase/data_source/data_helper.dart';
import 'package:http/http.dart' as http;




class HttpHelper{
  var client = http.Client();


  Future<Response> getDataHttp ({ required String  date})async{
    var response = await client.get(Uri.parse('$baseUrl55/all_deposit_for_app/11'));
    var responseData = json.decode(response.body);
    if (response.statusCode == 200 || response.statusCode==201) {
      return responseData;
    } else {
      throw Exception(responseData.statusMessage.toString());
    }
  }



  Future<Response>  postDataHttp ({
    required String time, required String amount
    })async{
    var response = await client.post(Uri.parse('$baseUrl55/new_transaction') , body: {
      'amount': amount,
      'currency_id': '1',
      'from_vault_id': '1',
      'to_vault_id': '3',
      'time': time,
    });
    var responseData = json.decode(response.body);
    if ( response.statusCode == 200 || response.statusCode==201) {
      print('gggggggggg');
      return responseData;
    } else {
      throw Exception(responseData.statusMessage.toString());
    }
  }


}