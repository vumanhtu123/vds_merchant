import 'package:get/get.dart';
import 'package:vds/base/routes.dart';
import 'package:vds/model/orders.model.dart';
import 'package:vds/widget/my.scroll.controller.dart';

import '../../../../base/base_controller.dart';
import '../../../../base/request/orders_request.dart';
import '../../../../common/enums.dart';

class StaffOrderController extends BaseController {
  final RxList<Content> orders = <Content>[].obs;
  late MyScrollController scrollController;
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
    if (orders.length > 10) {
      scrollController.updateFull();
    } else {
      // var temp = await reposity.getMoreOrderStaff();
      // orders.addAll(temp);
      // orders.refresh();
    }
  }

  void goToCreateOrderPage() {
    Get.toNamed(Routes.creatOrder);
  }

  staffOrder() async {
    appState.value = MerAppState.loading;
    final request = OrdersRequest(
      createdFrom:
          DateTime.now().subtract(const Duration(days: 30)).toUtc().toString(),
      createdTo: DateTime.now().toUtc().toString(),
      page: 0,
    );
    await merchantOrders(request).then((value) async {
      if (value.message == 'Success') {
        final orderData = value.data?.content ?? [];
        orders.clear();
        orders.addAll(orderData);
        appState.value = MerAppState.success;
      } else {
        // showErrorNetwork('Error', 'Network Error');
        errorNetwork.isTrue;
        // appState.value = MerAppState.failed;
      }
    }).catchError((error) {
      appState.value = MerAppState.failed;
    }).whenComplete(() async {});
  }
}
