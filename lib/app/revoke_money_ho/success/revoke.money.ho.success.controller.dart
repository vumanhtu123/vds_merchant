import 'package:get/get.dart';
import 'package:vds/base/routes.dart';

import '../../../model/info.revoke.success.model.dart';

class RevokeMoneyHOSuccessBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RevokeMoneyHOSuccessController>(
        () => RevokeMoneyHOSuccessController());
  }
}

class RevokeMoneyHOSuccessController extends GetxController {
  Rx<double> amount = 0.0.obs;

  final transactionId = 0.obs;
  final requestDate = ''.obs;
  final currency = ''.obs;
  final values = 0.0.obs;

  @override
  void onInit() {
    if (Get.arguments is Map) {
      // bankSuccess.value = Get.arguments;
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
