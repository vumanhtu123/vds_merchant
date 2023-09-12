import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vds/app/mainapp/component/app.bar.home.dart';
import 'package:vds/app/mainapp/notification/component/notification.list.dart';

import 'merchant.notification.controller.dart';

class MerchantNotificationPage extends GetView<MerchantNotificationController> {
  const MerchantNotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            AppbarHome(title: 'Thông báo'.tr),
            Expanded(
              child: Obx(() {
                if (controller.contentNoti.isEmpty) {
                  return const SizedBox.shrink();
                } else if (controller.errorNetwork.value == true) {
                  return const Center(child: Text('Network Error'));
                }
                return NotificationList(
                  controller.contentNoti,
                  onClickItem: controller.onClickItem,
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
