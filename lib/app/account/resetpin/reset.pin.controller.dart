import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vds/base/base_controller.dart';
import 'package:vds/base/request/merchant_change_pin_request.dart';
import 'package:vds/base/routes.dart';

class MerchantResetPinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MerchantResetPinController>(() => MerchantResetPinController());
  }
}

class MerchantResetPinController extends BaseController {
  late TextEditingController oldPINTextController;
  late TextEditingController newPINTextController;
  late TextEditingController renewPINTextController;
  Rx<String> oldPINError = ''.obs;
  Rx<String> newPINError = ''.obs;
  Rx<String> renewPINError = ''.obs;

  @override
  void onInit() {
    oldPINTextController = TextEditingController();
    newPINTextController = TextEditingController();
    renewPINTextController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    oldPINTextController.dispose();
    newPINTextController.dispose();
    renewPINTextController.dispose();
    super.dispose();
  }

  onChangeNewPass(String value) {
    onValidateNewPass();
  }

  onChangeRenewPass(String value) {
    onValidateRenewPass();
  }

  onChangeOldPass(String value) {
    onValidateOldPass();
  }

  onValidateNewPass() {
    final oldPassword = oldPINTextController.text.trim();
    final newPassword = newPINTextController.text.trim();
    if (newPassword.isEmpty) {
      newPINError.value = "Please input data.".tr;
    } else if (newPassword.length != 6) {
      newPINError.value = "You can only enter 6 characters".tr;
    } else if (newPassword == oldPassword) {
      newPINError.value = "New pin can't match old pin.".tr;
    } else {
      newPINError.value = "";
    }
  }

  onValidateOldPass() {
    final oldPassword = oldPINTextController.text.trim();
    if (oldPassword.isEmpty) {
      oldPINError.value = "Please input data.".tr;
    } else {
      oldPINError.value = "";
    }
  }

  onValidateRenewPass() {
    final newPassword = newPINTextController.text.trim();
    final renewPassword = renewPINTextController.text.trim();
    if (renewPassword.isEmpty) {
      renewPINError.value = "Please input data.".tr;
    } else if (renewPassword != newPassword) {
      renewPINError.value = "Mã PIN không khớp".tr;
    } else {
      renewPINError.value = "";
    }
  }

  changePinClick() async {
    FocusManager.instance.primaryFocus?.unfocus();
    onValidateOldPass();
    onValidateNewPass();
    onValidateRenewPass();
    if (newPINError.isEmpty && oldPINError.isEmpty && renewPINError.isEmpty) {
      final request = MerchantChangePINRequest(
        oldPin: oldPINTextController.text.trim(),
        newPin: newPINTextController.text.trim(),
      );
      await openLoadingDialog();
      merchantChangePIN(request).then((value) async {
        if (value.message == "Success") {
          await closeLoadingDialog();
          await showSuccessChange(tittle: 'Change pin success'.tr);
        } else {
          if (value.errorDescription == "error.invalid_pin_code") {
            oldPINError.value = "Pin code do not match";
          } else if (value.errorCode == 1000) {
            oldPINError.value = value.errorDescription.toString();
          } else {
            await showErrorNetwork('Error', 'Network Error');
          }
          // await closeLoadingDialog();
          // await showErrorChange(tittle: 'Change pin failed'.tr);
        }
      }).catchError((error) async {
        await closeLoadingDialog();
      }).whenComplete(() async => await closeLoadingDialog());
    }
  }

  changePasswordClick() async {
    if (newPINError.isEmpty && renewPINError.isEmpty && oldPINError.isEmpty) {
      Get.toNamed(
        Routes.merchantResetPinOTP,
        arguments: {"pin": newPINTextController.text.trim()},
      );
    }
  }
}
