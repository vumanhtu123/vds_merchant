import 'package:vds/common/api_const.dart';

class MerchantWithdrawalBankRequest {
  final String currency;
  final String bankAccount;
  final String amount;
  final String otp;
  final String pinCode;

  MerchantWithdrawalBankRequest({
    required this.bankAccount,
    required this.currency,
    required this.amount,
    required this.otp,
    required this.pinCode,
  });

  Map<String, dynamic> toMap() {
    return {
      "bankAccountNo": bankAccount,
      "currency": currency,
      "amount": amount,
      "otp": otp,
      "pinCode": pinCode
    };
  }

  String toApi() => ApiConst.merchantWithdrawalBank;
}
