import 'package:json_annotation/json_annotation.dart';

part 'bank.info.model.g.dart';

@JsonSerializable()
class BankInfoModel {
  final String? name;
  final String? number;
  final String? nameBank;
  final String? nameBranch;

  BankInfoModel({this.name, this.number, this.nameBank, this.nameBranch});

  factory BankInfoModel.fromJson(Map<String, dynamic> json) =>
      _$BankInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$BankInfoModelToJson(this);
}
