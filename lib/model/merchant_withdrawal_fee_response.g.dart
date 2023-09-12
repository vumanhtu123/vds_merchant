// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchant_withdrawal_fee_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MerchantWithdrawalFeeResponse _$MerchantWithdrawalFeeResponseFromJson(
        Map<String, dynamic> json) =>
    MerchantWithdrawalFeeResponse(
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : MerchantWithdrawalFeeData.fromJson(
              json['data'] as Map<String, dynamic>),
      traceId: json['traceId'] as String?,
    );

Map<String, dynamic> _$MerchantWithdrawalFeeResponseToJson(
        MerchantWithdrawalFeeResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
      'traceId': instance.traceId,
    };

MerchantWithdrawalFeeData _$MerchantWithdrawalFeeDataFromJson(
        Map<String, dynamic> json) =>
    MerchantWithdrawalFeeData(
      feeAmount: (json['feeAmount'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$MerchantWithdrawalFeeDataToJson(
        MerchantWithdrawalFeeData instance) =>
    <String, dynamic>{
      'feeAmount': instance.feeAmount,
    };
