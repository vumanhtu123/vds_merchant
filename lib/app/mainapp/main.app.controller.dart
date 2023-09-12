import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vds/app/mainapp/account/merchant/merchant.account.page.dart';
import 'package:vds/app/mainapp/dashboard/merchant/merchant.dashboard.page.dart';
import 'package:vds/app/mainapp/dashboard/staff/staff.dashboard.page.dart';
import 'package:vds/app/mainapp/notification/merchant/merchant.notification.page.dart';
import 'package:vds/app/mainapp/notification/staff/staff.notification.page.dart';
import 'package:vds/app/mainapp/order/merchant/merchant.order.controller.dart';
import 'package:vds/app/mainapp/order/merchant/merchant.order.page.dart';
import 'package:vds/app/mainapp/order/staff/staff.order.page.dart';
import 'package:vds/base/base_controller.dart';
import 'package:vds/base/request/notify_count_request.dart';
import 'package:vds/common/storage_data.dart';
import 'package:vds/notification/fcm_conttroller.dart';
import 'package:vds/setting/setting.controller.dart';
import 'account/merchant/merchant.account.controller.dart';
import 'account/staff/staff.account.controller.dart';
import 'account/staff/staff.account.page.dart';
import 'dashboard/merchant/merchant.dashboard.controller.dart';
import 'dashboard/staff/staff.dashboard.controller.dart';
import 'notification/merchant/merchant.notification.controller.dart';
import 'notification/staff/staff.notification.controller.dart';
import 'order/staff/staff.order.controller.dart';

class MainAppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainAppController>(() => MainAppController());
    final settingsController = Get.find<SettingController>();
    if (settingsController.isMerchant()) {
      Get.lazyPut<MerchantDashboardController>(
              () => MerchantDashboardController());
      Get.lazyPut<MerchantOrderController>(() => MerchantOrderController());
      Get.lazyPut<MerchantNotificationController>(
              () => MerchantNotificationController());
      Get.lazyPut<MerchantAccountController>(() => MerchantAccountController());
    } else {
      Get.lazyPut<StaffDashboardController>(() => StaffDashboardController());
      Get.lazyPut<StaffOrderController>(() => StaffOrderController());
      Get.lazyPut<StaffNotificationController>(
              () => StaffNotificationController());
      Get.lazyPut<StaffAccountController>(() => StaffAccountController());
    }
    final isFCMRegistered = Get.isRegistered<FCMController>();
    if (isFCMRegistered == false) {
      Get.put(() => FCMController());
    }
  }
}

class MainAppController extends BaseController {
  final RxList<Widget> pages = <Widget>[].obs;
  final settingsController = Get.find<SettingController>();
  PageController? pageController;
  final currentIndex = 0.obs;
  final notifyCount = 0.obs;

  @override
  void onInit() {
    ever(currentIndex, _onChangeIndex);
    pageController = PageController();
    changeTypeLogin();
    super.onInit();
    onGetNotifyCount();
  }

  @override
  void dispose() {
    pageController?.dispose();
    super.dispose();
  }

  changeTypeLogin() {
    pages.clear();
    if (settingsController.isMerchant()) {
      pages.addAll([
        const MerchantDashboardPage(),
        const MerchantOrderPage(),
        const MerchantNotificationPage(),
        const MerchantAccountPage()
      ]);
    } else {
      pages.addAll([
        const StaffDashboardPage(),
        const StaffOrderPage(),
        const StaffNotificationPage(),
        const StaffAccountPage()
      ]);
    }
    pages.refresh();
  }

  Future<void> onChangeTab(int tabIndex) async {
    if (currentIndex.value != tabIndex) {
      if ((tabIndex - currentIndex.value).abs() > 1) {
        await pageController?.animateToPage(
          tabIndex,
          duration: const Duration(milliseconds: 200),
          curve: Curves.linear,
        );
      } else {
        await pageController?.animateToPage(
          tabIndex,
          duration: const Duration(milliseconds: 200),
          curve: Curves.linear,
        );
      }
      currentIndex.value = tabIndex;
    }
  }

  void onChangeTabController(int tabIndex) {
    if (currentIndex.value != tabIndex) {
      currentIndex.value = tabIndex;
    }
  }

  _onChangeIndex(int index) {
    if (settingsController.isMerchant()) {
      switch (index) {
        case 0:
          Get.find<MerchantDashboardController>().getOrdersDashBoard();
          break;
        case 1:
            Get.find<MerchantOrderController>().onGetMerchantOrder();
          break;
        case 2:
          Get.find<MerchantNotificationController>().getNotification();
          break;
        case 3:
          Get.find<MerchantAccountController>().getInfo();
          break;
      }
    } else {
      switch (index) {
        case 0:
          Get.find<StaffDashboardController>().getOrdersDashBoard();
          break;
        case 1:
          Get.find<StaffOrderController>().staffOrder();
          break;
        case 2:
          Get.find<StaffNotificationController>().getNotification();
          break;
        case 3:
          Get.find<StaffAccountController>().getInfo();
          break;
      }
    }
  }

  void onGetNotifyCount() async {
    getNotifyCount(NotifyCountRequest()).then((value) {
      notifyCount.value = value.data?.count ?? 0;
      StorageData.instance.setNotifyCount(value.data?.count ?? 0);
    });
  }

}
