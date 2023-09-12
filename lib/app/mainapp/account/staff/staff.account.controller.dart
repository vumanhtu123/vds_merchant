import 'package:get/get.dart';
import 'package:vds/app/mainapp/account/component/menu.account.dart';
import 'package:vds/app/mainapp/account/component/staff.menu.account.dart';
import 'package:vds/base/base_controller.dart';
import '../../../../base/routes.dart';
import '../component/bottom.sheet.changelanguage.dart';

class StaffAccountController extends BaseController {
  var menuItems = MenuAccountEnum.values;

  List<StaffMenuAccountEnum> list() {
    return [
      StaffMenuAccountEnum.infoMerchant,
      StaffMenuAccountEnum.changePass,
      StaffMenuAccountEnum.settingLanguage,
      StaffMenuAccountEnum.qr,
      StaffMenuAccountEnum.logout
    ];
  }

  void getInfo() {}

  onTapItem(StaffMenuAccountEnum item) async {
    switch (item) {
      case StaffMenuAccountEnum.infoMerchant:
        Get.toNamed(Routes.infoStaff);
        break;
      case StaffMenuAccountEnum.changePass:
        Get.toNamed(Routes.changePassStaff);
        break;
      case StaffMenuAccountEnum.settingLanguage:
        Get.bottomSheet(const BottomSheetChangeLanguage());
        break;
      case StaffMenuAccountEnum.qr:
        Get.toNamed(Routes.qrStaff);
        break;
      case StaffMenuAccountEnum.logout:
        showLogout();
        break;
    }
  }
}
