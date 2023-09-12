import 'package:vds/common/api_const.dart';

class MerchantWithdrawalHORequest {
  final String amount;
  final String otp;
  final String pinCode;
  final String currency;

  MerchantWithdrawalHORequest(
      {required this.amount,
      required this.currency,
      required this.otp,
      required this.pinCode});

  Map<String, dynamic> toMap() {
    return {
      "amount": amount,
      "otp": otp,
      "pinCode": pinCode,
      "currency": currency
    };
  }

  String toApi() => ApiConst.merchantWithdrawalHO;
}
