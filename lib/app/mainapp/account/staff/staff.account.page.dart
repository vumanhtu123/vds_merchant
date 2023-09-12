import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vds/app/mainapp/account/component/menu.account.dart';
import 'package:vds/app/mainapp/account/component/staff.menu.account.dart';
import 'package:vds/app/mainapp/component/app.bar.home.dart';
import 'staff.account.controller.dart';

class StaffAccountPage extends GetView<StaffAccountController> {
  const StaffAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Column(
          children: [
            AppbarHome(
              title: 'Tài khoản'.tr,
              show: false,
            ),
            StaffMenuAccount(
              menuItem: controller.list(),
              onTapItem: (item) => controller.onTapItem(item),
            )
          ],
        )),
      ),
    );
  }
}
