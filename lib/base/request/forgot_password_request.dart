import 'package:vds/common/api_const.dart';

class MerchantForgotPasswordRequest {

  String phoneNumber;
  String type;
  String identity;

  MerchantForgotPasswordRequest({
    required this.phoneNumber,
    required this.type,
    required this.identity
  });

  Map<String, dynamic> toMap() {
    return {
      "phoneNumber": phoneNumber,
      "type": type,
      "identity": identity,
    };
  }

  String toApi() => ApiConst.merchantForgotPassword;
}

class StaffForgotPasswordRequest {

  String phoneNumber;

  StaffForgotPasswordRequest({
    required this.phoneNumber,
  });

  Map<String, dynamic> toMap() {
    return {
      "phoneNumber": phoneNumber,
    };
  }

  String toApi() => ApiConst.staffForgotPassword;
}