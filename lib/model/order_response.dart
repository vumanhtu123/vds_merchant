import 'package:json_annotation/json_annotation.dart';
import 'package:vds/model/order.model.dart';
part 'order_response.g.dart';

@JsonSerializable()
class OrderResponse {
  final String? message;
  final OrderData? data;
  final Orders? orders;

  OrderResponse(this.orders, {this.message, this.data});

  factory OrderResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OrderResponseToJson(this);
}

@JsonSerializable()
class OrderData {
  final List<OrderContent>? content;

  OrderData({this.content});

  factory OrderData.fromJson(Map<String, dynamic> json) =>
      _$OrderDataFromJson(json);

  Map<String, dynamic> toJson() => _$OrderDataToJson(this);
}

@JsonSerializable()
class OrderContent {
  String? transactionUUID;
  String? transactionCode;
  double? price;
  String? createdDate;
  String? status;
  OrderStaff? staff;

  OrderContent({this.transactionUUID, this.transactionCode, this.price,
    this.createdDate, this.status, this.staff
  });

  factory OrderContent.fromJson(Map<String, dynamic> json) =>
      _$OrderContentFromJson(json);

  Map<String, dynamic> toJson() => _$OrderContentToJson(this);
}

@JsonSerializable()
class OrderStaff {
  final String? staffUUID;
  final String? staffName;
  final String? qrCode;

  OrderStaff({this.staffUUID, this.staffName, this.qrCode});

  factory OrderStaff.fromJson(Map<String, dynamic> json) =>
      _$OrderStaffFromJson(json);

  Map<String, dynamic> toJson() => _$OrderStaffToJson(this);
}

@JsonSerializable()
class Orders {
  final List<OrderModel>? orders;

  Orders({this.orders});

  factory Orders.fromJson(Map<String, dynamic> json) =>
      _$OrdersFromJson(json);

  Map<String, dynamic> toJson() => _$OrdersToJson(this);
}