// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info.staff.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InfoStaff _$InfoStaffFromJson(Map<String, dynamic> json) => InfoStaff(
      message: json['message'] as String?,
      traceId: json['traceId'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InfoStaffToJson(InfoStaff instance) => <String, dynamic>{
      'message': instance.message,
      'traceId': instance.traceId,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      staffUUID: json['staffUUID'] as String?,
      staffCode: json['staffCode'] as String?,
      fullName: json['fullName'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      email: json['email'] as String?,
      qrCode: json['qrCode'] as String?,
      merchant: json['merchant'] == null
          ? null
          : Merchant.fromJson(json['merchant'] as Map<String, dynamic>),
      subMerchant: json['subMerchant'] == null
          ? null
          : SubMerchant.fromJson(json['subMerchant'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'staffUUID': instance.staffUUID,
      'staffCode': instance.staffCode,
      'fullName': instance.fullName,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'qrCode': instance.qrCode,
      'merchant': instance.merchant,
      'subMerchant': instance.subMerchant,
    };

Merchant _$MerchantFromJson(Map<String, dynamic> json) => Merchant(
      merchantUUID: json['merchantUUID'] as String?,
      merchantName: json['merchantName'] as String?,
      merchantCode: json['merchantCode'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$MerchantToJson(Merchant instance) => <String, dynamic>{
      'merchantUUID': instance.merchantUUID,
      'merchantName': instance.merchantName,
      'merchantCode': instance.merchantCode,
      'phoneNumber': instance.phoneNumber,
      'address': instance.address,
    };

SubMerchant _$SubMerchantFromJson(Map<String, dynamic> json) => SubMerchant(
      subMerchantUUID: json['subMerchantUUID'] as String?,
      subMerchantCode: json['subMerchantCode'] as String?,
      subMerchantName: json['subMerchantName'] as String?,
      subMerchantPhone: json['subMerchantPhone'] as String?,
      address: json['address'] as String?,
      numberOfStaff: json['numberOfStaff'] as int?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$SubMerchantToJson(SubMerchant instance) =>
    <String, dynamic>{
      'subMerchantUUID': instance.subMerchantUUID,
      'subMerchantCode': instance.subMerchantCode,
      'subMerchantName': instance.subMerchantName,
      'subMerchantPhone': instance.subMerchantPhone,
      'address': instance.address,
      'numberOfStaff': instance.numberOfStaff,
      'description': instance.description,
    };
