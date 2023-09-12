import 'package:vds/common/api_const.dart';

class StaffForgotPasswordRequest {

  String phoneNumber;
  String type;
  String identity;

  StaffForgotPasswordRequest({
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