// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      message: json['message'] as String?,
      traceId: json['traceId'] as String?,
      data: json['data'] == null
          ? null
          : LoginData.fromJson(json['data'] as Map<String, dynamic>),
      errorCodes: (json['errorCodes'] as List<dynamic>?)
          ?.map((e) => ErrorCode.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..code = json['code'] as int?;

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'traceId': instance.traceId,
      'data': instance.data,
      'errorCodes': instance.errorCodes,
    };

LoginData _$LoginDataFromJson(Map<String, dynamic> json) => LoginData(
      accessToken: json['access_token'] as String?,
      tokenType: json['token_type'] as String?,
      refreshToken: json['refresh_token'] as String?,
      scope: json['scope'] as String?,
      jti: json['jti'] as String?,
      expiresIn: json['expires_in'] as int?,
      iat: json['iat'] as int?,
      id: json['id'] as int?,
    )
      ..invalidGrant = json['invalid_grant'] as String?
      ..errorDescription = json['error_description'] as String?;

Map<String, dynamic> _$LoginDataToJson(LoginData instance) => <String, dynamic>{
      'invalid_grant': instance.invalidGrant,
      'error_description': instance.errorDescription,
      'access_token': instance.accessToken,
      'token_type': instance.tokenType,
      'refresh_token': instance.refreshToken,
      'scope': instance.scope,
      'jti': instance.jti,
      'expires_in': instance.expiresIn,
      'iat': instance.iat,
      'id': instance.id,
    };
