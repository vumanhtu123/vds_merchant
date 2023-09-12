import 'package:vds/common/api_const.dart';

class MerchantPINVerifyRequest {

  final String pinCode;

  MerchantPINVerifyRequest({required this.pinCode});

  Map<String, dynamic> toMap() {
    return {
      "pinCode": pinCode
    };
  }

  String toApi() => ApiConst.merchantPinVerify;
}