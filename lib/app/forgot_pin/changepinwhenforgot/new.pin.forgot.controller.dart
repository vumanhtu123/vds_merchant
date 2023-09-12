import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vds/base/base_controller.dart';
import 'package:vds/base/request/merchant_get_otp_request.dart';
import 'package:vds/common/storage_data.dart';
import 'package:vds/model/login_response.dart';

import '../../../base/request/merchant_reset_pin_request.dart';
import '../../../base/routes.dart';

class NewPinWhenForgotBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewPinWhenForgotController>(() => NewPinWhenForgotController());
  }
}

class NewPinWhenForgotController extends BaseController {
  final otpTextController = TextEditingController();
  final newPINTextController = TextEditingController();
  final renewPINTextController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  Timer? _timer;
  final countDownTime = 60.obs;
  final isCanResent = false.obs;
  RxBool inputPIN = true.obs;
  Rx<String> newPINError = ''.obs;
  Rx<String> renewPINError = ''.obs;
  Rx<String> otpError = ''.obs;
  LoginData? data;

  @override
  void onInit() {
    final arg = Get.arguments;
    if (arg is Map) {
      data = arg["data"];
    }
    super.onInit();
  }

  void createTimer() {
    countDownTime.value = 60;
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

  @override
  void dispose() {
    otpTextController.dispose();
    newPINTextController.dispose();
    renewPINTextController.dispose();
    _timer?.cancel();
    _timer == null;
    super.dispose();
  }

  onChangeNewPIN(String value) {
    onValidateNewPIN();
  }

  onChangeRenewPIN(String value) {
    onValidateRenewPIN();
  }

  onValidateNewPIN() {
    final newPassword = newPINTextController.text.trim();
    if (newPassword.isEmpty) {
      newPINError.value = "Please input data.".tr;
    } else if (newPassword.length != 6) {
      newPINError.value = "Thông tin này phải 6 số".tr;
    } else {
      newPINError.value = "";
    }
  }

  onValidateRenewPIN() {
    final newPassword = newPINTextController.text.trim();
    final renewPassword = renewPINTextController.text.trim();
    if (renewPassword.isEmpty) {
      renewPINError.value = "Please input data.".tr;
    } else if (renewPassword != newPassword) {
      renewPINError.value = "Mã PIN không khớp".tr;
    } else if (renewPassword.length != 6) {
      renewPINError.value = "Thông tin này phải 6 số".tr;
    } else {
      renewPINError.value = "";
    }
  }

  onChangeOTP(String value) {
    onValidateOTP();
  }

  onValidateOTP() {
    final newPassword = otpTextController.text.trim();
    if (newPassword.isEmpty) {
      otpError.value = "Please input data.".tr;
    } else {
      otpError.value = "";
    }
  }

  void resendOTP() {
    createTimer();
    onGetOTP();
  }

  onGetOTP() {
    final request = MerchantGetOTPRequest();
    merchantGetOTP(request, appToken: data?.accessToken)
        .then((value) {})
        .catchError((error) {
      showErrorDialog(message: error.toString());
    }).whenComplete(() {});
  }

  onResetPinClick() {
    onValidateNewPIN();
    onValidateRenewPIN();
    if (newPINError.isEmpty && renewPINError.isEmpty) {
      createTimer();
      onGetOTP();
      inputPIN.value = false;
    }
  }

  onBack() {
    if (inputPIN.isFalse) {
      inputPIN.value = true;
    } else {
      Get.offNamedUntil(
          Routes.login, (route) => Get.currentRoute == Routes.login);
    }
  }

  onSetNewPin() async {
    onValidateOTP();
    if (otpError.isEmpty) {
      final request = MerchantResetPINRequest(
        newPin: newPINTextController.text.trim(),
        otp: otpTextController.text.trim(),
      );
      await openLoadingDialog();
      merchantRegisterPIN(request, appToken: data?.accessToken)
          .then((value) async {
        if (value.message == "Success") {
          final accessToken = data?.accessToken;
          final refreshToken = data?.refreshToken;
          if (accessToken != null && refreshToken != null) {
            StorageData.instance.setAppToken(accessToken);
            StorageData.instance.setRefreshToken(refreshToken);
            StorageData.instance.setUserRole("MERCHANT_OWNER");
            await closeLoadingDialog();
            await Get.offAllNamed(Routes.mainApp);
          }
        } else {
          otpTextController.text = '';
          newPINTextController.text = '';
          renewPINTextController.text = '';
          await showErrorOTP(tittle: 'The OTP is invalid', check: false);
          inputPIN.value = true;
        }
      }).catchError((error) async {
        await closeLoadingDialog();
        await showErrorOTP(tittle: error.toString(), check: false);
        // await showErrorDialog(message: error.toString());
      }).whenComplete(() async => await closeLoadingDialog());
    }
  }
}
