// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'revoke.info.model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$RevokeInfoModelCWProxy {
  RevokeInfoModel id(String? id);

  RevokeInfoModel price(int? price);

  RevokeInfoModel fee(int? fee);

  RevokeInfoModel bankInfo(BankInfoModel? bankInfo);

  RevokeInfoModel codeRevoke(String? codeRevoke);

  RevokeInfoModel successAt(String? successAt);

  RevokeInfoModel currentMoneyInAccount(int? currentMoneyInAccount);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `RevokeInfoModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// RevokeInfoModel(...).copyWith(id: 12, name: "My name")
  /// ````
  RevokeInfoModel call({
    String? id,
    int? price,
    int? fee,
    BankInfoModel? bankInfo,
    String? codeRevoke,
    String? successAt,
    int? currentMoneyInAccount,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfRevokeInfoModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfRevokeInfoModel.copyWith.fieldName(...)`
class _$RevokeInfoModelCWProxyImpl implements _$RevokeInfoModelCWProxy {
  const _$RevokeInfoModelCWProxyImpl(this._value);

  final RevokeInfoModel _value;

  @override
  RevokeInfoModel id(String? id) => this(id: id);

  @override
  RevokeInfoModel price(int? price) => this(price: price);

  @override
  RevokeInfoModel fee(int? fee) => this(fee: fee);

  @override
  RevokeInfoModel bankInfo(BankInfoModel? bankInfo) => this(bankInfo: bankInfo);

  @override
  RevokeInfoModel codeRevoke(String? codeRevoke) =>
      this(codeRevoke: codeRevoke);

  @override
  RevokeInfoModel successAt(String? successAt) => this(successAt: successAt);

  @override
  RevokeInfoModel currentMoneyInAccount(int? currentMoneyInAccount) =>
      this(currentMoneyInAccount: currentMoneyInAccount);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `RevokeInfoModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// RevokeInfoModel(...).copyWith(id: 12, name: "My name")
  /// ````
  RevokeInfoModel call({
    Object? id = const $CopyWithPlaceholder(),
    Object? price = const $CopyWithPlaceholder(),
    Object? fee = const $CopyWithPlaceholder(),
    Object? bankInfo = const $CopyWithPlaceholder(),
    Object? codeRevoke = const $CopyWithPlaceholder(),
    Object? successAt = const $CopyWithPlaceholder(),
    Object? currentMoneyInAccount = const $CopyWithPlaceholder(),
  }) {
    return RevokeInfoModel(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String?,
      price: price == const $CopyWithPlaceholder()
          ? _value.price
          // ignore: cast_nullable_to_non_nullable
          : price as int?,
      fee: fee == const $CopyWithPlaceholder()
          ? _value.fee
          // ignore: cast_nullable_to_non_nullable
          : fee as int?,
      bankInfo: bankInfo == const $CopyWithPlaceholder()
          ? _value.bankInfo
          // ignore: cast_nullable_to_non_nullable
          : bankInfo as BankInfoModel?,
      codeRevoke: codeRevoke == const $CopyWithPlaceholder()
          ? _value.codeRevoke
          // ignore: cast_nullable_to_non_nullable
          : codeRevoke as String?,
      successAt: successAt == const $CopyWithPlaceholder()
          ? _value.successAt
          // ignore: cast_nullable_to_non_nullable
          : successAt as String?,
      currentMoneyInAccount:
          currentMoneyInAccount == const $CopyWithPlaceholder()
              ? _value.currentMoneyInAccount
              // ignore: cast_nullable_to_non_nullable
              : currentMoneyInAccount as int?,
    );
  }
}

extension $RevokeInfoModelCopyWith on RevokeInfoModel {
  /// Returns a callable class that can be used as follows: `instanceOfRevokeInfoModel.copyWith(...)` or like so:`instanceOfRevokeInfoModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$RevokeInfoModelCWProxy get copyWith => _$RevokeInfoModelCWProxyImpl(this);

  /// Copies the object with the specific fields set to `null`. If you pass `false` as a parameter, nothing will be done and it will be ignored. Don't do it. Prefer `copyWith(field: null)` or `RevokeInfoModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// RevokeInfoModel(...).copyWithNull(firstField: true, secondField: true)
  /// ````
  RevokeInfoModel copyWithNull({
    bool id = false,
    bool price = false,
    bool fee = false,
    bool bankInfo = false,
    bool codeRevoke = false,
    bool successAt = false,
    bool currentMoneyInAccount = false,
  }) {
    return RevokeInfoModel(
      id: id == true ? null : this.id,
      price: price == true ? null : this.price,
      fee: fee == true ? null : this.fee,
      bankInfo: bankInfo == true ? null : this.bankInfo,
      codeRevoke: codeRevoke == true ? null : this.codeRevoke,
      successAt: successAt == true ? null : this.successAt,
      currentMoneyInAccount:
          currentMoneyInAccount == true ? null : this.currentMoneyInAccount,
    );
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RevokeInfoModel _$RevokeInfoModelFromJson(Map<String, dynamic> json) =>
    RevokeInfoModel(
      id: json['id'] as String?,
      price: json['price'] as int?,
      fee: json['fee'] as int?,
      bankInfo: json['bankInfo'] == null
          ? null
          : BankInfoModel.fromJson(json['bankInfo'] as Map<String, dynamic>),
      codeRevoke: json['codeRevoke'] as String?,
      successAt: json['successAt'] as String?,
      currentMoneyInAccount: json['currentMoneyInAccount'] as int?,
    );

Map<String, dynamic> _$RevokeInfoModelToJson(RevokeInfoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'fee': instance.fee,
      'bankInfo': instance.bankInfo,
      'codeRevoke': instance.codeRevoke,
      'successAt': instance.successAt,
      'currentMoneyInAccount': instance.currentMoneyInAccount,
    };
