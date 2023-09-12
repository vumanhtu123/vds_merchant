import 'package:get/get.dart';
import 'package:vds/base/request/orders_request.dart';
import 'package:vds/base/routes.dart';
import 'package:vds/common/enums.dart';
import 'package:vds/model/orders.model.dart';
import 'package:vds/widget/my.scroll.controller.dart';

import '../../../../base/base_controller.dart';

class MerchantOrderController extends BaseController {
  final RxList<Content> orders = <Content>{}.toList().obs;
  MyScrollController? scrollController;
  Rx<MerAppState> appState = MerAppState.loading.obs;
  RxBool errorNetwork = false.obs;

  @override
  void onInit() {
    scrollController = MyScrollController(_loadMore);
    super.onInit();
  }

  goToDetail(Content order) {
    Get.toNamed(Routes.creatOrderQR, arguments: {"id": order.orderUUID});
  }

  void _loadMore() async {
    // if (orders.length > 10) {
    //   scrollController.resetLoadMore();
    // } else {
    // var temp = await reposity.getMoreOrderMerchant();
    // orders.addAll(temp);
    // orders.refresh();
    // }
  }

  void goToCreateOrderPage() async {
    await Get.toNamed(Routes.creatOrder);
    onGetMerchantOrder();
  }

  void onGetMerchantOrder() async {
    appState.value = MerAppState.loading;
    final cDate = DateTime.now();
    final request = OrdersRequest(
      createdFrom: cDate.subtract(const Duration(days: 30)).toUtc().toString(),
      createdTo: cDate.toUtc().toString(),
      page: 0,
    );
    await merchantOrders(request).then((value) {
      if (value.message == 'Success') {
        final orderData = value.data?.content ?? [];
        orders.clear();
        orders.addAll(orderData);
        appState.value = MerAppState.success;
        errorNetwork.value = false;
      } else {
        appState.value = MerAppState.failed;
        errorNetwork.value = true;
        // showErrorNetwork('Error', 'Network Error');
      }
    }).catchError((error) {
      appState.value = MerAppState.failed;
    });
  }
}
