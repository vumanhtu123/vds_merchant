import 'package:vds/main.dart';

class StorageData {
  final String tokenStore = 'token';
  final String refreshToken = 'refresh_token';
  final String theFirst = 'the_first';
  final String userRole = 'user_role';
  final String deviceToken = 'device_token';
  final String _registerDeviceToken = 'register_device_token';
  final String _currentLanguage = 'current_language';
  final String _notifyCount = '_notify_count_';

  StorageData._privateConstructor();

  static final StorageData _instance = StorageData._privateConstructor();

  static StorageData get instance => _instance;

  setAppToken(String? token) => appStorage?.write(tokenStore, token);
  setRefreshToken(String? token) => appStorage?.write(refreshToken, token);
  setUserRole(String? role) => appStorage?.write(userRole, role);
  setTheFirst() => appStorage?.write(theFirst, false);
  setDeviceStore(String? token) => appStorage?.write(deviceToken, token);
  setRegisterDeviceToken() => appStorage?.write(_registerDeviceToken, true);
  setCurrentLanguage(String code) => appStorage?.write(_currentLanguage, code);
  setNotifyCount(int count) => appStorage?.write(_notifyCount, count);

  String? getAppToken() => appStorage?.read(tokenStore);
  String? getRefreshToken() => appStorage?.read(refreshToken);
  bool getTheFirst() => appStorage?.read(theFirst) ?? true;
  String? getUserRole() => appStorage?.read(userRole);
  bool isStaff() => appStorage?.read(userRole) == "MERCHANT_STAFF";
  bool isMerchant() => appStorage?.read(userRole) == "MERCHANT_OWNER";
  String? getDeviceStore() => appStorage?.read(deviceToken);
  bool isRegisterDeviceToken() => appStorage?.read(_registerDeviceToken) ?? false;
  String? getCurrentLanguage() => appStorage?.read(_currentLanguage);
  int getNotifyCount() => appStorage?.read(_notifyCount);

  onLogout() async {
    await appStorage?.remove(_registerDeviceToken);
    await appStorage?.remove(tokenStore);
    await appStorage?.remove(refreshToken);
    await appStorage?.remove(userRole);
    await appStorage?.remove(_notifyCount);
  }
}
