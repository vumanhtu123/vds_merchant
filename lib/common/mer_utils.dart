import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

class MerUtils {
  static bool validateStructure(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[,.!@#\/$&*~"|:]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  static bool validatePhone(String value) {
    String pattern = r'(^\d*(670)?\d*7[5,6]{1}[0-9]{6}$)';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  static bool validateBiCard(String value) {
    String pattern = r'^[a-zA-Z0-9]{0,17}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  static bool validateID(String value) {
    String pattern = r'^[0-9]{0,9}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  static bool validatePassPost(String value) {
    String pattern = r'^[a-zA-Z0-9]{0,20}$';
    // String pattern = r'^[A-Z]+[0-9]{0,19}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  static Future<String> getDeviceId() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if(Platform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;
      return iosInfo.identifierForVendor ?? "";
    }
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    return androidInfo.id;
  }
}
