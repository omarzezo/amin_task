import 'dart:convert';

import 'package:dio/dio.dart';

String baseUrl55 = 'https://expenses.dokkan.xyz/api/v1';

class DbHelper {
  static Dio dio = Dio();

  static init() {
    dio = Dio(
        BaseOptions(
          baseUrl: baseUrl55,
          receiveDataWhenStatusError: true,
          // headers: {
          //   'Content-Type': 'application/json',
          // }

        ));
    // dio
    //   ..options.connectTimeout = (1 * 8000) as Duration?
    //   ..options.receiveTimeout = (10 * 10000) as Duration?;
    dio.interceptors.add(LogInterceptor(
      requestBody: true,
      error: true,
      requestHeader: false,
      responseHeader: false,
      request: true,
      responseBody: true,
    ));
    return dio;
  }

  // Future postOrderPermission({
  //   required String endPoint,
  //   required Map<String, dynamic> query,
  //   required Map<String, dynamic> data,
  // }) async {
  //   var response = await dio.post(endPoint, data: data, queryParameters: query);
  //
  //   if (response.statusCode == 200 || response.statusCode == 201) {
  //     return response;
  //   } else {
  //     throw Exception('${response.statusMessage}');
  //   }
  // }

  Future<Response?> getDataSource({
    required String  date}
  ) async {
    print('get Dio++++');

    var response = await dio.get('$baseUrl55/all_deposit_for_app/$date',);
    print('response..');
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response;
    } else {
      throw Exception('${response.statusMessage}');
    }
  }

  Future<Response?> posDataSource({
  required String time, required String amount
  })async{
    print('post Dio++++');

    var response =   await dio.post(
      '$baseUrl55/new_transaction',
         data: {
           'amount': amount,
           'currency_id': '1',
           'from_vault_id': '1',
           'to_vault_id': '3',
           'time': time,
         },
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response;
    } else {
      throw Exception('${response.statusMessage}');
    }
  }

}