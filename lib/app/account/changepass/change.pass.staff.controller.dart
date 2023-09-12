import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vds/base/base_controller.dart';
import 'package:vds/base/request/staff.change.request.dart';

import '../../../common/mer_utils.dart';

class ChangePassStaffBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChangePassStaffController>(() => ChangePassStaffController());
  }
}

class ChangePassStaffController extends BaseController {
  final oldPasswordTextController = TextEditingController();
  final newPasswordTextController = TextEditingController();
  final renewPasswordTextController = TextEditingController();
  Rx<String> oldPassError = ''.obs;
  Rx<String> newPassError = ''.obs;
  Rx<String> renewPassError = ''.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    oldPasswordTextController.dispose();
    newPasswordTextController.dispose();
    renewPasswordTextController.dispose();
    super.dispose();
  }

  onChangeOldPass(String value) {
    onValidateOldPass();
  }

  onChangeNewPass(String value) {
    onValidateNewPass();
  }

  onChangeRenewPass(String value) {
    onValidateRenewPass();
  }

  onValidateOldPass() {
    final oldPassword = oldPasswordTextController.text.trim();
    if (oldPassword.isEmpty) {
      oldPassError.value = "Please input data".tr;
    } else {
      oldPassError.value = "";
    }
  }

  onValidateNewPass() {
    final newPassword = newPasswordTextController.text.trim();
    final oldPassword = oldPasswordTextController.text.trim();
    if (newPassword.isEmpty) {
      newPassError.value = "Please input data".tr;
    } else if (MerUtils.validateStructure(newPassword) == false) {
      newPassError.value =
          "Password must be at least 8 characters long, contain at least one uppercase letter, one lowercase letter, one number and one special character"
              .tr;
    } else if (newPassword == oldPassword) {
      newPassError.value = "New password can't match old password.".tr;
    } else {
      newPassError.value = "";
    }
  }

  onValidateRenewPass() {
    final newPassword = newPasswordTextController.text.trim();
    final renewPassword = renewPasswordTextController.text.trim();
    if (renewPassword.isEmpty) {
      renewPassError.value = "Please input data".tr;
    } else if (renewPassword != newPassword) {
      renewPassError.value = "Mã pass không khớp".tr;
    } else {
      renewPassError.value = "";
    }
  }

  changePasswordClick() async {
    FocusManager.instance.primaryFocus?.unfocus();
    onValidateNewPass();
    onValidateOldPass();
    onValidateRenewPass();
    if (newPassError.isEmpty &&
        oldPassError.isEmpty &&
        renewPassError.isEmpty) {
      final request = StaffChangePassRequest(
        oldPassword: oldPasswordTextController.text.trim(),
        newPassword: newPasswordTextController.text.trim(),
      );
      await openLoadingDialog();
      staffChangePass(request).then((value) async {
        if (value.message == "Success") {
          await showSuccessChange(tittle: 'Change password successfully'.tr);
          Get.back();
        } else {
          if (value.errorDescription == "Invalid password!") {
            oldPassError.value = "Incorrect password";
          } else if (value.errorCode == 1000) {
            oldPassError.value = value.message.toString();
            // oldPassError.value = value.errorDescription!;
          } else {
            await showErrorNetwork('Error', 'Network Error');
          }
          // oldPassError.value = value.errorDescription!;
        }
      }).catchError((error) async {
        debugPrint(error.toString());
        await closeLoadingDialog();
      }).whenComplete(() async => await closeLoadingDialog());
    }
  }
}
