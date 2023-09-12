import 'package:get/get.dart';


class NotificationController extends GetxController {
  final countNotificationUnread = 0.obs;

  @override
  void onInit() {
    getCountNotification();
    super.onInit();
  }

  void getCountNotification() {
    // countNotificationUnread.value = 5;
  }
}
