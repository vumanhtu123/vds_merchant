import 'package:json_annotation/json_annotation.dart';

import 'error_code.dart';
part 'wallet_policy_response.g.dart';

@JsonSerializable()
class WalletPolicyResponse {

  String? message;
  String? traceId;
  WalletPolicyData? data;
  List<ErrorCode>? errorCodes;

  WalletPolicyResponse({this.message, this.traceId, this.data, this.errorCodes});

  factory WalletPolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$WalletPolicyResponseFromJson(json);

  Map<String, dynamic> toJson() => _$WalletPolicyResponseToJson(this);
}

@JsonSerializable()
class WalletPolicyData {

  List<WithDrawlPolicy>? withDrawlPolicy;

  WalletPolicyData();

  factory WalletPolicyData.fromJson(Map<String, dynamic> json) =>
      _$WalletPolicyDataFromJson(json);

  Map<String, dynamic> toJson() => _$WalletPolicyDataToJson(this);
}

@JsonSerializable()
class WithDrawlPolicy {

  String? description;
  String? operator;
  String? currency;
  String? valueType;
  String? value;

  WithDrawlPolicy();

  factory WithDrawlPolicy.fromJson(Map<String, dynamic> json) =>
      _$WithDrawlPolicyFromJson(json);

  Map<String, dynamic> toJson() => _$WithDrawlPolicyToJson(this);
}

// ruleId:11,
// orderRule:1,
