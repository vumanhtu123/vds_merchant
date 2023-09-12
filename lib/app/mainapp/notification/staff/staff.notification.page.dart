import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vds/app/mainapp/component/app.bar.home.dart';
import 'package:vds/app/mainapp/notification/component/notification.list.dart';

import 'staff.notification.controller.dart';

class StaffNotificationPage extends GetView<StaffNotificationController> {
  const StaffNotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              children: [
                AppbarHome(
                  title: 'Thông báo'.tr, show: false,
                ),
                Expanded(
                  child: Obx(() =>
                  controller.contentNoti.isEmpty
                      ? const SizedBox.shrink()
                      : controller.errorNetwork.value == true
                          ? const Center(
                              child: Text('Network Error'),
                            )
                          : NotificationList(
                              controller.contentNoti
                                  .map((element) => element)
                                  .toList(),
                              onClickItem: controller.onClickItem)),
                )
              ],
            )));
  }
}
