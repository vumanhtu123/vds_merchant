import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vds/base/base_controller.dart';
import 'package:vds/base/request/forgot_password_request.dart';
import 'package:vds/base/routes.dart';
import 'package:vds/common/mer_utils.dart';

class StaffForgotPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StaffForgotPasswordController());
  }
}

class StaffForgotPasswordController extends BaseController {
  final phoneNumberController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  RxString phoneError = "".obs;

  @override
  void onInit() {
    super.onInit();
    // phoneNumberController.text = "8492758746";
    // idController.text = "567678575786";
  }

  @override
  void dispose() {
    phoneNumberController.dispose();
    super.dispose();
  }

  onChangeTextPhone(String text) {
    _onValidatePhoneNumber(text);
  }

  _onValidatePhoneNumber(String value) {
    if (value.isEmpty) {
      phoneError.value = 'Please input data.'.tr;
    } else if (MerUtils.validatePhone(value) == false) {
      phoneError.value = "Phone number isn’t right.";
    } else {
      phoneError.value = '';
    }
  }

  continueButtonClick() async {
    String phone = phoneNumberController.text.trim();
    _onValidatePhoneNumber(phone);
    FocusManager.instance.primaryFocus?.unfocus();
    String pattern = r'(^7[5,6]{1}[0-9]{6}$)';
    RegExp regExp = RegExp(pattern);
    if (phoneError.isEmpty) {
      final request = StaffForgotPasswordRequest(
        phoneNumber: (regExp.hasMatch(phoneNumberController.text.trim())
            ? "670${phoneNumberController.text.trim()}"
            : phoneNumberController.text.trim()),
      );
      await openLoadingDialog();
      staffForgotPassword(request).then((value) async {
        if (value?.message == "Success") {
          await Get.toNamed(Routes.staffNewPassWhenForgot,
              arguments: {"phone": request.phoneNumber});
        } else if (value?.errorCode == 4567) {
          await closeLoadingDialog();
          await showErrorBlockDevice(
              true,
              'Notification',
              value!.errorDescription ??
                  'Enter OTP incorrectly many times. Please retry \nafter 120 minutes.');
        } else if (value?.errorCode == 1000) {
          await showErrorOTP(
              tittle: value?.errorDescription ?? "Connect time out",
              check: false);
        } else {
          await closeLoadingDialog();
          await showErrorNetwork('Error', 'Network Error');
        }
      }).catchError((error) async {
        await closeLoadingDialog();
        await showErrorDialog(message: error.toString());
      }).whenComplete(() async => await closeLoadingDialog());
    }
  }
}
