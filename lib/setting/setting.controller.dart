import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:vds/common/storage_data.dart';

import 'setting.reposity.dart';

class SettingController extends GetxController {
  final reposity = SettingReposity();
  final Rx<String> version = ''.obs;
  final Rx<bool> isFirstTime = true.obs;
  @override
  void onInit() {
    getVersion();
    getIsFirstTime();
    super.onInit();
  }

  void getVersion() async {
    version.value = (await PackageInfo.fromPlatform()).version;
  }

  void getIsFirstTime() async {
    isFirstTime.value = await reposity.getFirstTime();
  }

  bool isStaff() => StorageData.instance.isStaff();

  bool isMerchant() => StorageData.instance.isMerchant();

}
