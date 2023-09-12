import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vds/app/mainapp/main.app.controller.dart';
import 'package:vds/asset/Image.asset.dart';
import 'package:vds/base/base_controller.dart';
import 'package:vds/base/request/current_request.dart';
import 'package:vds/base/request/merchant_balance_request.dart';
import 'package:vds/base/request/orders_request.dart';
import 'package:vds/base/routes.dart';
import 'package:vds/common/api_const.dart';
import 'package:vds/common/enums.dart';
import 'package:vds/helper/convert.dart';
import 'package:vds/model/current.model.dart';
import 'package:vds/model/orders.model.dart';
import 'package:vds/widget/my.scroll.controller.dart';

class MerchantDashboardController extends BaseController {
  final RxList<CategoryEnum> categories = <CategoryEnum>[].obs;
  final RxList<Content> orders = <Content>[].obs;
  MyScrollController? scrollController;
  RxDouble userBalance = (-1.0).obs;
  Rx<Datum> current = Datum().obs;
  RxBool isBlind = true.obs;
  RxBool isLoading = false.obs;
  bool hasLoadMore = false;
  // String idOrder = '';
  int page = 0;
  RxBool errorNetwork = false.obs;

  @override
  void onInit() {
    // if (Get.arguments is String) {
    //   idOrder = Get.arguments;
    //   print("id : $idOrder");
    // }
    scrollController = MyScrollController(_loadMore);
    getCategory();
    // getRefreshScreen();
    initData();
    super.onInit();
  }

  // getRefreshScreen() async {
  //   if (idOrder == "refresh") {
  //     await getOrdersDashBoard();
  //   }
  // }

  void getCategory() {
    var temp = CategoryEnum.values;
    categories.clear();
    categories.addAll(temp);
  }

  void initData() async {
    getCurrentMerchant();
    await getOrdersDashBoard();
    await getMerchantBalance();
  }

  goToDetail(Content order) async {
    await getOrdersDashBoard();
    if (errorNetwork.isTrue) return showErrorNetwork('Error', 'Network Error');
    await Get.toNamed(Routes.creatOrderQR, arguments: {"id": order.orderUUID});
    await getOrdersDashBoard();
  }

  String getPriceText() {
    return userBalance.value < 0
        ? "Undefined"
        : '${Convert.convertMoney(userBalance.value)} USD';
  }

  goToOrder() {
    if (Get.isRegistered<MainAppController>()) {
      Get.find<MainAppController>().onChangeTab(1);
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

  didTapItem(CategoryEnum cEnum) async {
    switch (cEnum) {
      case CategoryEnum.createOrder:
        await Get.toNamed(Routes.creatOrder);
        await getOrdersDashBoard();
        break;
      case CategoryEnum.historyOrder:
        Get.toNamed(Routes.historyOrder);
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
        print(current.value.merchantId);
        break;
    }
  }

  void _loadMore() async {
    // if (orders.length > 10) {
    //   scrollController.updateFull();
    // } else {}
    if (!isLoading.value && hasLoadMore) {
      page = page + 1;
      debugPrint('_loadMore');
    }
  }

  Future<void> getMerchantBalance() async {
    await merchantBalance(MerchantBalanceRequest())
        .then((value) {
          if (value.message == "Success") {
            userBalance.value = (value.data?.amount ?? -1);
          }
        })
        .catchError((error) {})
        .whenComplete(() {});
  }

  Future<void> getOrdersDashBoard() async {
    try {
      if (isLoading.value) return;
      isLoading.value = true;
      orders.clear();
      final date = DateTime.now();
      final request = OrdersRequest(
        createdFrom: date.subtract(const Duration(days: 62)).toString(),
        createdTo: date.toString(),
        page: 0,
      );
      await merchantOrders(request).then((value) async {
        if (value.message == 'Success') {
          final contents = value.data?.content ?? [];
          hasLoadMore = contents.length == ApiConst.size;
          if (page != 0) orders.clear();
          orders.addAll(contents);
          errorNetwork.value = false;
        } else {
          errorNetwork.value = true;
        }
      }).catchError((error) {
        showErrorNetwork('Error', 'Network Error');
        debugPrint(error.toString());
      }).whenComplete(() {
        isLoading.value = false;
      });
    } catch (e) {
      print("object");
    }
  }

  didTapEyeDashBoard() async {
    isBlind.value = !isBlind.value;
    // await getOrdersDashBoard();
  }
}

extension CategoryEnumExtension on CategoryEnum {
  Widget get icon => _icon();

  Widget _icon() {
    switch (this) {
      case CategoryEnum.createOrder:
        return Image.asset(
          ImageAsset.createOrderDashboardIcon,
          width: 45,
          height: 45,
        );
      case CategoryEnum.historyOrder:
        return Image.asset(
          ImageAsset.historyOrderDashboardIcon,
          width: 45,
          height: 45,
        );
      case CategoryEnum.sale:
        return Image.asset(
          ImageAsset.saleDashboardIcon,
          width: 45,
          height: 45,
        );
      case CategoryEnum.revokeMoneyHO:
        return Image.asset(
          ImageAsset.revokeMoneyHODashboardIcon,
          width: 45,
          height: 45,
        );

      case CategoryEnum.revokeMoney:
        return Image.asset(
          ImageAsset.revokeMoneyDashboardIcon,
          width: 45,
          height: 45,
        );
    }
  }

  String get title => _title();

  String _title() {
    switch (this) {
      case CategoryEnum.createOrder:
        return 'Tạo đơn hàng'.tr;
      case CategoryEnum.historyOrder:
        return 'Lịch sử giao dịch'.tr;
      case CategoryEnum.sale:
        return 'Khuyến mãi'.tr;
      case CategoryEnum.revokeMoneyHO:
        return 'Rút tiền tại HO'.tr;
      case CategoryEnum.revokeMoney:
        return 'Chuyển tiền ví/bank'.tr;
    }
  }
}
