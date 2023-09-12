import 'dart:io';

import 'package:vds/common/api_const.dart';

class RegisterDeviceTokenRequest {

  String token;

  RegisterDeviceTokenRequest({
    required this.token,
  });

  Map<String, dynamic> toMap() {
    return {
      "token": token,
      "platform": Platform.isAndroid ? "ANDROID" : "IOS"
    ,
    };
  }

  String toApi() => ApiConst.registerDeviceToken;
}