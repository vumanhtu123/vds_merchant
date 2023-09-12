import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vds/base/base_controller.dart';
import 'package:vds/base/request/merchant_balance_request.dart';
import 'package:vds/base/request/merchant_wallet_policy_request.dart';
import 'package:vds/base/routes.dart';
import 'package:vds/common/enums.dart';
import 'package:vds/model/wallet_policy_response.dart';

class RevokeMoneyHOBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RevokeMoneyHOController>(() => RevokeMoneyHOController());
  }
}

class RevokeMoneyHOController extends BaseController {
  final currencyFormatter = CurrencyTextInputFormatter(
    decimalDigits: 0,
    symbol: "",
  );
  final revokeMoneyTextController = TextEditingController();
  Rx<MerAppState> appState = MerAppState.loading.obs;
  final totalMoney = 0.0.obs;
  final inputMoney = 0.0.obs;
  final current = ''.obs;
  final isInvokeAll = false.obs;
  final isBlind = false.obs;
  String? messageError;
  Rx<String> inputMoneyError = ''.obs;
  List<WithDrawlPolicy>? withDrawlPolicy;

  @override
  void onInit() {
    ever(isInvokeAll, onChangeCheckbox);
    loadData();
    super.onInit();
  }

  @override
  void dispose() {
    revokeMoneyTextController.dispose();
    super.dispose();
  }

  void loadData() async {
    appState.value = MerAppState.loading;
    try {
      final balanceRequest = MerchantBalanceRequest();
      final balanceResponse = await merchantBalance(balanceRequest);
      if (balanceResponse.message == "Success") {
        totalMoney.value = balanceResponse.data?.amount ?? 0;
        current.value = balanceResponse.data?.currency ?? '';
      } else if (balanceResponse.errorCodes
              ?.firstWhereOrNull((element) => element.code != null)
              ?.code ==
          9000) {
        messageError = balanceResponse.errorCodes
            ?.firstWhereOrNull((element) => element.message != null)
            ?.message;
        appState.value = MerAppState.failed;
        return;
      } else {
        // messageError = balanceResponse.message ?? "";
        messageError = 'Network Error';
        appState.value = MerAppState.failed;
        return;
      }
      final wPolicyRequest = MerchantWalletPolicyRequest(type: "HO");
      final walletPolicy = await merchantWalletPolicy(wPolicyRequest);
      if (walletPolicy.message == "Success") {
        withDrawlPolicy = walletPolicy.data?.withDrawlPolicy;
      } else {
        messageError = walletPolicy.errorCodes
            ?.firstWhereOrNull((e) => e.message != null)
            ?.message ??
            '';
        appState.value = MerAppState.failed;
        return;
      }
      appState.value = MerAppState.success;
    } catch (error) {
      messageError = error.toString();
      appState.value = MerAppState.failed;
    }
  }

  onChangeCheckbox(bool isCheck) {
    if (isCheck) {
      revokeMoneyTextController.text = '';
      inputMoneyError.value = "";
    }
  }

  onChangeText(String value) {
    final newValue = value.replaceAll(",", "").replaceAll(".", "");
    inputMoney.value = double.tryParse(newValue) ?? 0.00;
    if (inputMoney.value > totalMoney.value) {
      inputMoneyError.value =
          "The amount you want to withdraw exceeds the balance in your wallet"
              .tr;
    } else if (inputMoney.value == 0 && inputMoney.value.isNaN) {
      inputMoneyError.value = "Please input data";
    } else {
      final listPolicy = withDrawlPolicy ?? [];
      for (var element in listPolicy) {
        final value = num.parse(element.value ?? "0");
        if ((element.operator == ">=" && inputMoney.value < value) ||
            (element.operator == ">" && inputMoney.value <= value) ||
            (element.operator == "<=" &&
                value > 0 &&
                inputMoney.value > value) ||
            (element.operator == "<" &&
                value > 0 &&
                inputMoney.value >= value)) {
          inputMoneyError.value = element.description ?? "";
          break;
        }
      }
      if (listPolicy.isEmpty) {
        inputMoneyError.value = "";
      }
      inputMoneyError.value = "";
    }
  }

  // onValidateTextInput() {
  //   if (revokeMoneyTextController.text.isEmpty) {
  //     inputMoneyError.value = "Please input data";
  //   }
  // }

  setInvokeAll() {
    isInvokeAll.value = !isInvokeAll.value;
    if (isInvokeAll.isTrue) {
      inputMoneyError.value = "";
      inputMoney.value = totalMoney.value;
    } else {
      inputMoney.value = 0;
    }
  }

  didTapEye() {
    isBlind.value = !isBlind.value;
  }

  onNextClick() async {
    if (isInvokeAll.isTrue) {
      inputMoneyError.value = "".tr;
    } else {
      inputMoneyError.value = "Please input data".tr;
    }
    if (inputMoney.value <= 0) {
      inputMoneyError.value = "Please input data".tr;
    } else {
      inputMoneyError.value = "".tr;
    }
    if (inputMoney.value > 0 &&
        inputMoney.value <= totalMoney.value &&
        inputMoneyError.isEmpty) {
      Get.toNamed(Routes.acceptRevokeHO, arguments: {
        'inputMoney': inputMoney.value,
        'currency': current.value
      });
    }
  }
}
