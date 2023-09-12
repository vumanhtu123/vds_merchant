import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vds/base/base_controller.dart';
import 'package:vds/base/request/merchant_balance_request.dart';
import 'package:vds/base/request/merchant_wallet_policy_request.dart';
import 'package:vds/common/enums.dart';
import 'package:vds/model/bank.info.model.dart';

import '../../base/routes.dart';
import '../../model/wallet_policy_response.dart';

class RevokeMoneyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RevokeMoneyController>(() => RevokeMoneyController());
  }
}

class RevokeMoneyController extends BaseController {
  final currencyFormatter = CurrencyTextInputFormatter(
    decimalDigits: 0,
    symbol: "",
  );
  Rx<MerAppState> appState = MerAppState.loading.obs;
  late TextEditingController revokeMoneyTextController;
  late TextEditingController bankAccountTextController;
  late TextEditingController contentAccountTextController;
  final bankInfo = BankInfoModel().obs;
  final bankAccount = ''.obs;
  final inputMoney = 0.0.obs;
  final isInvokeAll = false.obs;
  final totalMoney = 0.0.obs;
  final isBlind = false.obs;
  final current = ''.obs;
  String? messageError;
  Rx<String> inputMoneyError = ''.obs;
  Rx<String> bankAccountError = ''.obs;
  List<WithDrawlPolicy>? withDrawlPolicy;

  @override
  void onInit() {
    revokeMoneyTextController = TextEditingController();
    bankAccountTextController = TextEditingController();
    contentAccountTextController = TextEditingController();
    ever(isInvokeAll, onChangeCheckbox);
    loadData();
    super.onInit();
  }

  @override
  void dispose() {
    revokeMoneyTextController.dispose();
    super.dispose();
  }

  setInvokeAll() {
    isInvokeAll.value = !isInvokeAll.value;
    if (isInvokeAll.isTrue) {
      inputMoney.value = totalMoney.value;
    } else {
      inputMoney.value = 0;
    }
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
      final wPolicyRequest = MerchantWalletPolicyRequest(type: "BANK");
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

  onChangeBankAccount(String value) {
    bankAccount.value = '';
    bankAccount.value = value;
    onValidateBankAccount();
  }

  onChangeText(String value) {
    final newValue = value.replaceAll(",", "").replaceAll(".", "");
    inputMoney.value = double.tryParse(newValue) ?? 0;
    onValidateMoney();
  }

  onValidateMoney() {
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
      inputMoneyError.value = "".tr;
    }
  }

  onValidateBankAccount() {
    // TL381234567891234567891
    if (bankAccount.value.isEmpty) {
      bankAccountError.value = 'Please input data'.tr;
    } else if (bankAccount.value.length < 19) {
      bankAccountError.value = "You can only enter 19 characters";
    } else if (bankAccountTextController.text.trim().isNotEmpty) {
      bankAccountError.value = '';
    }
  }

  onChangeCheckbox(bool isCheck) {
    if (isCheck) {
      revokeMoneyTextController.text = '';
      inputMoneyError.value = "".tr;
    }
  }

  didTapEye() {
    isBlind.value = !isBlind.value;
  }

  onNextClick() async {
    onValidateBankAccount();
    if (isInvokeAll.isTrue || revokeMoneyTextController.text.isNotEmpty) {
      inputMoneyError.value = "".tr;
    } else {
      inputMoneyError.value = "Please input data".tr;
    }
    if (inputMoney.value <= 0) {
      inputMoneyError.value = "Please input data".tr;
    } else {
      inputMoneyError.value = "".tr;
    }
    if (inputMoneyError.isEmpty && bankAccountError.isEmpty) {
      Get.toNamed(Routes.acceptRevoke, arguments: {
        'inputMoney': inputMoney.value,
        'bankAccount': bankAccount.value,
        'current': current.value
      });
    }
  }
}
