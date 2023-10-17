import 'package:get/get.dart';
import 'package:vds/app/mainapp/account/component/bottom.sheet.changelanguage.dart';
import 'package:vds/app/mainapp/account/component/menu.account.dart';
import 'package:vds/base/base_controller.dart';
import 'package:vds/base/request/logout.request.dart';
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
        final result = await showLogout(onLogout);
        break;
    }
  }

  void onLogout() async {
    await openLoadingDialog();
    logOut(LogoutRequest(), StorageData.instance.getAppToken() ?? '')
        .then((value) async {
      if (value.message == "Success") {
        await closeLoadingDialog();
        print("outttttt");
        StorageData.instance.onLogout();
        Get.offAllNamed(Routes.login);
      } else {
        await showErrorDialog(message: value.errorDescription);
      }
    }).catchError((onError) async {
      await showErrorDialog(message: onError);
    });
  }
}
