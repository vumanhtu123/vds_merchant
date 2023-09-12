import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:vds/base/base_controller.dart';
import 'package:vds/base/request/orders_request.dart';
import 'package:vds/base/routes.dart';
import 'package:vds/common/enums.dart';
import 'package:vds/widget/my.scroll.controller.dart';

import '../../../../base/request/current_request.dart';
import '../../../../common/api_const.dart';
import '../../../../model/current.model.dart';
import '../../../../model/orders.model.dart';

class StaffDashboardController extends BaseController {
  final RxList<CategoryEnum> categories = <CategoryEnum>[].obs;
  final RxList<Content> orderStaff = <Content>[].obs;
  late MyScrollController scrollController;
  Rx<Datum> current = Datum().obs;
  bool isLoading = false;
  bool hasLoadMore = false;
  int page = 0;
  bool? errorNetwork = false;

  Future<List<CategoryEnum>> getCategoriesStaff() async {
    return [
      CategoryEnum.createOrder,
      CategoryEnum.historyOrder,
      CategoryEnum.sale,
      // CategoryEnum.qr,
    ];
  }

  @override
  void onInit() {
    scrollController = MyScrollController(_loadMore);
    getCategory();
    getOrdersDashBoard();
    getCurrentMerchant();
    super.onInit();
  }

  void getCategory() async {
    var temp = await getCategoriesStaff();
    categories.clear();
    categories.addAll(temp);
  }

  goToDetail(Content order) {
    Get.toNamed(Routes.creatOrderQR, arguments: {"id": order.orderUUID});
  }

  void _loadMore() async {
    // if (orderStaff.length > 10) {
    //   scrollController.updateFull();
    // }
    if (!isLoading && hasLoadMore) {
      page = page + 1;
      debugPrint('_loadMore');
    }
  }

  didTapItem(CategoryEnum cEnum) async {
    switch (cEnum) {
      case CategoryEnum.createOrder:
        await Get.toNamed(Routes.creatOrder);
        await getOrdersDashBoard();
        break;
      case CategoryEnum.historyOrder:
        Get.toNamed(Routes.staffHistoryOrder);
        break;
      case CategoryEnum.revokeMoneyHO:
        Get.toNamed(Routes.revokeMoneyHO);
        break;
      case CategoryEnum.revokeMoney:
        Get.toNamed(Routes.revokeMoney);
        break;
      case CategoryEnum.sale:
        Get.toNamed(Routes.sale,
            arguments: {"id_merchant": current.value.merchantId});
        break;
    }
  }

  Future<void> getCurrentMerchant() async {
    await currentMerchant(CurrentMerchantRequest()).then((value) {
      if (value.message == "Success") {
        current.value = value.data!;
      } else {
        print(value.message);
      }
    }).catchError((error) {
      print(error);
    }).whenComplete(() {});
  }

  Future<void> getOrdersDashBoard() async {
    if (isLoading) return;
    isLoading = true;
    final request = OrdersRequest(
      size: 4,
      createdFrom:
          DateTime.now().subtract(const Duration(days: 30)).toUtc().toString(),
      createdTo: DateTime.now().toUtc().toString(),
      page: 0,
    );
    await merchantOrders(request).then((value) async {
      if (value.message == 'Success') {
        final contents = value.data?.content ?? [];
        hasLoadMore = contents.length == ApiConst.size;
        if (page == 0) orderStaff.clear();
        orderStaff.addAll(contents);
        errorNetwork = false;
      } else {
        errorNetwork = true;
        // showErrorNetwork('Error', 'Network Error');
      }
    }).catchError((error) {
      // showErrorNetwork('Error', 'Network Error');
    }).whenComplete(() async {
      isLoading = false;
    });
  }
}
