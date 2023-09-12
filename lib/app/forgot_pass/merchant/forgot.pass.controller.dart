import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:vds/base/base_controller.dart';
import 'package:vds/base/request/forgot_password_request.dart';
import 'package:vds/base/routes.dart';
import 'package:vds/common/enums.dart';

import '../../../common/mer_utils.dart';

class ForgotPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotPasswordController>(() => ForgotPasswordController());
  }
}

class ForgotPasswordController extends BaseController {
  final phoneNumberController = TextEditingController();
  final idController = TextEditingController();
  final chooseType =
  ValueNotifier<ForgetPassTypeEnum>(ForgetPassTypeEnum.values.first);

  // final formKey = GlobalKey<FormState>();
  Rx<TextInputType> textInputType = TextInputType.text.obs;
  Rx<LengthLimitingTextInputFormatter> textInput =
      LengthLimitingTextInputFormatter(9).obs;
  RxString phoneError = "".obs;
  RxString typeError = "".obs;
  RxString idError = "".obs;
  ForgetPassTypeEnum type = ForgetPassTypeEnum.values.first;

  @override
  void onInit() {
    super.onInit();
    // phoneNumberController.text = "67076228253";
    // idController.text = "76228253";
  }

  @override
  void dispose() {
    phoneNumberController.dispose();
    idController.dispose();
    super.dispose();
  }

  onChangeType(ForgetPassTypeEnum value) {
    type = value;
    textInputType.value = value == ForgetPassTypeEnum.ELECTORAL_CARD
        ? TextInputType.number
        : TextInputType.text;
  }

  onChangeID(String text) {
    _onValidateID(text);
  }

  onChangeTextPhone(String text) {
    _onValidatePhoneNumber(text);
  }

  _onValidatePhoneNumber(String value) {
    if (value.isEmpty) {
      phoneError.value = 'Please input data'.tr;
    } else if (MerUtils.validatePhone(value) == false) {
      phoneError.value = "Phone number isn’t right.";
    } else {
      phoneError.value = '';
    }
  }

  _onValidateID(String value) {
    if (value.isEmpty) {
      idError.value = 'Please input data'.tr;
    } else if (type == ForgetPassTypeEnum.ELECTORAL_CARD) {
      !MerUtils.validateID(value)
          ? idError.value = 'ID number is incorrect'.tr
          : idError.value = "";
      textInput.value = LengthLimitingTextInputFormatter(9);
    } else if (type == ForgetPassTypeEnum.BI_CARD) {
      !MerUtils.validateBiCard(value)
          ? idError.value = 'ID number is incorrect'.tr
          : idError.value = "";
      textInput.value = LengthLimitingTextInputFormatter(17);
    } else if (type == ForgetPassTypeEnum.PASSPORT) {
      !MerUtils.validatePassPost(value)
          ? idError.value = 'ID number is incorrect'.tr
          : idError.value = "";
      textInput.value = LengthLimitingTextInputFormatter(20);
    } else {
      idError.value = '';
    }
  }

  _onValidateType() {
    if (type == ForgetPassTypeEnum.TYPE) {
      typeError.value = "Please choose Type".tr;
      return;
    } else {
      typeError.value = "";
    }
  }

  continueButtonClick() async {
    FocusManager.instance.primaryFocus?.unfocus();
    String phone = phoneNumberController.text.trim();
    String id = idController.text.trim();
    _onValidatePhoneNumber(phone);
    _onValidateID(id);
    _onValidateType();
    if (phoneError.isEmpty && idError.isEmpty && typeError.isEmpty) {
      String pattern = r'(^7[5,6]{1}[0-9]{6}$)';
      RegExp regExp = RegExp(pattern);
      final request = MerchantForgotPasswordRequest(
          phoneNumber:
              (regExp.hasMatch(phone) ? "670${phone.trim()}" : phone.trim()),
          type: type.name,
          identity: (type == ForgetPassTypeEnum.ELECTORAL_CARD)
              ? (id.length == 9)
              ? id.trim()
              : "0" * (9 - id.length) + id
              : id.trim());
      await openLoadingDialog();
      merchantForgotPassword(request).then((value) async {
        print(value?.code);
        if (value?.message == "Success") {
          await Get.toNamed(Routes.newPassWhenForgot, arguments: {
            "phone": request.phoneNumber,
            "type": request.type,
            "identity": request.identity
          });
          debugPrint(request.phoneNumber);
        } else if (value?.errorCode == 4567) {
          await closeLoadingDialog();
          await showErrorBlockDevice(
              true,
              'Notification',
              value!.errorDescription ??
                  'Enter OTP incorrectly many times. Please retry \nafter 120 minutes.');
        } else if (value?.errorCode == 1000) {
          await closeLoadingDialog();
          await showErrorOTP(
            tittle: value?.errorDescription ?? "Connect time out",
            check: false,
          );
        } else {
          await closeLoadingDialog();
          await showErrorNetwork('Error', 'Network Error');
        }
      }).catchError((error) async {
        await closeLoadingDialog();
        // await showErrorDialog(message: error.toString());
      }).whenComplete(() async => await closeLoadingDialog());
    }
  }
}
