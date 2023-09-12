import 'package:get/get.dart';
import 'package:vds/notification/notification.controller.dart';
import 'package:vds/setting/setting.controller.dart';

class MainBind extends Bindings {
  @override
  void dependencies() {
    Get.put<SettingController>(SettingController());
    Get.put<NotificationController>(NotificationController());
  }
}
