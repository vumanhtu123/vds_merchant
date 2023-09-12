// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvoiceResponse _$InvoiceResponseFromJson(Map<String, dynamic> json) =>
    InvoiceResponse(
      message: json['message'] as String?,
      traceId: json['traceId'] as String?,
      data: json['data'] == null
          ? null
          : InvoiceData.fromJson(json['data'] as Map<String, dynamic>),
      errorCodes: (json['errorCodes'] as List<dynamic>?)
          ?.map((e) => ErrorCode.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$InvoiceResponseToJson(InvoiceResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'traceId': instance.traceId,
      'data': instance.data,
      'errorCodes': instance.errorCodes,
    };

InvoiceData _$InvoiceDataFromJson(Map<String, dynamic> json) => InvoiceData(
      invoiceUUID: json['invoiceUUID'] as String?,
      invoiceId: json['invoiceId'] as int?,
      orderCode: json['orderCode'] as String?,
      invoiceCode: json['invoiceCode'] as String?,
      createdOrderDate: json['createdOrderDate'] as String?,
      paymentDate: json['paymentDate'] as String?,
      content: json['content'] as String?,
      originalPrice: (json['originalPrice'] as num?)?.toDouble(),
      discountedPrice: (json['discountedPrice'] as num?)?.toDouble(),
      customerName: json['customerName'] as String?,
      currency: json['currency'] as String?,
    )
      ..tax = (json['tax'] as num?)?.toDouble()
      ..totalPrice = (json['totalPrice'] as num?)?.toDouble()
      ..paymentStatus = json['paymentStatus'] as String?;

Map<String, dynamic> _$InvoiceDataToJson(InvoiceData instance) =>
    <String, dynamic>{
      'invoiceUUID': instance.invoiceUUID,
      'invoiceId': instance.invoiceId,
      'orderCode': instance.orderCode,
      'invoiceCode': instance.invoiceCode,
      'createdOrderDate': instance.createdOrderDate,
      'paymentDate': instance.paymentDate,
      'content': instance.content,
      'originalPrice': instance.originalPrice,
      'discountedPrice': instance.discountedPrice,
      'tax': instance.tax,
      'totalPrice': instance.totalPrice,
      'paymentStatus': instance.paymentStatus,
      'customerName': instance.customerName,
      'currency': instance.currency,
    };
