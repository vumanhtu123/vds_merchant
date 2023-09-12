// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_policy_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WalletPolicyResponse _$WalletPolicyResponseFromJson(
        Map<String, dynamic> json) =>
    WalletPolicyResponse(
      message: json['message'] as String?,
      traceId: json['traceId'] as String?,
      data: json['data'] == null
          ? null
          : WalletPolicyData.fromJson(json['data'] as Map<String, dynamic>),
      errorCodes: (json['errorCodes'] as List<dynamic>?)
          ?.map((e) => ErrorCode.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WalletPolicyResponseToJson(
        WalletPolicyResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'traceId': instance.traceId,
      'data': instance.data,
      'errorCodes': instance.errorCodes,
    };

WalletPolicyData _$WalletPolicyDataFromJson(Map<String, dynamic> json) =>
    WalletPolicyData()
      ..withDrawlPolicy = (json['withDrawlPolicy'] as List<dynamic>?)
          ?.map((e) => WithDrawlPolicy.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$WalletPolicyDataToJson(WalletPolicyData instance) =>
    <String, dynamic>{
      'withDrawlPolicy': instance.withDrawlPolicy,
    };

WithDrawlPolicy _$WithDrawlPolicyFromJson(Map<String, dynamic> json) =>
    WithDrawlPolicy()
      ..description = json['description'] as String?
      ..operator = json['operator'] as String?
      ..currency = json['currency'] as String?
      ..valueType = json['valueType'] as String?
      ..value = json['value'] as String?;

Map<String, dynamic> _$WithDrawlPolicyToJson(WithDrawlPolicy instance) =>
    <String, dynamic>{
      'description': instance.description,
      'operator': instance.operator,
      'currency': instance.currency,
      'valueType': instance.valueType,
      'value': instance.value,
    };
