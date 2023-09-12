import 'package:json_annotation/json_annotation.dart';

import 'bank.info.model.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'revoke.info.model.g.dart';

@JsonSerializable()
@CopyWith(copyWithNull: true)
class RevokeInfoModel {
  final String? id;
  final int? price;
  final int? fee;
  final BankInfoModel? bankInfo;
  final String? codeRevoke;
  final String? successAt;
  final int? currentMoneyInAccount;

  int get totalPrice => (price ?? 0) - (fee ?? 0);

  RevokeInfoModel({
    this.id,
    this.price,
    this.fee,
    this.bankInfo,
    this.codeRevoke,
    this.successAt,
    this.currentMoneyInAccount,
  });

  factory RevokeInfoModel.fromJson(Map<String, dynamic> json) =>
      _$RevokeInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$RevokeInfoModelToJson(this);
}
