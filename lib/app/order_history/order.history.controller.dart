import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vds/base/base_controller.dart';
import 'package:vds/base/request/merchant_transactions_request.dart';
import 'package:vds/common/enums.dart';
import 'package:vds/helper/convert.dart';
import 'package:vds/model/transition.model.dart';
import 'package:vds/widget/my.scroll.controller.dart';

import '../../base/request/merchant_withdraw_money_request.dart';
import '../../base/routes.dart';
import '../../model/invoice_response.dart';
import '../../model/withdraw.money.model.dart';

class OrderHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderHistoryController>(() => OrderHistoryController());
  }
}

class OrderHistoryController extends BaseController {
  final RxList<Content> transitions = RxList();
  final RxList<Contents> withdraw = RxList();
  late MyScrollController scrollController;
  final chooseTime = ValueNotifier<DateTime>(DateTime.now());
  RxInt filterType = 1.obs; //1-Thanh toán đơn hàng, 2-Rút tiền
  Rx<MerAppState> appState = MerAppState.loading.obs;
  bool? checkInternet = false;

  List<DateTime> get listTime => _getDateTime();
  Rx<InvoiceData> invoice = InvoiceData().obs;
  RxString idTrans = ''.obs;
  DateTime startDate = DateTime.now();

  List<DateTime> _getDateTime() {
    var currentDate = DateTime.now();
    var listDateTime = <DateTime>[];

    for (var i = 0; i < 30; i++) {
      listDateTime.add(DateTime(currentDate.year, currentDate.month - i));
    }
    return listDateTime;
  }

  @override
  void onInit() {
    scrollController = MyScrollController(_loadMore);
    int lastDay = DateTime(startDate.year, startDate.month + 1, 0).day -
        startDate.day;
    int affTer =
        DateTime(startDate.year, startDate.month, 6).day - 10;
    merchantHistory(startDate.add(Duration(days: affTer)),
        startDate.add(Duration(days: lastDay)));

    merchantWithdrawMoney(startDate.add(Duration(days: affTer)),
        startDate.add(Duration(days: lastDay)));
    super.onInit();
  }

  void _loadMore() async {
    // if (transitions.length > 10) {
    //   scrollController.updateFull();
    // } else {
    // var temp = await reposity.getMoreTransition(
    //     chooseTime.value.month, chooseTime.value.year);
    // transitions.addAll(temp);
    // transitions.refresh();
  }

  onDateFilter(DateTime date) {
    startDate = date;
    int lastDay = DateTime(date.year, date.month + 1, 0).day;
    if (filterType.value == 1) {
      merchantHistory(date, date.add(Duration(days: lastDay)));
    } else if (filterType.value == 2) {
      merchantWithdrawMoney(date, date.add(Duration(days: lastDay)));
    }
  }

  onChangedFilter(int type) {
    filterType.value = type;
    int lastDay = DateTime(startDate.year, startDate.month + 1, 0).day -
        startDate.day;
    int affTer =
        DateTime(startDate.year, startDate.month, 6).day - 10;
    merchantHistory(startDate.add(Duration(days: affTer)),
        startDate.add(Duration(days: lastDay)));

    merchantWithdrawMoney(startDate.add(Duration(days: affTer)),
        startDate.add(Duration(days: lastDay)));
  }

  void merchantHistory(DateTime date, DateTime endDate) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      checkInternet = true;
    }
    final request = MerchantTransactionsRequest(
      createdFrom: Convert.dateToString(date, "yyyy-MM-dd"),
      createdTo: Convert.dateToString(endDate, "yyyy-MM-dd"),
      page: 0,
    );
    appState.value = MerAppState.loading;
    await merchantTransaction(request).then((value) async {
      appState.value = MerAppState.success;
      final orderData = value.data?.content ?? [];
      transitions.clear();
      transitions.addAll(orderData);
    }).catchError((error) {
      debugPrint(error.toString());
      appState.value = MerAppState.failed;
    });
  }

  void merchantWithdrawMoney(DateTime date, DateTime endDate) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      checkInternet = true;
    }
    final request = MerchantTransactionsMoneyRequest(
      createdFrom: Convert.dateToString(date, "yyyy-MM-dd"),
      createdTo: Convert.dateToString(endDate, "yyyy-MM-dd"),
      page: 0,
    );
    appState.value = MerAppState.loading;
    await merchantWithdraw(request).then((value) async {
      appState.value = MerAppState.success;
      final withdrawData = value.data?.content ?? [];
      withdraw.clear();
      withdraw.addAll(withdrawData);
    }).catchError((error) {
      debugPrint(error.toString());
      appState.value = MerAppState.failed;
    }).whenComplete(() async {});
  }

  void gotoDetailsTransaction(String id, String orderId, bool check, String code) async {
    if (orderId.isNotEmpty) {
      await Get.toNamed(Routes.creatOrderQR, arguments: {
        "idTransaction": id,
        "id": orderId,
        "check": check,
        "codeTransaction": code
      });
    } else {
      return;
    }
  }
}
