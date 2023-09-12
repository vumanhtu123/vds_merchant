import 'dart:ffi';
import 'dart:ui';

import 'package:barcode/barcode.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

import '../helper/convert.dart';
part 'orders.model.g.dart';

@JsonSerializable()
class OrdersModel {
  String? message;
  Data? data;

  OrdersModel({this.message, this.data});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

@JsonSerializable()
class Data {
  List<Content>? content;
  Pageable? pageable;
  bool? last;
  int? totalPages;
  int? totalElements;
  Sort? sort;
  bool? first;
  int? size;
  int? number;
  int? numberOfElements;
  bool? empty;

  Data(
      {this.content,
        this.pageable,
        this.last,
        this.totalPages,
        this.totalElements,
        this.sort,
        this.first,
        this.size,
        this.number,
        this.numberOfElements,
        this.empty});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['content'] != null) {
      content = <Content>[];
      json['content'].forEach((v) {
        content!.add(Content.fromJson(v));
      });
    }
    pageable = json['pageable'] != null
        ? Pageable.fromJson(json['pageable'])
        : null;
    last = json['last'];
    totalPages = json['totalPages'];
    totalElements = json['totalElements'];
    sort = json['sort'] != null ? Sort.fromJson(json['sort']) : null;
    first = json['first'];
    size = json['size'];
    number = json['number'];
    numberOfElements = json['numberOfElements'];
    empty = json['empty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (content != null) {
      data['content'] = content!.map((v) => v.toJson()).toList();
    }
    if (pageable != null) {
      data['pageable'] = pageable!.toJson();
    }
    data['last'] = last;
    data['totalPages'] = totalPages;
    data['totalElements'] = totalElements;
    if (sort != null) {
      data['sort'] = sort!.toJson();
    }
    data['first'] = first;
    data['size'] = size;
    data['number'] = number;
    data['numberOfElements'] = numberOfElements;
    data['empty'] = empty;
    return data;
  }
}

@JsonSerializable()
class Content {
  String? orderUUID;
  String? orderCode;
  num? originalPrice;
  num? discountedPrice;
  String? customerName;
  String? customerPhone;
  String? status;
  String? createdAt;
  String? currency;
  Staff? staff;

  Content(
      {
        this.orderUUID,
        this.orderCode,
        this.originalPrice,
        this.discountedPrice,
        this.customerName,
        this.customerPhone,
        this.status,
        this.createdAt,
        this.currency,
        this.staff});

  Content.fromJson(Map<String, dynamic> json) {
    orderUUID = json['orderUUID'];
    orderCode = json['orderCode'];
    originalPrice = json['originalPrice'];
    discountedPrice = json['discountedPrice'];
    customerName = json['customerName'];
    customerPhone = json['customerPhone'];
    status = json['status'];
    createdAt = json['createdAt'];
    currency = json['currency'];
    staff = json['staff'] != null ? Staff.fromJson(json['staff']) : null;
  }

  DateTime? get endTime =>
      Convert.stringToDate(createdAt ?? '', pattern: 'HH:mm:ss dd/MM/yyyy');

  // String get priceText => _priceText();

  // String _priceText() {
  //   if (originalPrice == null) return '';
  //   var formatter = NumberFormat('###,###,000');
  //   return '${formatter.format(originalPrice).replaceAll(',', '.')} USD';
  // }

  OrderStatus get currentStatus =>
      OrderStatus.values.firstWhere((element) => element.name == status,
          orElse: () => OrderStatus.WAITING_TO_PAY);

  Duration? get durationCountdown => endTime?.difference(DateTime.now());

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['orderUUID'] = orderUUID;
    data['orderCode'] = orderCode;
    data['originalPrice'] = originalPrice;
    data['discountedPrice'] = discountedPrice;
    data['customerName'] = customerName;
    data['customerPhone'] = customerPhone;
    data['status'] = status;
    data['createdAt'] = createdAt;
    data['currency'] = currency;
    if (staff != null) {
      data['staff'] = staff!.toJson();
    }
    return data;
  }
}

@JsonSerializable()
class Staff {
  String? staffUUID;
  String? staffName;
  String? qrCode;

  Staff({this.staffUUID, this.staffName, this.qrCode});

  Staff.fromJson(Map<String, dynamic> json) {
    staffUUID = json['staffUUID'];
    staffName = json['staffName'];
    qrCode = json['qrCode'];
  }

  String get barcodeString =>
      Barcode.qrCode().toSvg(qrCode ?? '', width: 240, height: 240);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['staffUUID'] = staffUUID;
    data['staffName'] = staffName;
    data['qrCode'] = qrCode;
    return data;
  }
}

@JsonSerializable()
class Pageable {
  Sort? sort;
  int? offset;
  int? pageNumber;
  int? pageSize;
  bool? paged;
  bool? unpaged;

  Pageable(
      {this.sort,
        this.offset,
        this.pageNumber,
        this.pageSize,
        this.paged,
        this.unpaged});

  Pageable.fromJson(Map<String, dynamic> json) {
    sort = json['sort'] != null ? Sort.fromJson(json['sort']) : null;
    offset = json['offset'];
    pageNumber = json['pageNumber'];
    pageSize = json['pageSize'];
    paged = json['paged'];
    unpaged = json['unpaged'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (sort != null) {
      data['sort'] = sort!.toJson();
    }
    data['offset'] = offset;
    data['pageNumber'] = pageNumber;
    data['pageSize'] = pageSize;
    data['paged'] = paged;
    data['unpaged'] = unpaged;
    return data;
  }
}

@JsonSerializable()
class Sort {
  bool? empty;
  bool? unsorted;
  bool? sorted;

  Sort({this.empty, this.unsorted, this.sorted});

  Sort.fromJson(Map<String, dynamic> json) {
    empty = json['empty'];
    unsorted = json['unsorted'];
    sorted = json['sorted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['empty'] = empty;
    data['unsorted'] = unsorted;
    data['sorted'] = sorted;
    return data;
  }

}

enum OrderStatus { SUCCEED, WAITING_TO_PAY, EXPIRED, CANCELLED, PARTIALLY_PAID}

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
