// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info.revoke.success.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankInfoSuccess _$BankInfoSuccessFromJson(Map<String, dynamic> json) =>
    BankInfoSuccess(
      message: json['message'] as String?,
      traceId: json['traceId'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BankInfoSuccessToJson(BankInfoSuccess instance) =>
    <String, dynamic>{
      'message': instance.message,
      'traceId': instance.traceId,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      transactionId: json['transactionId'] as int?,
      requestDate: json['requestDate'] as String?,
      value: (json['value'] as num?)?.toDouble(),
      currency: json['currency'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'transactionId': instance.transactionId,
      'requestDate': instance.requestDate,
      'value': instance.value,
      'currency': instance.currency,
    };
