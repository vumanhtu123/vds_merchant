import 'package:json_annotation/json_annotation.dart';
import 'error_code.dart';
part 'invoice_response.g.dart';

@JsonSerializable()
class InvoiceResponse {

  String? message;
  String? traceId;
  InvoiceData? data;
  List<ErrorCode>? errorCodes;

  InvoiceResponse({this.message, this.traceId, this.data, this.errorCodes});

  factory InvoiceResponse.fromJson(Map<String, dynamic> json) =>
      _$InvoiceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$InvoiceResponseToJson(this);
}

@JsonSerializable()
class InvoiceData {

  String? invoiceUUID;
  int? invoiceId;
  String? orderCode;
  String? invoiceCode;
  String? createdOrderDate;
  String? paymentDate;
  String? content;
  double? originalPrice;
  double? discountedPrice;
  double? tax;
  double? totalPrice;
  String? paymentStatus;
  String? customerName;
  String? currency;

  InvoiceData({this.invoiceUUID, this.invoiceId, this.orderCode,
    this.invoiceCode, this.createdOrderDate, this.paymentDate, this.content,
    this.originalPrice, this.discountedPrice, this.customerName, this.currency});

  factory InvoiceData.fromJson(Map<String, dynamic> json) =>
      _$InvoiceDataFromJson(json);

  Map<String, dynamic> toJson() => _$InvoiceDataToJson(this);
}