import 'dart:ui';

import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';
part 'order.create.model.g.dart';

@JsonSerializable()
class OrdersResponse {
  String? message;
  String? traceId;
  Data? data;
  List<ErrorCodes>? errorCodes;

  OrdersResponse({this.message, this.traceId, this.data});

  OrdersResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    traceId = json['traceId'];
    if (json['errorCodes'] != null) {
      errorCodes = <ErrorCodes>[];
      json['errorCodes'].forEach((v) {
        errorCodes!.add(ErrorCodes.fromJson(v));
      });
    }
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['traceId'] = traceId;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (errorCodes != null) {
      data['errorCodes'] = errorCodes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

@JsonSerializable()
class Data {
  String? orderUUID;

  Data({
    this.orderUUID,
  });

  Data.fromJson(Map<String, dynamic> json) {
    orderUUID = json['orderUUID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['orderUUID'] = orderUUID;
    return data;
  }
}

@JsonSerializable()
class ErrorCodes {
  int? code;
  String? message;

  ErrorCodes({this.code, this.message});

  ErrorCodes.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    return data;
  }
}

enum OrderStatus { success, pending, fail }

extension OrderStatusExtension on OrderStatus {
  String get text => _text();

  String _text() {
    switch (this) {
      case OrderStatus.pending:
        return 'Chưa thanh toán'.tr;
      case OrderStatus.success:
        return 'Thanh toán thành công'.tr;

      case OrderStatus.fail:
        return 'Thanh toán không thành công'.tr;
    }
  }

  Color get color => _color();

  Color _color() {
    switch (this) {
      case OrderStatus.pending:
        return const Color(0xFFFEA725);
      case OrderStatus.success:
        return const Color(0xFF00CC6A);

      case OrderStatus.fail:
        return const Color(0xFFFF3B30);
    }
  }
}
