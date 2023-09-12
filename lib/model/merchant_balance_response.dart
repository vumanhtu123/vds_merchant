import 'package:json_annotation/json_annotation.dart';
import 'error_code.dart';

part 'merchant_balance_response.g.dart';

@JsonSerializable()
class MerchantBalanceResponse {
  final String? message;
  final MerchantBalanceData? data;
  final String? traceId;
  final List<ErrorCode>? errorCodes;

  MerchantBalanceResponse(this.errorCodes,
      {this.message, this.data, this.traceId});

  factory MerchantBalanceResponse.fromJson(Map<String, dynamic> json) =>
      _$MerchantBalanceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MerchantBalanceResponseToJson(this);
}

@JsonSerializable()
class MerchantBalanceData {
  final double? amount;
  final String? currency;

  MerchantBalanceData({
    this.currency,
    this.amount,
  });

  factory MerchantBalanceData.fromJson(Map<String, dynamic> json) =>
      _$MerchantBalanceDataFromJson(json);

  Map<String, dynamic> toJson() => _$MerchantBalanceDataToJson(this);
}
