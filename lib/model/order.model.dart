import 'dart:ui';

import 'package:barcode/barcode.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:vds/common/api_const.dart';

import 'package:vds/helper/convert.dart';

import 'customer.model.dart';
import 'employee.model.dart';
import 'transition.model.dart';

part 'order.model.g.dart';

@JsonSerializable(explicitToJson: true)
@CopyWith()
class OrderModel {
  final String? id;
  final String? code;
  final String? createAt;
  final String? endAt;
  final String? description;
  final CustomerModel? customer;
  final EmployeeModel? employee;
  final TransitionModel? transision;
  final String? status;
  final double? price;

  OrderModel({
    this.id,
    this.code,
    this.endAt,
    this.transision,
    this.description,
    this.createAt,
    this.customer,
    this.employee,
    this.status,
    this.price,
  });

  String get barcodeString =>
      Barcode.qrCode().toSvg(code ?? '', width: 240, height: 240);

  DateTime? get endTime =>
      Convert.stringToDate(endAt ?? '', pattern: 'HH:mm:ss dd/MM/yyyy');

  String get priceText => _priceText();

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  OrderStatus get currentStatus =>
      OrderStatus.values.firstWhere((element) => element.name == status,
          orElse: () => OrderStatus.pending);

  Duration? get durationCountdown => endTime?.difference(DateTime.now());

  Map<String, dynamic> toJson() => _$OrderModelToJson(this);

  String _priceText() {
    if (price == null) return '';
    var formatter = NumberFormat('###,###,000');
    return '${formatter.format(price).replaceAll(',', '.')} USD';
  }
  Map<String, dynamic> toMap() {
    return {
      "orderCode": code,
      "contents": description,
      "originalPrice": price,
    };
  }

  String toApi() => ApiConst.merchantOrder;
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
