class CalenderData {
  int? id;
  int? categoryId;
  String? amount;
  int? currencyId;
  int? vaultId;
  String? notes;
  int? isActive;
  String? date;
  String? time;
  String? createdAt;
  String? updatedAt;
  int? total;
  Vaults? vaults;
  DepositCategory? depositCategory;
  Currency? currency;

  CalenderData(
      {this.id,
        this.categoryId,
        this.amount,
        this.currencyId,
        this.vaultId,
        this.notes,
        this.isActive,
        this.date,
        this.time,
        this.createdAt,
        this.updatedAt,
        this.total,
        this.vaults,
        this.depositCategory,
        this.currency});

  CalenderData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    amount = json['amount'];
    currencyId = json['currency_id'];
    vaultId = json['vault_id'];
    notes = json['notes'];
    isActive = json['is_active'];
    date = json['date'];
    time = json['time'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    total = json['total'];
    vaults =
    json['vaults'] != null ? new Vaults.fromJson(json['vaults']) : null;
    depositCategory = json['deposit_category'] != null
        ? new DepositCategory.fromJson(json['deposit_category'])
        : null;
    currency = json['currency'] != null
        ? new Currency.fromJson(json['currency'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
    data['amount'] = this.amount;
    data['currency_id'] = this.currencyId;
    data['vault_id'] = this.vaultId;
    data['notes'] = this.notes;
    data['is_active'] = this.isActive;
    data['date'] = this.date;
    data['time'] = this.time;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['total'] = this.total;
    if (this.vaults != null) {
      data['vaults'] = this.vaults!.toJson();
    }
    if (this.depositCategory != null) {
      data['deposit_category'] = this.depositCategory!.toJson();
    }
    if (this.currency != null) {
      data['currency'] = this.currency!.toJson();
    }
    return data;
  }
}

class Vaults {
  int? id;
  String? name;
  int? currencyId;
  int? categoryId;
  String? balance;
  int? isActive;
  String? createdAt;
  String? updatedAt;

  Vaults(
      {this.id,
        this.name,
        this.currencyId,
        this.categoryId,
        this.balance,
        this.isActive,
        this.createdAt,
        this.updatedAt});

  Vaults.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    currencyId = json['currency_id'];
    categoryId = json['category_id'];
    balance = json['balance'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['currency_id'] = this.currencyId;
    data['category_id'] = this.categoryId;
    data['balance'] = this.balance;
    data['is_active'] = this.isActive;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class DepositCategory {
  int? id;
  String? name;
  int? isActive;
  String? createdAt;
  String? updatedAt;

  DepositCategory(
      {this.id, this.name, this.isActive, this.createdAt, this.updatedAt});

  DepositCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['is_active'] = this.isActive;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Currency {
  int? id;
  String? name;
  int? isActive;
  String? symbol;
  String? createdAt;
  String? updatedAt;

  Currency(
      {this.id,
        this.name,
        this.isActive,
        this.symbol,
        this.createdAt,
        this.updatedAt});

  Currency.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    isActive = json['is_active'];
    symbol = json['symbol'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['is_active'] = this.isActive;
    data['symbol'] = this.symbol;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}