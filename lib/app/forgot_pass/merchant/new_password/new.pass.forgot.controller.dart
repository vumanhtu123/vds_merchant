import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vds/base/base_controller.dart';
import 'package:vds/base/request/merchant_submit_new_pass_request.dart';
import 'package:vds/base/routes.dart';

import '../../../../base/request/forgot_password_request.dart';
import '../../../../common/mer_utils.dart';

class NewPassWhenForgotBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NewPassWhenForgotController());
  }
}

class NewPassWhenForgotController extends BaseController {

  final otpTextController = TextEditingController();
  final newPassTextController = TextEditingController();
  final renewPassTextController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  Timer? _timer;
  final countDownTime = 0.obs;
  final isCanResent = false.obs;
  RxBool inputPIN = true.obs;
  Rx<String> newPassError = ''.obs;
  Rx<String> renewPassError = ''.obs;
  Rx<String> otpError = ''.obs;
  var phone = '';
  var type = '';
  var identity = '';
  DateTime? currentTime;

  @override
  void onInit() {
    if (Get.arguments is Map) {
      phone = Get.arguments["phone"] ?? "";
      type = Get.arguments["type"] ?? "";
      identity = Get.arguments["identity"] ?? "";
      debugPrint("phone number :$phone");
    }
    super.onInit();
    createTimer();
  }

  void createTimer() {
    currentTime = DateTime.now();
    isCanResent.value = false;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final now = DateTime.now();
      final duration = Duration(
        days: currentTime!.day,
        hours: currentTime!.hour,
        minutes: currentTime!.minute,
        seconds: currentTime!.second,
      );
      final second = 60 - now.subtract(duration).second;
      print(second);
      countDownTime.value = second == 1 ? 0 : second;
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
    newPassTextController.dispose();
    renewPassTextController.dispose();
    _timer?.cancel();
    _timer == null;
    super.dispose();
  }

  onChangeNewPIN(String value) {
    _onValidateNewPass();
  }

  onChangeRenewPIN(String value) {
    _onValidateRenewPass();
  }

  _onValidateNewPass() {
    final newPassword = newPassTextController.text.trim();
    if (newPassword.isEmpty) {
      newPassError.value = "Please input data".tr;
    } else if (MerUtils.validateStructure(newPassword) == false) {
      newPassError.value =
          "Password must be at least 8 characters long, contain at least one uppercase letter, one lowercase letter, one number and one special character"
              .tr;
    } else {
      newPassError.value = "";
    }
  }

  _onValidateRenewPass() {
    final newPassword = newPassTextController.text.trim();
    final renewPassword = renewPassTextController.text.trim();
    if (renewPassword.isEmpty) {
      renewPassError.value = "Please input data".tr;
    } else if (renewPassword != newPassword) {
      renewPassError.value = "Password do not match".tr;
    } else {
      renewPassError.value = "";
    }
  }

  onChangeOTP(String value) {
    _onValidateOTP();
  }

  _onValidateOTP() {
    final otpText = otpTextController.text.trim();
    if (otpText.isEmpty) {
      otpError.value = "Please input data".tr;
    } else if (otpText.length < 6) {
      otpError.value = "OTP isn’t right.".tr;
    } else {
      otpError.value = "";
    }
  }

  void resendOTP() {
    otpTextController.text = "";
    otpError.value = "";
    createTimer();
    onGetOTP();
  }

  onGetOTP() async {
    merchantForgotPassword(MerchantForgotPasswordRequest(
            phoneNumber: phone, type: type, identity: identity))
        .then((value) {})
        .catchError((error) {
      showErrorDialog(message: error.toString());
    }).whenComplete(() {});
  }

  onSetNewPass() async {
    _onValidateOTP();
    _onValidateNewPass();
    _onValidateRenewPass();
    FocusManager.instance.primaryFocus?.unfocus();
    if (otpError.isEmpty && newPassError.isEmpty && renewPassError.isEmpty) {
      await openLoadingDialog();
      final request = MerchantSubmitNewPassRequest(
        otp: otpTextController.text.trim(),
        newPassword: newPassTextController.text.trim(),
      );
      merchantSubmitNewPass(request).then((value) async {
        if (value?.message == "Success") {
          await showSuccessChange(
            tittle: 'Reset password successful',
          );
          await closeLoadingDialog();
          await Get.offNamedUntil(
              Routes.login, (route) => Get.currentRoute == Routes.login);
        } else if (value?.errorCode == 4567) {
          await closeLoadingDialog();
          await showErrorBlockDevice(false, 'Notification',
              'Enter OTP incorrectly many times. Please retry \nafter 120 minutes.');
        } else {
          otpError.value = value?.errorDescription ?? "";
        }
      }).catchError((error) async {
        await closeLoadingDialog();
        await showErrorDialog(message: error.toString());
      }).whenComplete(() async => await closeLoadingDialog());
    }
  }
}
