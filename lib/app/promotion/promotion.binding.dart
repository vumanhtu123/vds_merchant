import 'package:get/get.dart';
import 'package:vds/app/promotion/promotion.controller.dart';

class PromotionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PromotionController>(() => PromotionController());
  }
}
