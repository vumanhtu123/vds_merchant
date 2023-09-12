import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vds/base/base_controller.dart';
import 'package:vds/base/request/merchant_pin_verify_request.dart';
import 'package:vds/base/request/merchant_withdraw_fee_request.dart';
import 'package:vds/base/request/merchant_withdrawal_bank_request.dart';
import 'package:vds/base/routes.dart';
import 'package:vds/common/enums.dart';

import '../../../base/request/merchant_get_otp_request.dart';
import 'component/otp.dialog.dart';
import 'component/pin.dialog.dart';

class RevokeMoneyAcceptBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RevokeMoneyAcceptController>(
        () => RevokeMoneyAcceptController());
  }
}

class RevokeMoneyAcceptController extends BaseController {
  Rx<MerAppState> appState = MerAppState.loading.obs;
  final RxList<String> listCodePin = <String>['', '', '', '', '', ''].obs;
  final RxList<String> listCodeOtp = <String>['', '', '', '', '', ''].obs;

  final countDownTime = 30.obs;
  final isCanResent = false.obs;
  Rx<double> amount = 0.0.obs;
  Rx<String> bankAccount = ''.obs;
  final current = ''.obs;
  Rx<double> feeMoney = 0.0.obs;
  Rx<double> totalMoney = 0.0.obs;
  String? messageError;
  Timer? _timer;
  RxString checkSuccess = "Success".obs;
  RxString phoneNumberBank = ''.obs;
  RxInt tapCount = 0.obs;
  final transactionId = 0.obs;
  final requestDate = ''.obs;
  final errorOTP = 'Success';
  final currency = ''.obs;
  final values = 0.0.obs;

  @override
  void onInit() {
    final arguments = Get.arguments;
    if (arguments is Map) {
      amount.value = arguments['inputMoney'];
      bankAccount.value = arguments['bankAccount'].toString();
      current.value = arguments['current'].toString();
    }
    getWithdrawFee();
    super.onInit();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _timer == null;
    super.dispose();
  }

  getWithdrawFee() {
    appState.value = MerAppState.loading;
    final request = MerchantWithdrawFeeRequest(amount: amount.value.toString());
    merchantWithdrawFee(request).then((value) {
      if (value.message == "Success") {
        feeMoney.value = value.data?.feeAmount ?? 0;
        totalMoney.value = feeMoney.value + amount.value;
        appState.value = MerAppState.success;
      } else {
        messageError = value.message;
        appState.value = MerAppState.failed;
      }
    }).catchError((error) {
      messageError = error.toString();
      appState.value = MerAppState.failed;
    }).whenComplete(() {});
  }

  accept(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return const PinDialog();
      },
    );
    listCodePin.clear();
    listCodePin.addAll(['', '', '', '', '', '']);
    listCodePin.refresh();
  }

  onClickNumberOtp(String number) {
    if (!listCodeOtp.any((element) => element.isEmpty)) return;
    var emptyStringIndex = listCodeOtp.indexWhere((element) => element.isEmpty);
    listCodeOtp[emptyStringIndex] = number;
    listCodeOtp.refresh();
  }

  void nextButtonOtpClick() async {
    final request = MerchantWithdrawalBankRequest(
      amount: totalMoney.value.toString(),
      otp: listCodeOtp.join(''),
      currency: current.value,
      pinCode: listCodePin.join(''),
      bankAccount: bankAccount.value,
    );
    await openLoadingDialog();
    merchantWithdrawalBank(request).then((value) async {
      if (value.message == "Success") {
        transactionId.value = value.data?.transactionId ?? 0;
        requestDate.value = value.data?.requestDate ?? '';
        currency.value = value.data?.currency ?? '';
        values.value = value.data?.value ?? 0;
        await Get.toNamed(Routes.successRevoke, arguments: {
          'transactionId': transactionId.value,
          'requestDate': requestDate.value,
          'currency': currency.value,
          'values': values.value
        });
      } else {
        listCodeOtp.clear();
        listCodeOtp.addAll(['', '', '', '', '', '']);
        listCodeOtp.refresh();
        await showErrorOTP(tittle: 'The OTP is invalid', check: true);
        await closeLoadingDialog();
        // await showErrorDialog(message: value.message ?? "");
      }
    }).catchError((error) async {
      await closeLoadingDialog();
    }).whenComplete(() async => await closeLoadingDialog());
  }

  void deleteButtonOtpClick() {
    if (!listCodeOtp.any((element) => element.isNotEmpty)) return;
    var emptyStringIndex =
        listCodeOtp.lastIndexWhere((element) => element.isNotEmpty);
    listCodeOtp[emptyStringIndex] = '';
    listCodeOtp.refresh();
  }

  nextButtonPinClick(BuildContext context) async {
    final request = MerchantPINVerifyRequest(pinCode: listCodePin.join(''));
    await openLoadingDialog();
    merchantPINVerify(request).then((value) async {
      if (value.message == "Success") {
        checkSuccess.value = value.message!;
        createTimer();
        await getOtp();
        if (errorOTP != "Success") {
          await showErrorOTP(tittle: 'The OTP is invalid', check: true);
        } else {
          await showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (context) {
              return const OtpDialog();
            },
          );
          _timer?.cancel();
          _timer == null;
          listCodeOtp.clear();
          listCodeOtp.addAll(['', '', '', '', '', '']);
          listCodeOtp.refresh();
          listCodePin.clear();
          listCodePin.addAll(['', '', '', '', '', '']);
          listCodePin.refresh();
        }
      } else {
        tapCount++;
        listCodeOtp.clear();
        listCodeOtp.addAll(['', '', '', '', '', '']);
        listCodeOtp.refresh();
        listCodePin.clear();
        listCodePin.addAll(['', '', '', '', '', '']);
        listCodePin.refresh();
        checkSuccess.value = value.message!;
        // await showErrorDialog(message: value.errorDescription);
      }
    }).catchError((error) async {
      await closeLoadingDialog();
    }).whenComplete(() async {
      await closeLoadingDialog();
    });
  }

  onClickNumberPin(String number) {
    if (!listCodePin.any((element) => element.isEmpty)) return;
    var emptyStringIndex = listCodePin.indexWhere((element) => element.isEmpty);
    listCodePin[emptyStringIndex] = number;
    listCodePin.refresh();
  }

  onDeletePin() {
    if (!listCodePin.any((element) => element.isNotEmpty)) return;
    var emptyStringIndex =
        listCodePin.lastIndexWhere((element) => element.isNotEmpty);
    listCodePin[emptyStringIndex] = '';
    listCodePin.refresh();
  }

  void createTimer() {
    countDownTime.value = 30;
    isCanResent.value = false;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      countDownTime.value = countDownTime.value - 1;
      if (countDownTime.value == 0) {
        _timer?.cancel();
        _timer = null;
        isCanResent.value = true;
      }
    });
  }

  Future<void> getOtp() async {
    await merchantGetOTPBank(MerchantGetOTPRequest()).then((value) => {
          if (errorOTP == value.message)
            {phoneNumberBank.value = value.data?.phoneNumber ?? ""}
        });
  }

  void resendOtp() async {
    await getOtp();
    createTimer();
  }
}
