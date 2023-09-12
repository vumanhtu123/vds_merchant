import 'package:vds/common/api_const.dart';

class MerchantChangePINRequest {
  final String newPin;
  final String oldPin;

  MerchantChangePINRequest({required this.newPin, required this.oldPin});

  Map<String, dynamic> toMap() {
    return {'newPin': newPin, 'oldPin': oldPin};
  }

  String toApi() => ApiConst.merchantChangePin;
}
