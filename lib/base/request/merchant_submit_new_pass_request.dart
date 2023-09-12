import 'package:vds/common/api_const.dart';

class MerchantSubmitNewPassRequest {

  final String otp;
  final String newPassword;

  MerchantSubmitNewPassRequest({
    required this.otp,
    required this.newPassword
  });

  Map<String, dynamic> toMap() {
    return {
      'otp': otp,
      'newPassword': newPassword
    };
  }

  String toApi() => ApiConst.merchantSubmitNewPass;
}