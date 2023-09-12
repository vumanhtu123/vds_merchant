import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import '../app/login/login.controller.dart';
part 'authentication.model.g.dart';

@JsonSerializable()
@CopyWith(copyWithNull: true)
class AuthenticationModel {
  final String? id;
  final String? token;
  final String? type;

  AuthenticationModel({
    this.id,
    this.token,
    this.type,
  });

  factory AuthenticationModel.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthenticationModelToJson(this);
}
