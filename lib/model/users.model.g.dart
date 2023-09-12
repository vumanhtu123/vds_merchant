// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Users _$UsersFromJson(Map<String, dynamic> json) => Users(
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UsersToJson(Users instance) => <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      merchantUUID: json['merchantUUID'] as String?,
      merchantType: json['merchantType'] as String?,
      businessSectorName: json['businessSectorName'] as String?,
      businessLicense: json['businessLicense'] as String?,
      merchantPhone: json['merchantPhone'] as String?,
      merchantName: json['merchantName'] as String?,
      merchantCode: json['merchantCode'] as String?,
      paperType: json['paperType'] as String?,
      paperNumber: json['paperNumber'] as String?,
      issuedDate: json['issuedDate'] as String?,
      expiredDate: json['expiredDate'] as String?,
      issuedPlace: json['issuedPlace'] as String?,
      address: json['address'] as String?,
      qrCode: json['qrCode'] as String?,
      bankName: json['bankName'] as String?,
      bankAccountName: json['bankAccountName'] as String?,
      bankAccountNumber: json['bankAccountNumber'] as String?,
      bankBrand: json['bankBrand'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'merchantUUID': instance.merchantUUID,
      'merchantType': instance.merchantType,
      'businessSectorName': instance.businessSectorName,
      'businessLicense': instance.businessLicense,
      'merchantPhone': instance.merchantPhone,
      'merchantName': instance.merchantName,
      'merchantCode': instance.merchantCode,
      'paperType': instance.paperType,
      'paperNumber': instance.paperNumber,
      'issuedDate': instance.issuedDate,
      'expiredDate': instance.expiredDate,
      'issuedPlace': instance.issuedPlace,
      'address': instance.address,
      'qrCode': instance.qrCode,
      'bankName': instance.bankName,
      'bankAccountName': instance.bankAccountName,
      'bankAccountNumber': instance.bankAccountNumber,
      'bankBrand': instance.bankBrand,
    };
