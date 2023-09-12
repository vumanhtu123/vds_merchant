import 'package:get/get.dart';
import 'package:vds/base/base_controller.dart';
import 'package:vds/base/request/promotion_request.dart';
import 'package:vds/base/routes.dart';
import 'package:vds/common/enums.dart';
import 'package:vds/model/promotion.model.dart';

import '../../helper/convert.dart';
import '../../widget/my.scroll.controller.dart';

class PromotionController extends BaseController {
  Rx<MerAppState> appState = MerAppState.loading.obs;
  RxBool errorNetwork = false.obs;
  final RxList<Content> promotion = <Content>{}.toList().obs;

  late MyScrollController scrollController;
  var idMerchant = 0;

  @override
  void onInit() {
    if (Get.arguments is Map) {
      idMerchant = Get.arguments["id_merchant"];
    }
    print("id : $idMerchant");
    merchantListPromotion();
    scrollController = MyScrollController(_loadMore);
    super.onInit();
  }

  void gotoDetails(int id) {
    Get.toNamed(Routes.detailsPromotion, arguments: id);
  }

  void _loadMore() async {}

  void merchantListPromotion() async {
    appState.value = MerAppState.loading;
    final request = PromotionRequest(page: 0, size: 20, merchantId: idMerchant);
    await merchantPromotion(request).then((value) async {
      if (value.data?.content != null) {
        final orderData = value.data?.content ?? [];
        promotion.addAll(orderData);
        promotion.refresh();
        appState.value = MerAppState.success;
        errorNetwork.value = false;
      } else {
        appState.value = MerAppState.failed;
        errorNetwork.value = true;
      }
    }).catchError((error) {
      appState.value = MerAppState.failed;
      print(error.toString());
    }).whenComplete(() async {});
  }

  String convertStartDate(String start) {
    return Convert.stringToDatePromotion(
      start,
    );
  }

  String convertEndDate(String endDate) {
    return Convert.stringToDatePromotion(
      endDate,
    );
  }
}
