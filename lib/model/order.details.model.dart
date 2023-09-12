import 'dart:ui';
import 'package:barcode/barcode.dart';
import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order.details.model.g.dart';

@JsonSerializable()
class OrderDetails {
  String? message;
  String? traceId;
  Data? data;

  OrderDetails({this.message, this.traceId, this.data});

  OrderDetails.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    traceId = json['traceId'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
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
class Data {
  String? orderUUID;
  String? orderCode;
  int? expireTime;
  String? qrCode;
  String? customerName;
  String? content;
  num? originalPrice;
  String? status;
  String? currency;
  Staff? staff;
  String? createdDate;
  bool? showQR;

  Data(
      {this.orderUUID,
      this.showQR,
      this.orderCode,
      this.expireTime,
      this.qrCode,
      this.customerName,
      this.content,
      this.originalPrice,
      this.status,
      this.staff,
      this.createdDate,
      this.currency});

  Data.fromJson(Map<String, dynamic> json) {
    orderUUID = json['orderUUID'];
    orderCode = json['orderCode'];
    expireTime = json['expireTime'];
    qrCode = json['qrCode'];
    customerName = json['customerName'];
    content = json['content'];
    originalPrice = json['originalPrice'];
    status = json['status'];
    currency = json['currency'];
    staff = json['staff'] != null ? Staff.fromJson(json['staff']) : null;
    createdDate = json['createdDate'];
    showQR = json['showQR'];
  }

  String get barcodeString =>
      Barcode.qrCode().toSvg(qrCode ?? '', width: 240, height: 240);

  OrderStatus get currentStatus =>
      OrderStatus.values.firstWhere((element) => element.name == status,
          orElse: () => OrderStatus.WAITING_TO_PAY);

  DateTime? get endTime => DateTime.now();

  // Convert.stringToDate(expireTime ?? '', pattern: 'HH:mm:ss dd/MM/yyyy');

  Duration? get durationCountdown => endTime?.difference(DateTime.now());

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['orderUUID'] = orderUUID;
    data['orderCode'] = orderCode;
    data['expireTime'] = expireTime;
    data['qrCode'] = qrCode;
    data['customerName'] = customerName;
    data['content'] = content;
    data['originalPrice'] = originalPrice;
    data['status'] = status;
    data['showQR'] = showQR;
    if (staff != null) {
      data['staff'] = staff!.toJson();
    }
    data['createdDate'] = createdDate;
    return data;
  }
}

@JsonSerializable()
class Staff {
  String? staffUUID;
  String? staffCode;
  String? fullName;
  String? phoneNumber;
  String? email;
  String? qrCode;
  String? merchant;

  Staff(
      {this.staffUUID,
      this.staffCode,
      this.fullName,
      this.phoneNumber,
      this.email,
      this.qrCode,
      this.merchant});

  Staff.fromJson(Map<String, dynamic> json) {
    staffUUID = json['staffUUID'];
    staffCode = json['staffCode'];
    fullName = json['fullName'];
    phoneNumber = json['phoneNumber'];
    email = json['email'];
    qrCode = json['qrCode'];
    merchant = json['merchant'];
  }

  String get barcodeStrings =>
      Barcode.qrCode().toSvg(qrCode ?? '', width: 240, height: 240);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['staffUUID'] = staffUUID;
    data['staffCode'] = staffCode;
    data['fullName'] = fullName;
    data['phoneNumber'] = phoneNumber;
    data['email'] = email;
    data['qrCode'] = qrCode;
    data['merchant'] = merchant;
    return data;
  }
}

enum OrderStatus { SUCCEED, WAITING_TO_PAY, EXPIRED, CANCELLED, PARTIALLY_PAID }

extension OrderStatusExtension on OrderStatus {
  String get text => _text();

  String _text() {
    switch (this) {
      case OrderStatus.WAITING_TO_PAY:
        return 'Chờ thanh toán'.tr;
      case OrderStatus.SUCCEED:
        return 'Thanh toán thành công'.tr;
      case OrderStatus.EXPIRED:
        return 'Thanh toán không thành công'.tr;
      case OrderStatus.CANCELLED:
        return 'Hủy thanh toán'.tr;
      case OrderStatus.PARTIALLY_PAID:
        return 'Thanh toán một nửa'.tr;
    }
  }

  Color get color => _color();

  Color _color() {
    switch (this) {
      case OrderStatus.WAITING_TO_PAY:
        return const Color(0xFFFEA725);
      case OrderStatus.SUCCEED:
        return const Color(0xFF00CC6A);
      case OrderStatus.EXPIRED:
        return const Color(0xFFFF3B30);
      case OrderStatus.CANCELLED:
        return const Color(0xFFFF3B30);
      case OrderStatus.PARTIALLY_PAID:
        return const Color(0xFFF89E19);
    }
  }
}
