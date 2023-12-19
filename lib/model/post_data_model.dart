// To parse this JSON data, do
//
//     final postDataModel = postDataModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

PostDataModel postDataModelFromJson(String str) => PostDataModel.fromJson(json.decode(str));

String postDataModelToJson(PostDataModel data) => json.encode(data.toJson());

class PostDataModel {
  final bool status;
  final String message;
  final dynamic data;

  PostDataModel({
    required this.status,
    required this.message,
    required this.data,
  });

  PostDataModel copyWith({
    bool? status,
    String? message,
    dynamic data,
  }) =>
      PostDataModel(
        status: status ?? this.status,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory PostDataModel.fromJson(Map<String, dynamic> json) => PostDataModel(
    status: json["status"],
    message: json["message"],
    data: json["data"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data,
  };
}
