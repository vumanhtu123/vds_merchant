import 'package:json_annotation/json_annotation.dart';
part 'info.staff.model.g.dart';

@JsonSerializable()
class InfoStaff {
  String? message;
  String? traceId;
  Data? data;

  InfoStaff({this.message, this.traceId, this.data});

  InfoStaff.fromJson(Map<String, dynamic> json) {
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
  String? staffUUID;
  String? staffCode;
  String? fullName;
  String? phoneNumber;
  String? email;
  String? qrCode;
  Merchant? merchant;
  SubMerchant? subMerchant;

  Data(
      {this.staffUUID,
        this.staffCode,
        this.fullName,
        this.phoneNumber,
        this.email,
        this.qrCode,
        this.merchant,
        this.subMerchant});

  Data.fromJson(Map<String, dynamic> json) {
    staffUUID = json['staffUUID'];
    staffCode = json['staffCode'];
    fullName = json['fullName'];
    phoneNumber = json['phoneNumber'];
    email = json['email'];
    qrCode = json['qrCode'];
    merchant = json['merchant'] != null
        ? Merchant.fromJson(json['merchant'])
        : null;
    subMerchant = json['subMerchant'] != null
        ? SubMerchant.fromJson(json['subMerchant'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['staffUUID'] = staffUUID;
    data['staffCode'] = staffCode;
    data['fullName'] = fullName;
    data['phoneNumber'] = phoneNumber;
    data['email'] = email;
    data['qrCode'] = qrCode;
    if (merchant != null) {
      data['merchant'] = merchant!.toJson();
    }
    if (subMerchant != null) {
      data['subMerchant'] = subMerchant!.toJson();
    }
    return data;
  }
}

@JsonSerializable()
class Merchant {
  String? merchantUUID;
  String? merchantName;
  String? merchantCode;
  String? phoneNumber;
  String? address;

  Merchant(
      {this.merchantUUID,
        this.merchantName,
        this.merchantCode,
        this.phoneNumber,
        this.address});

  Merchant.fromJson(Map<String, dynamic> json) {
    merchantUUID = json['merchantUUID'];
    merchantName = json['merchantName'];
    merchantCode = json['merchantCode'];
    phoneNumber = json['phoneNumber'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['merchantUUID'] = merchantUUID;
    data['merchantName'] = merchantName;
    data['merchantCode'] = merchantCode;
    data['phoneNumber'] = phoneNumber;
    data['address'] = address;
    return data;
  }
}

@JsonSerializable()
class SubMerchant {
  String? subMerchantUUID;
  String? subMerchantCode;
  String? subMerchantName;
  String? subMerchantPhone;
  String? address;
  int? numberOfStaff;
  String? description;

  SubMerchant(
      {this.subMerchantUUID,
        this.subMerchantCode,
        this.subMerchantName,
        this.subMerchantPhone,
        this.address,
        this.numberOfStaff,
        this.description});

  SubMerchant.fromJson(Map<String, dynamic> json) {
    subMerchantUUID = json['subMerchantUUID'];
    subMerchantCode = json['subMerchantCode'];
    subMerchantName = json['subMerchantName'];
    subMerchantPhone = json['subMerchantPhone'];
    address = json['address'];
    numberOfStaff = json['numberOfStaff'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['subMerchantUUID'] = subMerchantUUID;
    data['subMerchantCode'] = subMerchantCode;
    data['subMerchantName'] = subMerchantName;
    data['subMerchantPhone'] = subMerchantPhone;
    data['address'] = address;
    data['numberOfStaff'] = numberOfStaff;
    data['description'] = description;
    return data;
  }
}

