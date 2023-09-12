import 'package:json_annotation/json_annotation.dart';

part 'details.promotion.model.g.dart';

@JsonSerializable()
class PromotionDetails {
  String? message;
  String? traceId;
  Data? data;

  PromotionDetails({this.message, this.traceId, this.data});

  PromotionDetails.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    traceId = json['traceId'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['traceId'] = traceId;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

@JsonSerializable()
class Data {
  int? id;
  String? thumbnailImage;
  String? bannerImage;
  String? title;
  String? content;
  String? startDate;
  String? endDate;
  List<Forms>? forms;

  Data(
      {this.id,
        this.thumbnailImage,
        this.bannerImage,
        this.title,
        this.content,
        this.startDate,
        this.endDate,
        this.forms});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    thumbnailImage = json['thumbnail_image'];
    bannerImage = json['banner_image'];
    title = json['title'];
    content = json['content'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    if (json['forms'] != null) {
      forms = <Forms>[];
      json['forms'].forEach((v) {
        forms!.add(Forms.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['thumbnail_image'] = thumbnailImage;
    data['banner_image'] = bannerImage;
    data['title'] = title;
    data['content'] = content;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    if (forms != null) {
      data['forms'] = forms!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

@JsonSerializable()
class Forms {
  String? promotionBy;
  String? promotionType;
  List<Conditions>? conditions;

  Forms({this.promotionBy, this.promotionType, this.conditions});

  Forms.fromJson(Map<String, dynamic> json) {
    promotionBy = json['promotion_by'];
    promotionType = json['promotion_type'];
    if (json['conditions'] != null) {
      conditions = <Conditions>[];
      json['conditions'].forEach((v) {
        conditions!.add(Conditions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['promotion_by'] = promotionBy;
    data['promotion_type'] = promotionType;
    if (conditions != null) {
      data['conditions'] = conditions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

@JsonSerializable()
class Conditions {
  int? id;
  double? totalBillFrom;
  double? totalBillTo;
  String? currencyAlias;
  CurrencyData? currencyData;
  bool? isPercentDiscount;
  bool? isLimitAmountDiscountMax;
  double? amountLimitDiscount;
  String? serviceAlias;
  String? serviceData;
  double? amountDiscount;

  Conditions(
      {this.id,
        this.totalBillFrom,
        this.totalBillTo,
        this.currencyAlias,
        this.currencyData,
        this.isPercentDiscount,
        this.isLimitAmountDiscountMax,
        this.amountLimitDiscount,
        this.serviceAlias,
        this.serviceData,
        this.amountDiscount});

  Conditions.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    totalBillFrom = json?['total_bill_from'] == null
        ? null
        : double.parse(json!['total_bill_from'].toString());
    totalBillTo = json?['total_bill_to'] == null
        ? null
        : double.parse(json!['total_bill_to'].toString());
    currencyAlias = json?['currency_alias'];
    currencyData = CurrencyData.fromJson(json?['currency_data']);
    isPercentDiscount = json?['is_percent_discount'];
    isLimitAmountDiscountMax = json?['is_limit_amount_discount_max'];
    amountLimitDiscount = json?['amount_limit_discount'] != null
        ? double.parse(json!['amount_limit_discount'].toString()) : null;
    serviceAlias = json?['service_alias'];
    // serviceData = json?['service_data'];
    amountDiscount = json?['amount_discount'] != null
        ? double.parse(json!['amount_discount'].toString()) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['total_bill_from'] = totalBillFrom;
    data['total_bill_to'] = totalBillTo;
    data['currency_alias'] = currencyAlias;
    if (currencyData != null) {
      data['currency_data'] = currencyData!.toJson();
    }
    data['is_percent_discount'] = isPercentDiscount;
    data['is_limit_amount_discount_max'] = isLimitAmountDiscountMax;
    data['amount_limit_discount'] = amountLimitDiscount;
    data['service_alias'] = serviceAlias;
    // data['service_data'] = serviceData;
    data['amount_discount'] = amountDiscount;
    return data;
  }
}

@JsonSerializable()
class CurrencyData {
  String? symbol;
  String? fullName;
  String? currencyMin;
  String? name;
  String? alias;
  int? rounding;
  int? id;
  String? position;
  bool? isMainCurrency;
  int? decimalPlaces;

  CurrencyData(
      {this.symbol,
        this.fullName,
        this.currencyMin,
        this.name,
        this.alias,
        this.rounding,
        this.id,
        this.position,
        this.isMainCurrency,
        this.decimalPlaces});

  CurrencyData.fromJson(Map<String, dynamic>? json) {
    symbol = json?['symbol'];
    fullName = json?['full_name'];
    currencyMin = json?['currency_min'];
    name = json?['name'];
    alias = json?['alias'];
    rounding = json?['rounding'];
    id = json?['id'];
    position = json?['position'];
    isMainCurrency = json?['is_main_currency'];
    decimalPlaces = json?['decimal_places'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['symbol'] = symbol;
    data['full_name'] = fullName;
    data['currency_min'] = currencyMin;
    data['name'] = name;
    data['alias'] = alias;
    data['rounding'] = rounding;
    data['id'] = id;
    data['position'] = position;
    data['is_main_currency'] = isMainCurrency;
    data['decimal_places'] = decimalPlaces;
    return data;
  }
}
