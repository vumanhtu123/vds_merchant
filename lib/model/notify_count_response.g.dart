// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notify_count_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotifyCountResponse _$NotifyCountResponseFromJson(Map<String, dynamic> json) =>
    NotifyCountResponse(
      message: json['message'] as String?,
      traceId: json['traceId'] as String?,
      data: json['data'] == null
          ? null
          : NotifyCountData.fromJson(json['data'] as Map<String, dynamic>),
      errorCodes: (json['errorCodes'] as List<dynamic>?)
          ?.map((e) => ErrorCode.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NotifyCountResponseToJson(
        NotifyCountResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'traceId': instance.traceId,
      'data': instance.data,
      'errorCodes': instance.errorCodes,
    };

NotifyCountData _$NotifyCountDataFromJson(Map<String, dynamic> json) =>
    NotifyCountData(
      count: json['count'] as int?,
    );

Map<String, dynamic> _$NotifyCountDataToJson(NotifyCountData instance) =>
    <String, dynamic>{
      'count': instance.count,
    };
