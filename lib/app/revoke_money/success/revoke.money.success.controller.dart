import 'package:get/get.dart';
import 'package:vds/base/routes.dart';

import '../../../model/details.promotion.model.dart';

class RevokeMoneySuccessBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RevokeMoneySuccessController>(
        () => RevokeMoneySuccessController());
  }
}

class RevokeMoneySuccessController extends GetxController {
  final transactionId = 0.obs;
  final requestDate = ''.obs;
  final currency = ''.obs;
  final values = 0.0.obs;

  @override
  void onInit() {
    if (Get.arguments is Map) {
      transactionId.value = Get.arguments['transactionId'];
      currency.value = Get.arguments['currency'];
      values.value = Get.arguments['values'];
      requestDate.value = Get.arguments['requestDate'];
    }
    super.onInit();
  }

  void close() {
    Get.offNamedUntil(
        Routes.mainApp, (route) => Get.currentRoute == Routes.mainApp);
  }

// void close() {
//   Get.until((route) => Get.currentRoute == Routes.mainApp);
// }
}
