import 'package:get/get.dart';
import 'package:vds/base/routes.dart';

import '../../model/transition.model.dart';

class CreateOrderSuccessBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateOrderSuccessController>(
        () => CreateOrderSuccessController());
  }
}

class CreateOrderSuccessController extends GetxController {
  final Rx<Content> order = Content().obs;
  String? customer = "";
  String? orders = "";
  num value = 0;
  String? code = "";
  String? date = "";
  String? current = "";

  @override
  void onInit() {
    if (Get.arguments is Map) {
      customer = Get.arguments["customer"];
      orders = Get.arguments["order"];
      value = Get.arguments["value"];
      code = Get.arguments["code"];
      date = Get.arguments["date"];
      current = Get.arguments["current"];
    }
    print("dat1 ${orders}");
    print("dat2 ${orders}");
    print("dat3 ${orders}");
    print("dat4 ${orders}");
    // getOrderDetail();
    super.onInit();
  }

  Future<void> getOrderDetail() async {
    // order.value = await reposity.getOrderDetail(idOrder);
  }

  // goToHome() {
  //   Get.until((route) => Get.currentRoute == Routes.mainApp);
  // }
}
