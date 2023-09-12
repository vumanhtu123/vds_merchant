// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication.model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AuthenticationModelCWProxy {
  AuthenticationModel id(String? id);

  AuthenticationModel token(String? token);

  AuthenticationModel type(String? type);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AuthenticationModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AuthenticationModel(...).copyWith(id: 12, name: "My name")
  /// ````
  AuthenticationModel call({
    String? id,
    String? token,
    String? type,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAuthenticationModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAuthenticationModel.copyWith.fieldName(...)`
class _$AuthenticationModelCWProxyImpl implements _$AuthenticationModelCWProxy {
  const _$AuthenticationModelCWProxyImpl(this._value);

  final AuthenticationModel _value;

  @override
  AuthenticationModel id(String? id) => this(id: id);

  @override
  AuthenticationModel token(String? token) => this(token: token);

  @override
  AuthenticationModel type(String? type) => this(type: type);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AuthenticationModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AuthenticationModel(...).copyWith(id: 12, name: "My name")
  /// ````
  AuthenticationModel call({
    Object? id = const $CopyWithPlaceholder(),
    Object? token = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
  }) {
    return AuthenticationModel(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String?,
      token: token == const $CopyWithPlaceholder()
          ? _value.token
          // ignore: cast_nullable_to_non_nullable
          : token as String?,
      type: type == const $CopyWithPlaceholder()
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as String?,
    );
  }
}

extension $AuthenticationModelCopyWith on AuthenticationModel {
  /// Returns a callable class that can be used as follows: `instanceOfAuthenticationModel.copyWith(...)` or like so:`instanceOfAuthenticationModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AuthenticationModelCWProxy get copyWith =>
      _$AuthenticationModelCWProxyImpl(this);

  /// Copies the object with the specific fields set to `null`. If you pass `false` as a parameter, nothing will be done and it will be ignored. Don't do it. Prefer `copyWith(field: null)` or `AuthenticationModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AuthenticationModel(...).copyWithNull(firstField: true, secondField: true)
  /// ````
  AuthenticationModel copyWithNull({
    bool id = false,
    bool token = false,
    bool type = false,
  }) {
    return AuthenticationModel(
      id: id == true ? null : this.id,
      token: token == true ? null : this.token,
      type: type == true ? null : this.type,
    );
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenticationModel _$AuthenticationModelFromJson(Map<String, dynamic> json) =>
    AuthenticationModel(
      id: json['id'] as String?,
      token: json['token'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$AuthenticationModelToJson(
        AuthenticationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'token': instance.token,
      'type': instance.type,
    };
