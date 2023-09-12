import 'package:json_annotation/json_annotation.dart';

part 'merchant.model.g.dart';

@JsonSerializable()
class MerchantModel {
  final String? typeMerchant;
  final String? fieldBusiness;
  final String? lisenseBusiness;
  final String? codeMerchant;
  final String? nameMerchant;
  final String? phoneNumberMerchant;
  final String? typeDocument;
  final String? idDocument;
  final String? createDateDocument;
  final String? endDateDocument;
  final String? positionRegis;

  MerchantModel({
    this.typeMerchant,
    this.fieldBusiness,
    this.lisenseBusiness,
    this.codeMerchant,
    this.nameMerchant,
    this.phoneNumberMerchant,
    this.typeDocument,
    this.idDocument,
    this.createDateDocument,
    this.endDateDocument,
    this.positionRegis,
  });

  factory MerchantModel.fromJson(Map<String, dynamic> json) =>
      _$MerchantModelFromJson(json);

  Map<String, dynamic> toJson() => _$MerchantModelToJson(this);
}
