import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vds/base/base_controller.dart';
import 'package:vds/base/request/merchant_pin_verify_request.dart';
import 'package:vds/base/request/merchant_withdraw_fee_request.dart';
import 'package:vds/base/request/merchant_withdrawal_ho_request.dart';
import 'package:vds/base/request/unregister_device_token_request.dart';
import 'package:vds/base/routes.dart';
import 'package:vds/common/enums.dart';
import 'package:vds/common/storage_data.dart';

import '../../../base/request/merchant_get_otp_request.dart';
import 'component/otp.dialog.dart';
import 'component/pin.dialog.dart';

class RevokeMoneyHOAcceptBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RevokeMoneyHOAcceptController>(
        () => RevokeMoneyHOAcceptController());
  }
}

class RevokeMoneyHOAcceptController extends BaseController {
  Rx<MerAppState> appState = MerAppState.loading.obs;
  final RxList<String> listCodePin = <String>['', '', '', '', '', ''].obs;
  final RxList<String> listCodeOtp = <String>['', '', '', '', '', ''].obs;

  RxString phoneNumberBank = ''.obs;
  final countDownTime = 30.obs;
  final isCanResent = false.obs;
  final current = ''.obs;
  Rx<double> amount = 0.0.obs;
  Rx<double> feeMoney = 0.0.obs;
  Rx<double> totalMoney = 0.0.obs;
  String? messageError;
  Timer? _timer;
  RxString checkSuccess = "Success".obs;
  RxInt tapCount = 0.obs;
  final transactionId = 0.obs;
  final requestDate = ''.obs;
  final currency = ''.obs;
  var errorOTP = '';
  final values = 0.0.obs;
  RxBool blockDevice = true.obs;

  @override
  void onInit() {
    checkSuccess;
    final arguments = Get.arguments;
    if (arguments is Map) {
      amount.value = arguments['inputMoney'];
      current.value = arguments['currency'].toString();
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
    final request = MerchantWithdrawalHORequest(
      amount: totalMoney.value.toString(),
      otp: listCodeOtp.join(''),
      pinCode: listCodePin.join(''),
      currency: current.value.toString(),
    );
    await openLoadingDialog();
    merchantWithdrawalHO(request).then((value) async {
      log('data : ${value.data}');
      if (value.message == "Success") {
        transactionId.value = value.data?.transactionId ?? 0;
        requestDate.value = value.data?.requestDate ?? '';
        currency.value = value.data?.currency ?? '';
        values.value = value.data?.value ?? 0;
        await Get.toNamed(Routes.successRevokeHO, arguments: {
          'transactionId': transactionId.value,
          'requestDate': requestDate.value,
          'currency': currency.value,
          'values': values.value
        });
        log('data : ${transactionId.value}');
      } else {
        listCodePin.clear();
        listCodePin.addAll(['', '', '', '', '', '']);
        listCodePin.refresh();
        listCodeOtp.clear();
        listCodeOtp.addAll(['', '', '', '', '', '']);
        listCodeOtp.refresh();
        // await showErrorDialog(message: value.message ?? "");
        await showErrorOTP(tittle: 'The OTP is invalid', check: true);
        await closeLoadingDialog();
      }
      log('data 2 : ${transactionId.value}');
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
        if (errorOTP == "Success") {
          await showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (context) {
              return const OtpDialog();
            },
          );
        } else {
          listCodePin.clear();
          listCodePin.addAll(['', '', '', '', '', '']);
          listCodePin.refresh();
          await showErrorOTP(tittle: 'The OTP is invalid', check: true);
          _timer?.cancel();
          _timer == null;
        }
      } else {
        tapCount++;
        listCodePin.clear();
        listCodePin.addAll(['', '', '', '', '', '']);
        listCodePin.refresh();
        var data = value.message!;
        checkSuccess.value = value.message!;
        if (tapCount.value == 3) {
          final request = UnregisterDeviceTokenRequest(
            token: StorageData.instance.getDeviceStore() ?? "",
          );
          await openLoadingDialog();
          final response =
              await unregisterDeviceToken(request).catchError((error) async {
            await closeLoadingDialog();
            await showErrorDialog(message: error?.toString() ?? "");
          });
          await closeLoadingDialog();
          if (response?.isSuccess() == true) {
            await StorageData.instance.onLogout();
            await Get.offAllNamed(Routes.login, arguments: blockDevice);
          } else {
            await showErrorDialog(message: response?.errorDescription);
          }
        }
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
    await merchantGetOTPBank(MerchantGetOTPRequest()).then((value) async => {
          if (value.message == 'Success')
            {
              phoneNumberBank.value = value.data?.phoneNumber ?? "",
              errorOTP = value.message!
            }
        });
  }

  void resendOtp() async {
    await getOtp();
    createTimer();
  }
}
