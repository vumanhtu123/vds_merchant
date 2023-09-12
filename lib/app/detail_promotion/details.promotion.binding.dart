import 'package:get/get.dart';
import 'details.promotion.controller.dart';

class DetailsPromotionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailsPromotionController>(() => DetailsPromotionController());
  }
}
