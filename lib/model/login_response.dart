import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';

import 'error_code.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {

  String? message;
  int? code;
  String? traceId;
  LoginData? data;
  List<ErrorCode>? errorCodes;

  LoginResponse({this.message, this.traceId, this.data, this.errorCodes});

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);

  String errorMessage() =>
      (errorCodes ?? []).firstWhereOrNull((e) => e.message != null)?.message ??
      (message ?? "");

  int errorCode() =>
      (errorCodes ?? []).firstWhereOrNull((e) => e.code != null)?.code ??
      (code ?? 0);
}

@JsonSerializable()
class LoginData {

  @JsonKey(name: 'invalid_grant')
  String? invalidGrant;

  @JsonKey(name: 'error_description')
  String? errorDescription;

  @JsonKey(name: 'access_token')
  String? accessToken;

  @JsonKey(name: 'token_type')
  String? tokenType;

  @JsonKey(name: 'refresh_token')
  String? refreshToken;

  String? scope, jti;

  @JsonKey(name: 'expires_in')
  int? expiresIn;

  int? iat, id;

  LoginData({this.accessToken, this.tokenType, this.refreshToken,
    this.scope, this.jti, this.expiresIn, this.iat, this.id});

  factory LoginData.fromJson(Map<String, dynamic> json) =>
      _$LoginDataFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDataToJson(this);
}