import 'package:json_annotation/json_annotation.dart';
import 'package:vds/base/base_model.dart';

part 'merchant_withdrawal_fee_response.g.dart';

@JsonSerializable()
class MerchantWithdrawalFeeResponse {
  final String? message;
  final MerchantWithdrawalFeeData? data;
  final String? traceId;

  MerchantWithdrawalFeeResponse({
    this.message,
    this.data,
    this.traceId
  });

  factory MerchantWithdrawalFeeResponse.fromJson(Map<String, dynamic> json) =>
      _$MerchantWithdrawalFeeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MerchantWithdrawalFeeResponseToJson(this);
}

@JsonSerializable()
class MerchantWithdrawalFeeData {
  final double? feeAmount;

  MerchantWithdrawalFeeData({
    this.feeAmount,
  });

  factory MerchantWithdrawalFeeData.fromJson(Map<String, dynamic> json) =>
      _$MerchantWithdrawalFeeDataFromJson(json);

  Map<String, dynamic> toJson() => _$MerchantWithdrawalFeeDataToJson(this);
}