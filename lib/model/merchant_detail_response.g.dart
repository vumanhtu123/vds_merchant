// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchant_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MerchantDetailResponse _$MerchantDetailResponseFromJson(
        Map<String, dynamic> json) =>
    MerchantDetailResponse(
      message: json['message'] as String?,
      traceId: json['traceId'] as String?,
      data: json['data'] == null
          ? null
          : Datas.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MerchantDetailResponseToJson(
        MerchantDetailResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'traceId': instance.traceId,
      'data': instance.data,
    };

Datas _$DatasFromJson(Map<String, dynamic> json) => Datas(
      merchantUUID: json['merchantUUID'] as String?,
      merchantType: json['merchantType'] as String?,
      accountId: json['accountId'] as String?,
      businessSector: json['businessSector'] == null
          ? null
          : BusinessSector.fromJson(
              json['businessSector'] as Map<String, dynamic>),
      businessLicense: json['businessLicense'] as String?,
      merchantPhone: json['merchantPhone'] as String?,
      merchantName: json['merchantName'] as String?,
      merchantCode: json['merchantCode'] as String?,
      paperType: json['paperType'] as String?,
      paperNumber: json['paperNumber'] as String?,
      issuedDate: json['issuedDate'] as String?,
      expiredDate: json['expiredDate'] as String?,
      issuedPlace: json['issuedPlace'] as String?,
      province: json['province'] == null
          ? null
          : Province.fromJson(json['province'] as Map<String, dynamic>),
      district: json['district'] == null
          ? null
          : Province.fromJson(json['district'] as Map<String, dynamic>),
      precinct: json['precinct'] == null
          ? null
          : Province.fromJson(json['precinct'] as Map<String, dynamic>),
      address: json['address'] as String?,
      qrCode: json['qrCode'] as String?,
      bank: json['bank'] == null
          ? null
          : Bank.fromJson(json['bank'] as Map<String, dynamic>),
      bankAccountName: json['bankAccountName'] as String?,
      bankAccountNo: json['bankAccountNo'] as String?,
      bankBranch: json['bankBranch'] as String?,
      status: json['status'] as String?,
      email: json['email'] as String?,
      gender: json['gender'] as String?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$DatasToJson(Datas instance) => <String, dynamic>{
      'merchantUUID': instance.merchantUUID,
      'merchantType': instance.merchantType,
      'accountId': instance.accountId,
      'businessSector': instance.businessSector,
      'businessLicense': instance.businessLicense,
      'merchantPhone': instance.merchantPhone,
      'merchantName': instance.merchantName,
      'merchantCode': instance.merchantCode,
      'paperType': instance.paperType,
      'paperNumber': instance.paperNumber,
      'issuedDate': instance.issuedDate,
      'expiredDate': instance.expiredDate,
      'issuedPlace': instance.issuedPlace,
      'province': instance.province,
      'district': instance.district,
      'precinct': instance.precinct,
      'address': instance.address,
      'qrCode': instance.qrCode,
      'bank': instance.bank,
      'bankAccountName': instance.bankAccountName,
      'bankAccountNo': instance.bankAccountNo,
      'bankBranch': instance.bankBranch,
      'status': instance.status,
      'email': instance.email,
      'gender': instance.gender,
      'createdAt': instance.createdAt,
    };

BusinessSector _$BusinessSectorFromJson(Map<String, dynamic> json) =>
    BusinessSector(
      businessSectorUUID: json['businessSectorUUID'] as String?,
      businessSectorName: json['businessSectorName'] as String?,
    );

Map<String, dynamic> _$BusinessSectorToJson(BusinessSector instance) =>
    <String, dynamic>{
      'businessSectorUUID': instance.businessSectorUUID,
      'businessSectorName': instance.businessSectorName,
    };

Province _$ProvinceFromJson(Map<String, dynamic> json) => Province(
      areaCode: json['areaCode'] as String?,
      areaName: json['areaName'] as String?,
    );

Map<String, dynamic> _$ProvinceToJson(Province instance) => <String, dynamic>{
      'areaCode': instance.areaCode,
      'areaName': instance.areaName,
    };

Bank _$BankFromJson(Map<String, dynamic> json) => Bank(
      bankId: json['bankId'] as int?,
      bankName: json['bankName'] as String?,
    );

Map<String, dynamic> _$BankToJson(Bank instance) => <String, dynamic>{
      'bankId': instance.bankId,
      'bankName': instance.bankName,
    };
