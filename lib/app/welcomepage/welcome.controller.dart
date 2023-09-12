import 'package:get/get.dart';
import 'package:vds/base/routes.dart';
import 'package:vds/common/storage_data.dart';

class WelcomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WelcomeController>(() => WelcomeController());
  }
}

class WelcomeController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    StorageData.instance.setTheFirst();
  }
  void goToMerchantLogin() {
    Get.toNamed(Routes.login);
  }

  void goToStaffLogin() {
    Get.toNamed(Routes.login);
  }
}
