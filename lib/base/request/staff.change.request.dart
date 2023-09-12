import 'package:vds/common/api_const.dart';

class StaffChangePassRequest {

  final String oldPassword;
  final String newPassword;

  StaffChangePassRequest({
    required this.oldPassword,
    required this.newPassword
  });

  Map<String, dynamic> toMap() {
    return {
      'oldPassword': oldPassword,
      'newPassword': newPassword
    };
  }

  String toApi() => ApiConst.staffChangePass;
}