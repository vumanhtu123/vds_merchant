// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.create.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrdersResponse _$OrdersResponseFromJson(Map<String, dynamic> json) =>
    OrdersResponse(
      message: json['message'] as String?,
      traceId: json['traceId'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    )..errorCodes = (json['errorCodes'] as List<dynamic>?)
        ?.map((e) => ErrorCodes.fromJson(e as Map<String, dynamic>))
        .toList();

Map<String, dynamic> _$OrdersResponseToJson(OrdersResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'traceId': instance.traceId,
      'data': instance.data,
      'errorCodes': instance.errorCodes,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      orderUUID: json['orderUUID'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'orderUUID': instance.orderUUID,
    };

ErrorCodes _$ErrorCodesFromJson(Map<String, dynamic> json) => ErrorCodes(
      code: json['code'] as int?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ErrorCodesToJson(ErrorCodes instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };
