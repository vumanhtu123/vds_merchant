import 'dart:math';

import 'package:get/get.dart';
import 'package:vds/base/base_controller.dart';
import 'package:vds/base/routes.dart';
import 'package:vds/model/details.transaction.model.dart';
import 'package:vds/widget/my.scroll.controller.dart';

import '../../base/request/merchant_transaction_details_request.dart';
import '../../model/invoice_response.dart';

class DetailsPaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailsPaymentController>(() => DetailsPaymentController());
  }
}

class DetailsPaymentController extends BaseController {
  late MyScrollController scrollController;
  late String idTrans = '';

  Rx<DataTransaction?> detailsTran = DataTransaction().obs;

  @override
  void onInit() {
    if (Get.arguments is String) {
      // bankSuccess.value = Get.arguments;
      idTrans = Get.arguments;
    }
    merchantDetailsTransaction();
    scrollController = MyScrollController(_loadMore);
    super.onInit();
  }

  void merchantDetailsTransaction() async {
    final request = TransactionDetailsRequest(id: idTrans);
    await getDetailsTransaction(request).then((value) async {
      if (value.message == "Success") {
        detailsTran.value = value.data;
      }
      // print(idTrans.value.toString());
    });
  }

  void gotoOrderDetails(String? id, bool check) {
    Get.toNamed(Routes.creatOrderQR, arguments: {"id": id, "check": check});
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
}
