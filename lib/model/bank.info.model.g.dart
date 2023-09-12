// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank.info.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankInfoModel _$BankInfoModelFromJson(Map<String, dynamic> json) =>
    BankInfoModel(
      name: json['name'] as String?,
      number: json['number'] as String?,
      nameBank: json['nameBank'] as String?,
      nameBranch: json['nameBranch'] as String?,
    );

Map<String, dynamic> _$BankInfoModelToJson(BankInfoModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'number': instance.number,
      'nameBank': instance.nameBank,
      'nameBranch': instance.nameBranch,
    };
