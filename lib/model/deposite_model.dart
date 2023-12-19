// To parse this JSON data, do
//
//     final depositeModel = depositeModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

DepositeModel depositeModelFromJson(String str) => DepositeModel.fromJson(json.decode(str));

String depositeModelToJson(DepositeModel data) => json.encode(data.toJson());

class DepositeModel {
  final bool status;
  final String message;
  final Data data;

  DepositeModel({
    required this.status,
    required this.message,
    required this.data,
  });

  DepositeModel copyWith({
    bool? status,
    String? message,
    Data? data,
  }) =>
      DepositeModel(
        status: status ?? this.status,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory DepositeModel.fromJson(Map<String, dynamic> json) => DepositeModel(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  final List<The20231212> the20231212;

  Data({
    required this.the20231212,
  });

  Data copyWith({
    List<The20231212>? the20231212,
  }) =>
      Data(
        the20231212: the20231212 ?? this.the20231212,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    the20231212: List<The20231212>.from(json["2023-12-12"].map((x) => The20231212.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "2023-12-12": List<dynamic>.from(the20231212.map((x) => x.toJson())),
  };
}

class The20231212 {
  final int id;
  final int categoryId;
  final String amount;
  final int currencyId;
  final int vaultId;
  final dynamic notes;
  final int isActive;
  final DateTime date;
  final String time;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int total;
  final Vaults vaults;
  final Currency depositCategory;
  final Currency currency;

  The20231212({
    required this.id,
    required this.categoryId,
    required this.amount,
    required this.currencyId,
    required this.vaultId,
    required this.notes,
    required this.isActive,
    required this.date,
    required this.time,
    required this.createdAt,
    required this.updatedAt,
    required this.total,
    required this.vaults,
    required this.depositCategory,
    required this.currency,
  });

  The20231212 copyWith({
    int? id,
    int? categoryId,
    String? amount,
    int? currencyId,
    int? vaultId,
    dynamic notes,
    int? isActive,
    DateTime? date,
    String? time,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? total,
    Vaults? vaults,
    Currency? depositCategory,
    Currency? currency,
  }) =>
      The20231212(
        id: id ?? this.id,
        categoryId: categoryId ?? this.categoryId,
        amount: amount ?? this.amount,
        currencyId: currencyId ?? this.currencyId,
        vaultId: vaultId ?? this.vaultId,
        notes: notes ?? this.notes,
        isActive: isActive ?? this.isActive,
        date: date ?? this.date,
        time: time ?? this.time,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        total: total ?? this.total,
        vaults: vaults ?? this.vaults,
        depositCategory: depositCategory ?? this.depositCategory,
        currency: currency ?? this.currency,
      );

  factory The20231212.fromJson(Map<String, dynamic> json) => The20231212(
    id: json["id"],
    categoryId: json["category_id"],
    amount: json["amount"],
    currencyId: json["currency_id"],
    vaultId: json["vault_id"],
    notes: json["notes"],
    isActive: json["is_active"],
    date: DateTime.parse(json["date"]),
    time: json["time"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    total: json["total"],
    vaults: Vaults.fromJson(json["vaults"]),
    depositCategory: Currency.fromJson(json["deposit_category"]),
    currency: Currency.fromJson(json["currency"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category_id": categoryId,
    "amount": amount,
    "currency_id": currencyId,
    "vault_id": vaultId,
    "notes": notes,
    "is_active": isActive,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "time": time,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "total": total,
    "vaults": vaults.toJson(),
    "deposit_category": depositCategory.toJson(),
    "currency": currency.toJson(),
  };
}

class Currency {
  final int id;
  final String name;
  final int isActive;
  final String symbol;
  final DateTime createdAt;
  final DateTime updatedAt;

  Currency({
    required this.id,
    required this.name,
    required this.isActive,
    required this.symbol,
    required this.createdAt,
    required this.updatedAt,
  });

  Currency copyWith({
    int? id,
    String? name,
    int? isActive,
    String? symbol,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Currency(
        id: id ?? this.id,
        name: name ?? this.name,
        isActive: isActive ?? this.isActive,
        symbol: symbol ?? this.symbol,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
    id: json["id"],
    name: json["name"],
    isActive: json["is_active"],
    symbol: json["symbol"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "is_active": isActive,
    "symbol": symbol,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class Vaults {
  final int id;
  final String name;
  final int currencyId;
  final int categoryId;
  final String balance;
  final int isActive;
  final DateTime createdAt;
  final DateTime updatedAt;

  Vaults({
    required this.id,
    required this.name,
    required this.currencyId,
    required this.categoryId,
    required this.balance,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  Vaults copyWith({
    int? id,
    String? name,
    int? currencyId,
    int? categoryId,
    String? balance,
    int? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Vaults(
        id: id ?? this.id,
        name: name ?? this.name,
        currencyId: currencyId ?? this.currencyId,
        categoryId: categoryId ?? this.categoryId,
        balance: balance ?? this.balance,
        isActive: isActive ?? this.isActive,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Vaults.fromJson(Map<String, dynamic> json) => Vaults(
    id: json["id"],
    name: json["name"],
    currencyId: json["currency_id"],
    categoryId: json["category_id"],
    balance: json["balance"],
    isActive: json["is_active"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "currency_id": currencyId,
    "category_id": categoryId,
    "balance": balance,
    "is_active": isActive,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
