// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderResponse _$OrderResponseFromJson(Map<String, dynamic> json) =>
    OrderResponse(
      json['orders'] == null
          ? null
          : Orders.fromJson(json['orders'] as Map<String, dynamic>),
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : OrderData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderResponseToJson(OrderResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
      'orders': instance.orders,
    };

OrderData _$OrderDataFromJson(Map<String, dynamic> json) => OrderData(
      content: (json['content'] as List<dynamic>?)
          ?.map((e) => OrderContent.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrderDataToJson(OrderData instance) => <String, dynamic>{
      'content': instance.content,
    };

OrderContent _$OrderContentFromJson(Map<String, dynamic> json) => OrderContent(
      transactionUUID: json['transactionUUID'] as String?,
      transactionCode: json['transactionCode'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      createdDate: json['createdDate'] as String?,
      status: json['status'] as String?,
      staff: json['staff'] == null
          ? null
          : OrderStaff.fromJson(json['staff'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderContentToJson(OrderContent instance) =>
    <String, dynamic>{
      'transactionUUID': instance.transactionUUID,
      'transactionCode': instance.transactionCode,
      'price': instance.price,
      'createdDate': instance.createdDate,
      'status': instance.status,
      'staff': instance.staff,
    };

OrderStaff _$OrderStaffFromJson(Map<String, dynamic> json) => OrderStaff(
      staffUUID: json['staffUUID'] as String?,
      staffName: json['staffName'] as String?,
      qrCode: json['qrCode'] as String?,
    );

Map<String, dynamic> _$OrderStaffToJson(OrderStaff instance) =>
    <String, dynamic>{
      'staffUUID': instance.staffUUID,
      'staffName': instance.staffName,
      'qrCode': instance.qrCode,
    };

Orders _$OrdersFromJson(Map<String, dynamic> json) => Orders(
      orders: (json['orders'] as List<dynamic>?)
          ?.map((e) => OrderModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrdersToJson(Orders instance) => <String, dynamic>{
      'orders': instance.orders,
    };
