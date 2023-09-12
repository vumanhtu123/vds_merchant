import 'package:barcode/barcode.dart';
import 'package:json_annotation/json_annotation.dart';

part 'merchant_detail_response.g.dart';

@JsonSerializable()
class MerchantDetailResponse {
  String? message;
  String? traceId;
  Datas? data;

  MerchantDetailResponse({this.message, this.traceId, this.data});

  MerchantDetailResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    traceId = json['traceId'];
    data = json['data'] != null ? Datas.fromJson(json['data']) : null;
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
class Datas {
  String? merchantUUID;
  String? merchantType;
  String? accountId;
  BusinessSector? businessSector;
  String? businessLicense;
  String? merchantPhone;
  String? merchantName;
  String? merchantCode;
  String? paperType;
  String? paperNumber;
  String? issuedDate;
  String? expiredDate;
  String? issuedPlace;
  Province? province;
  Province? district;
  Province? precinct;
  String? address;
  String? qrCode;
  Bank? bank;
  String? bankAccountName;
  String? bankAccountNo;
  String? bankBranch;
  String? status;
  String? email;
  String? gender;
  String? createdAt;

  Datas(
      {this.merchantUUID,
        this.merchantType,
        this.accountId,
        this.businessSector,
        this.businessLicense,
        this.merchantPhone,
        this.merchantName,
        this.merchantCode,
        this.paperType,
        this.paperNumber,
        this.issuedDate,
        this.expiredDate,
        this.issuedPlace,
        this.province,
        this.district,
        this.precinct,
        this.address,
        this.qrCode,
        this.bank,
        this.bankAccountName,
        this.bankAccountNo,
        this.bankBranch,
        this.status,
        this.email,
        this.gender,
        this.createdAt});

  Datas.fromJson(Map<String, dynamic> json) {
    merchantUUID = json['merchantUUID'];
    merchantType = json['merchantType'];
    accountId = json['accountId'];
    businessSector = json['businessSector'] != null
        ? BusinessSector.fromJson(json['businessSector'])
        : null;
    businessLicense = json['businessLicense'];
    merchantPhone = json['merchantPhone'];
    merchantName = json['merchantName'];
    merchantCode = json['merchantCode'];
    paperType = json['paperType'];
    paperNumber = json['paperNumber'];
    issuedDate = json['issuedDate'];
    expiredDate = json['expiredDate'];
    issuedPlace = json['issuedPlace'];
    province = json['province'] != null
        ? Province.fromJson(json['province'])
        : null;
    district = json['district'] != null
        ? Province.fromJson(json['district'])
        : null;
    precinct = json['precinct'] != null
        ? Province.fromJson(json['precinct'])
        : null;
    address = json['address'];
    qrCode = json['qrCode'];
    bank = json['bank'] != null ? Bank.fromJson(json['bank']) : null;
    bankAccountName = json['bankAccountName'];
    bankAccountNo = json['bankAccountNo'];
    bankBranch = json['bankBranch'];
    status = json['status'];
    email = json['email'];
    gender = json['gender'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['merchantUUID'] = merchantUUID;
    data['merchantType'] = merchantType;
    data['accountId'] = accountId;
    if (businessSector != null) {
      data['businessSector'] = businessSector!.toJson();
    }
    data['businessLicense'] = businessLicense;
    data['merchantPhone'] = merchantPhone;
    data['merchantName'] = merchantName;
    data['merchantCode'] = merchantCode;
    data['paperType'] = paperType;
    data['paperNumber'] = paperNumber;
    data['issuedDate'] = issuedDate;
    data['expiredDate'] = expiredDate;
    data['issuedPlace'] = issuedPlace;
    if (province != null) {
      data['province'] = province!.toJson();
    }
    if (district != null) {
      data['district'] = district!.toJson();
    }
    if (precinct != null) {
      data['precinct'] = precinct!.toJson();
    }
    data['address'] = address;
    data['qrCode'] = qrCode;
    if (bank != null) {
      data['bank'] = bank!.toJson();
    }
    data['bankAccountName'] = bankAccountName;
    data['bankAccountNo'] = bankAccountNo;
    data['bankBranch'] = bankBranch;
    data['status'] = status;
    data['email'] = email;
    data['gender'] = gender;
    data['createdAt'] = createdAt;
    return data;
  }
}

@JsonSerializable()
class BusinessSector {
  String? businessSectorUUID;
  String? businessSectorName;

  BusinessSector({this.businessSectorUUID, this.businessSectorName});

  BusinessSector.fromJson(Map<String, dynamic> json) {
    businessSectorUUID = json['businessSectorUUID'];
    businessSectorName = json['businessSectorName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['businessSectorUUID'] = businessSectorUUID;
    data['businessSectorName'] = businessSectorName;
    return data;
  }
}

@JsonSerializable()
class Province {
  String? areaCode;
  String? areaName;

  Province({this.areaCode, this.areaName});

  Province.fromJson(Map<String, dynamic> json) {
    areaCode = json['areaCode'];
    areaName = json['areaName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['areaCode'] = areaCode;
    data['areaName'] = areaName;
    return data;
  }
}

@JsonSerializable()
class Bank {
  int? bankId;
  String? bankName;

  Bank({this.bankId, this.bankName});

  Bank.fromJson(Map<String, dynamic> json) {
    bankId = json['bankId'];
    bankName = json['bankName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bankId'] = bankId;
    data['bankName'] = bankName;
    return data;
  }
}
