import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vds/app/mainapp/account/component/bottom.sheet.changelanguage.dart';
import 'package:vds/app/mainapp/account/component/menu.account.dart';
import 'package:vds/base/base_controller.dart';
import 'package:vds/base/request/unregister_device_token_request.dart';
import 'package:vds/base/routes.dart';
import 'package:vds/common/storage_data.dart';

class MerchantAccountController extends BaseController {

  var menuItems = MenuAccountEnum.values;

  void getInfo() {}

  onTapItem(MenuAccountEnum item) async {
    switch (item) {
      case MenuAccountEnum.infoMerchant:
        Get.toNamed(Routes.infoMerchant);
        break;
      case MenuAccountEnum.resetPIN:
        Get.toNamed(Routes.merchantResetPin);
        break;
      case MenuAccountEnum.changePass:
        Get.toNamed(Routes.changePass);
        break;
      case MenuAccountEnum.settingLanguage:
        Get.bottomSheet(const BottomSheetChangeLanguage());
        break;
      case MenuAccountEnum.qr:
        Get.toNamed(Routes.qrAccount);
        break;
      case MenuAccountEnum.logout:
        // final result = await showAppDialog(
        //   title: 'Đăng xuất'.tr,
        //   message: 'Bạn chắc chắn muốn đăng xuất'.tr,
        //   actions: [
        //     TextButton(
        //       child: const Text('Ok'),
        //       onPressed: () => Get.back(result: true),
        //     ),
        //     TextButton(
        //       child: Text('Bỏ qua'.tr),
        //       onPressed: () => Get.back(result: false),
        //     ),
        //   ]
        // );
       final result = await showLogout();
        if(result is bool && result == true) {
          final request = UnregisterDeviceTokenRequest(
            token: StorageData.instance.getDeviceStore() ?? "",
          );
          await openLoadingDialog();
          final response = await unregisterDeviceToken(request).catchError((error) async {
            await closeLoadingDialog();
            await showErrorDialog(message: error?.toString() ?? "");
          });
          await closeLoadingDialog();
          if(response?.isSuccess() == true) {
            await StorageData.instance.onLogout();
            Get.offNamed(Routes.login);
          } else {
            await showErrorDialog(message: response?.errorDescription);
          }
        }
        break;
    }
  }
}
