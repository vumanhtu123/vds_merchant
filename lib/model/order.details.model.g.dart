// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.details.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderDetails _$OrderDetailsFromJson(Map<String, dynamic> json) => OrderDetails(
      message: json['message'] as String?,
      traceId: json['traceId'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderDetailsToJson(OrderDetails instance) =>
    <String, dynamic>{
      'message': instance.message,
      'traceId': instance.traceId,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      orderUUID: json['orderUUID'] as String?,
      showQR: json['showQR'] as bool?,
      orderCode: json['orderCode'] as String?,
      expireTime: json['expireTime'] as int?,
      qrCode: json['qrCode'] as String?,
      customerName: json['customerName'] as String?,
      content: json['content'] as String?,
      originalPrice: json['originalPrice'] as num?,
      status: json['status'] as String?,
      staff: json['staff'] == null
          ? null
          : Staff.fromJson(json['staff'] as Map<String, dynamic>),
      createdDate: json['createdDate'] as String?,
      currency: json['currency'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'orderUUID': instance.orderUUID,
      'orderCode': instance.orderCode,
      'expireTime': instance.expireTime,
      'qrCode': instance.qrCode,
      'customerName': instance.customerName,
      'content': instance.content,
      'originalPrice': instance.originalPrice,
      'status': instance.status,
      'currency': instance.currency,
      'staff': instance.staff,
      'createdDate': instance.createdDate,
      'showQR': instance.showQR,
    };

Staff _$StaffFromJson(Map<String, dynamic> json) => Staff(
      staffUUID: json['staffUUID'] as String?,
      staffCode: json['staffCode'] as String?,
      fullName: json['fullName'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      email: json['email'] as String?,
      qrCode: json['qrCode'] as String?,
      merchant: json['merchant'] as String?,
    );

Map<String, dynamic> _$StaffToJson(Staff instance) => <String, dynamic>{
      'staffUUID': instance.staffUUID,
      'staffCode': instance.staffCode,
      'fullName': instance.fullName,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'qrCode': instance.qrCode,
      'merchant': instance.merchant,
    };
