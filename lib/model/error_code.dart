import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
part 'error_code.g.dart';

@JsonSerializable()
@CopyWith(copyWithNull: true)
class ErrorCode {
  final int? code;
  final String? message;

  ErrorCode({
    this.code,
    this.message,
  });

  factory ErrorCode.fromJson(Map<String, dynamic> json) =>
      _$ErrorCodeFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorCodeToJson(this);
}
