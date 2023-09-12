// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchant_balance_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MerchantBalanceResponse _$MerchantBalanceResponseFromJson(
        Map<String, dynamic> json) =>
    MerchantBalanceResponse(
      (json['errorCodes'] as List<dynamic>?)
          ?.map((e) => ErrorCode.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : MerchantBalanceData.fromJson(json['data'] as Map<String, dynamic>),
      traceId: json['traceId'] as String?,
    );

Map<String, dynamic> _$MerchantBalanceResponseToJson(
        MerchantBalanceResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
      'traceId': instance.traceId,
      'errorCodes': instance.errorCodes,
    };

MerchantBalanceData _$MerchantBalanceDataFromJson(Map<String, dynamic> json) =>
    MerchantBalanceData(
      currency: json['currency'] as String?,
      amount: (json['amount'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$MerchantBalanceDataToJson(
        MerchantBalanceData instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'currency': instance.currency,
    };
