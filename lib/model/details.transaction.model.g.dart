// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details.transaction.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailsTransactionModel _$DetailsTransactionModelFromJson(
        Map<String, dynamic> json) =>
    DetailsTransactionModel(
      message: json['message'] as String?,
      traceId: json['traceId'] as String?,
      data: json['data'] == null
          ? null
          : DataTransaction.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DetailsTransactionModelToJson(
        DetailsTransactionModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'traceId': instance.traceId,
      'data': instance.data,
    };

DataTransaction _$DataTransactionFromJson(Map<String, dynamic> json) =>
    DataTransaction(
      transactionUUID: json['transactionUUID'] as String?,
      customerName: json['customerName'] as String?,
      content: json['content'] as String?,
      transactionId: json['transactionId'] as int?,
      orderUUID: json['orderUUID'] as String?,
      orderCode: json['orderCode'] as String?,
      invoiceUUID: json['invoiceUUID'] as String?,
      total: json['total'] as num?,
      discount: json['discount'] as num?,
      amount: json['amount'] as num?,
      currency: json['currency'] as String?,
      status: json['status'] as String?,
      paymentDate: json['paymentDate'] as String?,
      orderDate: json['orderDate'] as String?,
    );

Map<String, dynamic> _$DataTransactionToJson(DataTransaction instance) =>
    <String, dynamic>{
      'transactionUUID': instance.transactionUUID,
      'customerName': instance.customerName,
      'content': instance.content,
      'transactionId': instance.transactionId,
      'orderUUID': instance.orderUUID,
      'orderCode': instance.orderCode,
      'invoiceUUID': instance.invoiceUUID,
      'total': instance.total,
      'discount': instance.discount,
      'amount': instance.amount,
      'currency': instance.currency,
      'status': instance.status,
      'paymentDate': instance.paymentDate,
      'orderDate': instance.orderDate,
    };
