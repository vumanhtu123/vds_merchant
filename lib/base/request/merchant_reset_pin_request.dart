import 'package:vds/common/api_const.dart';

class MerchantResetPINRequest {
  final String newPin;
  final String otp;

  MerchantResetPINRequest({required this.newPin, required this.otp});

  Map<String, dynamic> toMap() {
    return {'newPin': newPin, 'otp': otp};
  }

  String toApi() => ApiConst.merchantRegisterPin;
}
