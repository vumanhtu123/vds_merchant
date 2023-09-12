// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchant.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MerchantModel _$MerchantModelFromJson(Map<String, dynamic> json) =>
    MerchantModel(
      typeMerchant: json['typeMerchant'] as String?,
      fieldBusiness: json['fieldBusiness'] as String?,
      lisenseBusiness: json['lisenseBusiness'] as String?,
      codeMerchant: json['codeMerchant'] as String?,
      nameMerchant: json['nameMerchant'] as String?,
      phoneNumberMerchant: json['phoneNumberMerchant'] as String?,
      typeDocument: json['typeDocument'] as String?,
      idDocument: json['idDocument'] as String?,
      createDateDocument: json['createDateDocument'] as String?,
      endDateDocument: json['endDateDocument'] as String?,
      positionRegis: json['positionRegis'] as String?,
    );

Map<String, dynamic> _$MerchantModelToJson(MerchantModel instance) =>
    <String, dynamic>{
      'typeMerchant': instance.typeMerchant,
      'fieldBusiness': instance.fieldBusiness,
      'lisenseBusiness': instance.lisenseBusiness,
      'codeMerchant': instance.codeMerchant,
      'nameMerchant': instance.nameMerchant,
      'phoneNumberMerchant': instance.phoneNumberMerchant,
      'typeDocument': instance.typeDocument,
      'idDocument': instance.idDocument,
      'createDateDocument': instance.createDateDocument,
      'endDateDocument': instance.endDateDocument,
      'positionRegis': instance.positionRegis,
    };
