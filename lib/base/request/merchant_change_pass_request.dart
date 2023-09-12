import 'package:vds/common/api_const.dart';

class MerchantChangePassRequest {

  final String oldPassword;
  final String newPassword;

  MerchantChangePassRequest({
    required this.oldPassword,
    required this.newPassword
  });

  Map<String, dynamic> toMap() {
    return {
      'oldPassword': oldPassword,
      'newPassword': newPassword
    };
  }

  String toApi() => ApiConst.merchantChangePass;
}