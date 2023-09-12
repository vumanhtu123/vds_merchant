import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vds/base/base_controller.dart';
import 'package:vds/base/routes.dart';
import 'package:vds/common/enums.dart';

import '../../base/request/create_order_request.dart';

class CreateOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateOrderController>(() => CreateOrderController());
  }
}

class CreateOrderController extends BaseController {
  Rx<MerAppState> appState = MerAppState.loading.obs;
  String? messageError;
  final numberTextController = TextEditingController();
  final codeTextController = TextEditingController();
  final descriptionTextController = TextEditingController();
  final priceTextController = TextEditingController();
  Rx<String> orderCodeError = ''.obs;
  Rx<String> priceError = ''.obs;
  Rx<String> priceFormat = ''.obs;
  final current = ''.obs;
  final errorPass = "".obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    numberTextController.dispose();
    codeTextController.dispose();
    descriptionTextController.dispose();
    priceTextController.dispose();
    super.dispose();
  }

  onChangeOrderCode(String value) {
    _onValidateOrderCode();
  }

  onChangePrice(String value) {
    _onValidatePrice();
  }

  _onValidateOrderCode() {
    final code = codeTextController.text.trim();
    if (code.isEmpty) {
      orderCodeError.value = 'Please input data.'.tr;
    } else {
      orderCodeError.value = '';
    }
  }

  _onValidatePrice() {
    if (priceTextController.text.trim().isEmpty) {
      priceError.value = 'Please input data.'.tr;
    } else if (priceTextController.text.toString() == "0") {
      priceError.value = 'Value must be greater than 0'.tr;
    } else {
      priceError.value = '';
    }
  }

  // void getBalance() {
  //   appState.value = MerAppState.loading;
  //   merchantBalance(MerchantBalanceRequest()).then((value) {
  //     if (value.message == "Success") {
  //       current.value = value.data?.currency ?? '';
  //       appState.value = MerAppState.success;
  //     } else {
  //       messageError = value.message;
  //       appState.value = MerAppState.failed;
  //     }
  //   }).catchError((error) {
  //     messageError = error.toString();
  //     appState.value = MerAppState.failed;
  //   }).whenComplete(() {});
  // }

  didTapCreateOrder() async {
    _onValidateOrderCode();
    _onValidatePrice();
    if (orderCodeError.isNotEmpty || priceError.isNotEmpty) {
      return;
    }
    final number = numberTextController.text;
    final orderCode = codeTextController.text;
    final contents = descriptionTextController.text;
    final originalPrice = priceTextController.text.trim().replaceAll(',', '');
    final request = CreateOrderRequest(
      phoneNumber: number,
      orderCode: orderCode,
      contents: contents,
      originalPrice: originalPrice,
    );
    await openLoadingDialog();
    merchantCreateOrder(request).then((value) async {
      if (value.message == "An error occurred, please try again") {
        orderCodeError.value = value.errorCodes
                ?.firstWhereOrNull((e) => e.message != null)
                ?.message ??
            '';
        return;
      } else if (value.data?.orderUUID == null) {
        await closeLoadingDialog();
        await showErrorNetwork('Error', 'Network Error');
      } else {
        await Get.toNamed(
          Routes.creatOrderQR,
          arguments: {"id": value.data?.orderUUID},
        );
        Get.back();
      }
    }).whenComplete(() async => await closeLoadingDialog());
  }
}
