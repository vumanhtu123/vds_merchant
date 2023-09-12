import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:vds/base/base_controller.dart';
import 'package:vds/base/request/invoice_request.dart';
import 'package:vds/base/routes.dart';
import 'package:vds/common/enums.dart';
import '../../base/request/merchant_transaction_details_request.dart';
import '../../model/details.transaction.model.dart';
import '../../model/invoice_response.dart';
import '../../model/order.details.model.dart';

class CreateOrderQRBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateOrderQRController>(() => CreateOrderQRController());
  }
}

class CreateOrderQRController extends BaseController {
  final Rx<Data> details = Data().obs;
  String idOrder = '';
  Timer? _timer;
  int secondCountDown = 0;
  RxString timerCountDown = ''.obs;
  bool? check;
  Rx<InvoiceData> invoice = InvoiceData().obs;
  String? idTrans = '';
  String? codeTransaction = '';
  Rx<DataTransaction> detailsTran = DataTransaction().obs;
  String? checkStatus;
  Rx<MerAppState> appState = MerAppState.loading.obs;

  @override
  void onInit() {
    if (Get.arguments != null && Get.arguments is Map) {
      idOrder = Get.arguments["id"];
      check = Get.arguments["check"];
      idTrans = Get.arguments["idTransaction"];
      codeTransaction = Get.arguments["codeTransaction"];
      getOrderDetail();
      getInvoices();
      merchantDetailsTransaction();
    }
    debugPrint(idOrder);
    super.onInit();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void merchantDetailsTransaction() async {
    final request = TransactionDetailsRequest(id: idTrans!);
    appState.value = MerAppState.loading;
    await getDetailsTransaction(request).then((value) async {
      appState.value = MerAppState.success;
      if (value.message == "Success") {
        detailsTran.value = value.data!;
      }
      // print(idTrans.value.toString());
    }).catchError((error) {
      debugPrint(error.toString());
      appState.value = MerAppState.failed;
    });
  }

  _createCountDownTimer() {
    secondCountDown = details.value.expireTime ?? 0;
    if (secondCountDown <= 0) {
      return;
    }
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      secondCountDown--;
      if (secondCountDown == 0) {
        details.value.expireTime = -1;
        timer.cancel();
        secondCountDown = 0;
        await getOrderDetail();
        // await checkOrderStatus();
        // secondCountDown = 0;
      } else if (secondCountDown % 10 == 0) {
        await checkOrderStatus();
      }
      int minutes = secondCountDown ~/ 60;
      final seconds = secondCountDown - minutes * 60;
      String strMi = (minutes < 10) ? '0$minutes' : '$minutes';
      String strSe = (seconds < 10) ? '0$seconds' : '$seconds';
      timerCountDown.value = '$strMi:$strSe';
    });
  }

  getInvoices() async {
    final request = InvoiceRequest(id: idOrder);
    await getInvoice(request).then((value) async {
      invoice.value = value.data!;
    });
  }

  // goToHome() {
  //   Get.until((route) => Get.currentRoute == Routes.mainApp);
  // }

  getOrderDetail() async {
    appState.value = MerAppState.loading;
    await merchantDetails(idOrder).then((value) async {
      appState.value = MerAppState.success;
      final detailsData = value.data;
      details.value = detailsData!;
      _createCountDownTimer();
    }).catchError((error) {
      debugPrint(error.toString());
      appState.value = MerAppState.failed;
    }).whenComplete(() async {});
  }

  checkOrderStatus() async {
    await merchantDetails(idOrder).then((value) async {
      checkStatus = value.data?.status;
      if (checkStatus == "SUCCEED") {
        details.value.expireTime = -1;
        _timer?.cancel();
        secondCountDown = 0;
        await Get.toNamed(
          Routes.orderSuccess,
          arguments: {
            "customer": details.value.customerName,
            "order": details.value.orderUUID,
            "value": details.value.originalPrice,
            "code": details.value.orderCode,
            "date": details.value.createdDate,
            "current": details.value.currency
          },
        );
        Get.back();
      }
    }).catchError((error) {
      debugPrint(error.toString());
    }).whenComplete(() async {});
  }
}
