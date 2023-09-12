import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vds/asset/Image.asset.dart';
import 'component/icon.notification.dart';
import 'main.app.controller.dart';

class MainAppPage extends GetView<MainAppController> {
  const MainAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return PageView(
          onPageChanged: controller.onChangeTabController,
          controller: controller.pageController,
          children: controller.pages,
        );
      }),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: controller.onChangeTab,
          currentIndex: controller.currentIndex.value,
          fixedColor: Get.theme.primaryColor,
          selectedIconTheme: IconThemeData(color: Get.theme.primaryColor),
          selectedLabelStyle: const TextStyle(color: Colors.red),
          unselectedLabelStyle: const TextStyle(color: Colors.blue),
          items: IconHome.values.map((element) {
            return BottomNavigationBarItem(
              icon: Stack(
                alignment: Alignment.topRight,
                children: [
                  element.iconUnActive,
                  Obx(() {
                    if(controller.notifyCount.value > 0
                        && element == IconHome.bell) {
                      return Container(
                        width: 16,
                        height: 16,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          '${controller.notifyCount.value}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 9,
                          ),
                        ),
                      );
                    }
                    return const SizedBox.shrink();
                  })
                ],
              ),
              activeIcon: Padding(
                padding: const EdgeInsets.only(bottom: 3.0),
                child: element.iconActive,
              ),
              label: element.text,
            );
          }).toList(),
        );
      }),
    );
  }
}

enum IconHome { dashboard, order, bell, account }

extension IconHomeExtension on IconHome {
  String get text => _text();

  _text() {
    switch (this) {
      case IconHome.dashboard:
        return 'Dashboard'.tr;
      case IconHome.order:
        return 'Đơn Hàng'.tr;
      case IconHome.bell:
        return 'Thông báo'.tr;
      case IconHome.account:
        return 'Tài khoản'.tr;
    }
  }

  bool isCurrent(int index) {
    return this == IconHome.values[index];
  }

  Widget get iconActive => _iconActive();

  _iconActive() {
    switch (this) {
      case IconHome.dashboard:
        return SvgPicture.asset(
          ImageAsset.icDashboard,
          width: 25,
          height: 25,
          color: Get.theme.primaryColor,
        );
      case IconHome.order:
        return SvgPicture.asset(
          ImageAsset.icOrder,
          width: 25,
          height: 25,
          color: Get.theme.primaryColor,
        );
      case IconHome.bell:
        return const IconNotification(isActive: true);
      case IconHome.account:
        return SvgPicture.asset(
          ImageAsset.icUser,
          width: 25,
          height: 25,
          color: Get.theme.primaryColor,
        );
    }
  }

  Widget get iconUnActive => _iconUnActive();

  _iconUnActive() {
    switch (this) {
      case IconHome.dashboard:
        return SvgPicture.asset(
          ImageAsset.icDashboard,
          width: 25,
          height: 25,
          color: const Color(0xFFA1A2A3),
        );
      case IconHome.order:
        return SvgPicture.asset(
          ImageAsset.icOrder,
          width: 25,
          height: 25,
          color: const Color(0xFFA1A2A3),
        );
      case IconHome.bell:
        return const IconNotification(isActive: false);
      case IconHome.account:
        return SvgPicture.asset(
          ImageAsset.icUser,
          width: 25,
          height: 25,
          color: const Color(0xFFA1A2A3),
        );
    }
  }
}
