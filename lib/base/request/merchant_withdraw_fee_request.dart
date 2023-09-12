import 'package:vds/common/api_const.dart';

class MerchantWithdrawFeeRequest {

  final String amount;

  MerchantWithdrawFeeRequest({required this.amount});

  Map<String, dynamic> toMap() {
    return {
      "amount": amount
    };
  }

  String toApi() => ApiConst.merchantWithdrawalFee;
}