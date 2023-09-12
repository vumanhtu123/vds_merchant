// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_pin_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckPinResponse _$CheckPinResponseFromJson(Map<String, dynamic> json) =>
    CheckPinResponse(
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : CheckPinData.fromJson(json['data'] as Map<String, dynamic>),
      error: json['error'] as String?,
    );

Map<String, dynamic> _$CheckPinResponseToJson(CheckPinResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'error': instance.error,
      'data': instance.data,
    };

CheckPinData _$CheckPinDataFromJson(Map<String, dynamic> json) => CheckPinData(
      isRegistered: json['isRegistered'] as bool?,
    );

Map<String, dynamic> _$CheckPinDataToJson(CheckPinData instance) =>
    <String, dynamic>{
      'isRegistered': instance.isRegistered,
    };
