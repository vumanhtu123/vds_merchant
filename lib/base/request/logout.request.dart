import 'package:vds/common/api_const.dart';

class LogoutRequest {
  LogoutRequest();

  Map<String, dynamic> toMap() {
    return {};
  }

  String toApi() => ApiConst.logout;
}
