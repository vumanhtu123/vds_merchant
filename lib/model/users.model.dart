import 'package:barcode/barcode.dart';
import 'package:json_annotation/json_annotation.dart';

part 'users.model.g.dart';

@JsonSerializable()
class Users {
  String? message;
  Data? data;

  Users({this.message, this.data});

  Users.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

@JsonSerializable()
class Data {
  String? merchantUUID;
  String? merchantType;
  String? businessSectorName;
  String? businessLicense;
  String? merchantPhone;
  String? merchantName;
  String? merchantCode;
  String? paperType;
  String? paperNumber;
  String? issuedDate;
  String? expiredDate;
  String? issuedPlace;
  String? address;
  String? qrCode;
  String? bankName;
  String? bankAccountName;
  String? bankAccountNumber;
  String? bankBrand;

  Data(
      {this.merchantUUID,
        this.merchantType,
        this.businessSectorName,
        this.businessLicense,
        this.merchantPhone,
        this.merchantName,
        this.merchantCode,
        this.paperType,
        this.paperNumber,
        this.issuedDate,
        this.expiredDate,
        this.issuedPlace,
        this.address,
        this.qrCode,
        this.bankName,
        this.bankAccountName,
        this.bankAccountNumber,
        this.bankBrand});

  String get barcodeString =>
      Barcode.qrCode().toSvg(merchantCode ?? '', width: 160, height: 160);

  String get merchantCodeHide => (merchantCode?.length ?? 0) > 8
      ? '${merchantCode!.substring(0, 3)}${merchantCode!.substring(3, merchantCode!.length - 3).replaceAll(RegExp(r'.'), '*')}${merchantCode!.substring(merchantCode!.length - 3, merchantCode!.length)}'
      : merchantCode!.replaceAll(RegExp(r'.'), '*');

  Data.fromJson(Map<String, dynamic> json) {
    merchantUUID = json['merchantUUID'];
    merchantType = json['merchantType'];
    businessSectorName = json['businessSectorName'];
    businessLicense = json['businessLicense'];
    merchantPhone = json['merchantPhone'];
    merchantName = json['merchantName'];
    merchantCode = json['merchantCode'];
    paperType = json['paperType'];
    paperNumber = json['paperNumber'];
    issuedDate = json['issuedDate'];
    expiredDate = json['expiredDate'];
    issuedPlace = json['issuedPlace'];
    address = json['address'];
    qrCode = json['qrCode'];
    bankName = json['bankName'];
    bankAccountName = json['bankAccountName'];
    bankAccountNumber = json['bankAccountNumber'];
    bankBrand = json['bankBrand'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['merchantUUID'] = merchantUUID;
    data['merchantType'] = merchantType;
    data['businessSectorName'] = businessSectorName;
    data['businessLicense'] = businessLicense;
    data['merchantPhone'] = merchantPhone;
    data['merchantName'] = merchantName;
    data['merchantCode'] = merchantCode;
    data['paperType'] = paperType;
    data['paperNumber'] = paperNumber;
    data['issuedDate'] = issuedDate;
    data['expiredDate'] = expiredDate;
    data['issuedPlace'] = issuedPlace;
    data['address'] = address;
    data['qrCode'] = qrCode;
    data['bankName'] = bankName;
    data['bankAccountName'] = bankAccountName;
    data['bankAccountNumber'] = bankAccountNumber;
    data['bankBrand'] = bankBrand;
    return data;
  }
}
