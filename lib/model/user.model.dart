import 'package:barcode/barcode.dart';
import 'package:json_annotation/json_annotation.dart';

import 'bank.info.model.dart';
import 'merchant.model.dart';

part 'user.model.g.dart';

@JsonSerializable()
class UserModel {
  final String? id;
  final String? name;
  final MerchantModel? merchant;
  final BankInfoModel? bankInfo;
  final String? merchantCode;
  final String? merchantName;

  String get barcodeString =>
      Barcode.qrCode().toSvg(merchantCode ?? '', width: 160, height: 160);

  String get merchantCodeHide => (merchantCode?.length ?? 0) > 8
      ? '${merchantCode!.substring(0, 3)}${merchantCode!.substring(3, merchantCode!.length - 3).replaceAll(RegExp(r'.'), '*')}${merchantCode!.substring(merchantCode!.length - 3, merchantCode!.length)}'
      : merchantCode!.replaceAll(RegExp(r'.'), '*');
  UserModel(
      {this.merchantCode,
      this.merchantName,
      this.id,
      this.name,
      this.merchant,
      this.bankInfo});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
