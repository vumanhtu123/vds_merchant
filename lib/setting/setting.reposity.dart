import 'package:shared_preferences/shared_preferences.dart';

const String isFirstTimeString = 'isFirstTimeString';

class SettingReposity {
  static final SettingReposity _singleton = SettingReposity._internal();

  factory SettingReposity() {
    return _singleton;
  }

  SettingReposity._internal();

  saveAuthen() async {}

  Future<bool> getFirstTime() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isFirstTimeString) ?? true;
  }

  Future<void> saveFirstTime() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setBool(isFirstTimeString, false);
  }
}
