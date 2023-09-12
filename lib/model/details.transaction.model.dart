import 'package:json_annotation/json_annotation.dart';

part 'details.transaction.model.g.dart';

@JsonSerializable()
class DetailsTransactionModel {
  String? message;
  String? traceId;
  DataTransaction? data;

  DetailsTransactionModel({this.message, this.traceId, this.data});

  DetailsTransactionModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    traceId = json['traceId'];
    data = json['data'] != null ? DataTransaction.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['traceId'] = traceId;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

@JsonSerializable()
class DataTransaction {
  String? transactionUUID;
  String? customerName;
  String? content;
  int? transactionId;
  String? orderUUID;
  String? orderCode;
  String? invoiceUUID;
  num? total;
  num? discount;
  num? amount;
  String? currency;
  String? status;
  String? paymentDate;
  String? orderDate;

  DataTransaction(
      {this.transactionUUID,
      this.customerName,
      this.content,
      this.transactionId,
      this.orderUUID,
      this.orderCode,
      this.invoiceUUID,
      this.total,
      this.discount,
      this.amount,
      this.currency,
      this.status,
      this.paymentDate,
      this.orderDate});

  DataTransaction.fromJson(Map<String, dynamic> json) {
    transactionUUID = json['transactionUUID'];
    customerName = json['customerName'];
    content = json['content'];
    transactionId = json['transactionId'];
    orderUUID = json['orderUUID'];
    orderCode = json['orderCode'];
    invoiceUUID = json['invoiceUUID'];
    total = json['total'];
    discount = json['discount'];
    amount = json['amount'];
    status = json['status'];
    paymentDate = json['paymentDate'];
    orderDate = json['orderDate'];
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['transactionUUID'] = transactionUUID;
    data['customerName'] = customerName;
    data['content'] = content;
    data['transactionId'] = transactionId;
    data['orderUUID'] = orderUUID;
    data['orderCode'] = orderCode;
    data['invoiceUUID'] = invoiceUUID;
    data['total'] = total;
    data['discount'] = discount;
    data['amount'] = amount;
    data['status'] = status;
    data['paymentDate'] = paymentDate;
    data['orderDate'] = orderDate;
    data['currency'] = currency;
    return data;
  }
}
