// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_code.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ErrorCodeCWProxy {
  ErrorCode code(int? code);

  ErrorCode message(String? message);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ErrorCode(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ErrorCode(...).copyWith(id: 12, name: "My name")
  /// ````
  ErrorCode call({
    int? code,
    String? message,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfErrorCode.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfErrorCode.copyWith.fieldName(...)`
class _$ErrorCodeCWProxyImpl implements _$ErrorCodeCWProxy {
  const _$ErrorCodeCWProxyImpl(this._value);

  final ErrorCode _value;

  @override
  ErrorCode code(int? code) => this(code: code);

  @override
  ErrorCode message(String? message) => this(message: message);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ErrorCode(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ErrorCode(...).copyWith(id: 12, name: "My name")
  /// ````
  ErrorCode call({
    Object? code = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
  }) {
    return ErrorCode(
      code: code == const $CopyWithPlaceholder()
          ? _value.code
          // ignore: cast_nullable_to_non_nullable
          : code as int?,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
    );
  }
}

extension $ErrorCodeCopyWith on ErrorCode {
  /// Returns a callable class that can be used as follows: `instanceOfErrorCode.copyWith(...)` or like so:`instanceOfErrorCode.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ErrorCodeCWProxy get copyWith => _$ErrorCodeCWProxyImpl(this);

  /// Copies the object with the specific fields set to `null`. If you pass `false` as a parameter, nothing will be done and it will be ignored. Don't do it. Prefer `copyWith(field: null)` or `ErrorCode(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ErrorCode(...).copyWithNull(firstField: true, secondField: true)
  /// ````
  ErrorCode copyWithNull({
    bool code = false,
    bool message = false,
  }) {
    return ErrorCode(
      code: code == true ? null : this.code,
      message: message == true ? null : this.message,
    );
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorCode _$ErrorCodeFromJson(Map<String, dynamic> json) => ErrorCode(
      code: json['code'] as int?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ErrorCodeToJson(ErrorCode instance) => <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };
