import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vds/base/base_controller.dart';
import 'package:vds/base/request/merchant_get_otp_request.dart';
import 'package:vds/base/routes.dart';
import '../../../base/request/merchant_change_pin_request.dart';

class MerchantResetPinOTPBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MerchantResetPinOTPController>(() => MerchantResetPinOTPController());
  }
}

class MerchantResetPinOTPController extends BaseController {

  late TextEditingController otpTextController;
  Rx<String> otpError = ''.obs;
  String newPin = "";

  @override
  void onInit() {
    final arguments = Get.arguments;
    if(arguments is Map) {
      newPin = arguments["pin"];
    }
    otpTextController = TextEditingController();
    onGetOTP();
    super.onInit();
  }

  @override
  void dispose() {
    otpTextController.dispose();
    super.dispose();
  }

  onChangeNewPass(String value) {
    onValidateNewPass();
  }

  onValidateNewPass() {
    final newPassword = otpTextController.text.trim();
    if(newPassword.isEmpty) {
      otpError.value = "Please input data.".tr;
    } else {
      otpError.value = "";
    }
  }

  onGetOTP() {
    merchantGetOTP(MerchantGetOTPRequest()).then((value) {
    }).catchError((error) {
      showErrorDialog(message: error.toString());
    }).whenComplete(() {});
  }

  // changePasswordClick() async {
  //   onValidateNewPass();
  //   if(otpError.isEmpty) {
  //     final request = MerchantResetPINRequest(
  //       newPin: newPin,
  //       otp: otpTextController.text.trim(),
  //     );
  //     await openLoadingDialog();
  //     merchantResetPIN(request).then((value) async {
  //       await showAppDialog(
  //         title: 'Reset mã PIN'.tr,
  //         message: value.message ?? '',
  //         actions: [
  //           TextButton(
  //             child: const Text('Ok'),
  //             onPressed: () {
  //               Get.offNamedUntil(Routes.mainApp, (route) => Get.currentRoute == Routes.mainApp);
  //             },
  //           ),
  //         ]
  //       );
  //     }).catchError((error) async {
  //       await closeLoadingDialog();
  //     }).whenComplete(() async => await closeLoadingDialog());
  //   }
  // }
}
