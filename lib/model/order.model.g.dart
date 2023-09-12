// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$OrderModelCWProxy {
  OrderModel id(String? id);

  OrderModel code(String? code);

  OrderModel endAt(String? endAt);

  OrderModel transision(TransitionModel? transision);

  OrderModel description(String? description);

  OrderModel createAt(String? createAt);

  OrderModel customer(CustomerModel? customer);

  OrderModel employee(EmployeeModel? employee);

  OrderModel status(String? status);

  OrderModel price(double? price);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `OrderModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// OrderModel(...).copyWith(id: 12, name: "My name")
  /// ````
  OrderModel call({
    String? id,
    String? code,
    String? endAt,
    TransitionModel? transision,
    String? description,
    String? createAt,
    CustomerModel? customer,
    EmployeeModel? employee,
    String? status,
    double? price,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfOrderModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfOrderModel.copyWith.fieldName(...)`
class _$OrderModelCWProxyImpl implements _$OrderModelCWProxy {
  const _$OrderModelCWProxyImpl(this._value);

  final OrderModel _value;

  @override
  OrderModel id(String? id) => this(id: id);

  @override
  OrderModel code(String? code) => this(code: code);

  @override
  OrderModel endAt(String? endAt) => this(endAt: endAt);

  @override
  OrderModel transision(TransitionModel? transision) =>
      this(transision: transision);

  @override
  OrderModel description(String? description) => this(description: description);

  @override
  OrderModel createAt(String? createAt) => this(createAt: createAt);

  @override
  OrderModel customer(CustomerModel? customer) => this(customer: customer);

  @override
  OrderModel employee(EmployeeModel? employee) => this(employee: employee);

  @override
  OrderModel status(String? status) => this(status: status);

  @override
  OrderModel price(double? price) => this(price: price);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `OrderModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// OrderModel(...).copyWith(id: 12, name: "My name")
  /// ````
  OrderModel call({
    Object? id = const $CopyWithPlaceholder(),
    Object? code = const $CopyWithPlaceholder(),
    Object? endAt = const $CopyWithPlaceholder(),
    Object? transision = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? createAt = const $CopyWithPlaceholder(),
    Object? customer = const $CopyWithPlaceholder(),
    Object? employee = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? price = const $CopyWithPlaceholder(),
  }) {
    return OrderModel(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String?,
      code: code == const $CopyWithPlaceholder()
          ? _value.code
          // ignore: cast_nullable_to_non_nullable
          : code as String?,
      endAt: endAt == const $CopyWithPlaceholder()
          ? _value.endAt
          // ignore: cast_nullable_to_non_nullable
          : endAt as String?,
      transision: transision == const $CopyWithPlaceholder()
          ? _value.transision
          // ignore: cast_nullable_to_non_nullable
          : transision as TransitionModel?,
      description: description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String?,
      createAt: createAt == const $CopyWithPlaceholder()
          ? _value.createAt
          // ignore: cast_nullable_to_non_nullable
          : createAt as String?,
      customer: customer == const $CopyWithPlaceholder()
          ? _value.customer
          // ignore: cast_nullable_to_non_nullable
          : customer as CustomerModel?,
      employee: employee == const $CopyWithPlaceholder()
          ? _value.employee
          // ignore: cast_nullable_to_non_nullable
          : employee as EmployeeModel?,
      status: status == const $CopyWithPlaceholder()
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as String?,
      price: price == const $CopyWithPlaceholder()
          ? _value.price
          // ignore: cast_nullable_to_non_nullable
          : price as double?,
    );
  }
}

extension $OrderModelCopyWith on OrderModel {
  /// Returns a callable class that can be used as follows: `instanceOfOrderModel.copyWith(...)` or like so:`instanceOfOrderModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$OrderModelCWProxy get copyWith => _$OrderModelCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
      id: json['id'] as String?,
      code: json['code'] as String?,
      endAt: json['endAt'] as String?,
      transision: json['transision'] == null
          ? null
          : TransitionModel.fromJson(
              json['transision'] as Map<String, dynamic>),
      description: json['description'] as String?,
      createAt: json['createAt'] as String?,
      customer: json['customer'] == null
          ? null
          : CustomerModel.fromJson(json['customer'] as Map<String, dynamic>),
      employee: json['employee'] == null
          ? null
          : EmployeeModel.fromJson(json['employee'] as Map<String, dynamic>),
      status: json['status'] as String?,
      price: (json['price'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'createAt': instance.createAt,
      'endAt': instance.endAt,
      'description': instance.description,
      'customer': instance.customer?.toJson(),
      'employee': instance.employee?.toJson(),
      'transision': instance.transision?.toJson(),
      'status': instance.status,
      'price': instance.price,
    };
