import 'package:vds/common/api_const.dart';

class MerchantForgotPassRequest {

  final String otpReceiver;
  final String receiverType;

  MerchantForgotPassRequest({
    required this.otpReceiver,
    required this.receiverType
  });

  Map<String, dynamic> toMap() {
    return {
      'otpReceiver': otpReceiver,
      'receiverType': receiverType
    };
  }

  String toApi() => ApiConst.merchantForgotPassword;
}