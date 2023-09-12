import 'package:barcode/barcode.dart';
import 'package:json_annotation/json_annotation.dart';

part 'employee.model.g.dart';

@JsonSerializable()
class EmployeeModel {
  final String? id;
  final String? name;
  final String? code;

  EmployeeModel({this.id, this.name, this.code});

  factory EmployeeModel.fromJson(Map<String, dynamic> json) =>
      _$EmployeeModelFromJson(json);

  String get barcodeString =>
      Barcode.qrCode().toSvg(code ?? '', width: 80, height: 80);

  Map<String, dynamic> toJson() => _$EmployeeModelToJson(this);
}
