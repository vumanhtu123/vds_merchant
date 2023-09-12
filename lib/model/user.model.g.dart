// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      merchantCode: json['merchantCode'] as String?,
      merchantName: json['merchantName'] as String?,
      id: json['id'] as String?,
      name: json['name'] as String?,
      merchant: json['merchant'] == null
          ? null
          : MerchantModel.fromJson(json['merchant'] as Map<String, dynamic>),
      bankInfo: json['bankInfo'] == null
          ? null
          : BankInfoModel.fromJson(json['bankInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'merchant': instance.merchant,
      'bankInfo': instance.bankInfo,
      'merchantCode': instance.merchantCode,
      'merchantName': instance.merchantName,
    };
