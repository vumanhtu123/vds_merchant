import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vds/app/mainapp/account/component/menu.account.dart';
import 'package:vds/app/mainapp/component/app.bar.home.dart';
import 'merchant.account.controller.dart';

class MerchantAccountPage extends GetView<MerchantAccountController> {
  const MerchantAccountPage({super.key});

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
                show: null,
              ),
              MenuAccount(
                menuItem: controller.menuItems,
                onTapItem: (item) => controller.onTapItem(item),
              )
            ],
          ),
        ),
      ),
    );
  }
}
