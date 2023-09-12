import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:vds/base/base_controller.dart';
import 'package:vds/base/request/login_request.dart';
import 'package:vds/base/request/merchant_check_pin_request.dart';
import 'package:vds/base/translation/localization_service.dart';
import 'package:vds/base/translation/translation.dart';
import 'package:vds/common/storage_data.dart';
import 'package:vds/notification/fcm_conttroller.dart';

import '../../base/routes.dart';
import '../../model/login_response.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}

class LoginController extends BaseController {
  final formKey = GlobalKey<FormState>();
  final nameTextController = TextEditingController();
  final pinTextController = TextEditingController();
  final isPhoneNumberHasText = false.obs;
  final isPinHasText = false.obs;
  final hasErrorPhone = "".obs;
  final hasErrorPin = false.obs;
  final errorPass = "".obs;
  RxInt tapCount = 0.obs;
  RxBool visibility = true.obs;

  @override
  void onInit() {
    StorageData.instance.setTheFirst();
    // nameTextController.text = "67076343434";
    // pinTextController.text = "123456";
    // nameTextController.text = "67075236985";
    // pinTextController.text = "12345aA@";
    // nameTextController.text = "67075000009";
    // pinTextController.text = "123456";
    // nameTextController.text = "67075324966";
    // pinTextController.text = "123123a@";
    // nameTextController.text = "67076454252";
    // pinTextController.text = "Linh.123";
    super.onInit();
  }

  @override
  void dispose() {
    nameTextController.dispose();
    pinTextController.dispose();
    super.dispose();
  }

  onChangePin(String text) {
    onValidatePass(text);
  }

  onValidatePhone(String value) {
    if (value.isEmpty) {
      isPhoneNumberHasText.value = false;
      hasErrorPhone.value = "Please input data".tr;
    } else {
      isPhoneNumberHasText.value = true;
      hasErrorPhone.value = "".tr;
    }
  }

  onValidatePass(String value) {
    if (value.isEmpty) {
      isPinHasText.value = false;
      errorPass.value = "Please input data".tr;
    } else {
      isPinHasText.value = true;
      errorPass.value = "".tr;
    }
  }

  onValidatePhoneText() {
    final user = nameTextController.text;
    if (user.isEmpty) {
      isPhoneNumberHasText.value = false;
      hasErrorPhone.value = "Please input data".tr;
    } else {
      isPhoneNumberHasText.value = true;
      hasErrorPhone.value = "".tr;
    }
  }

  onValidatePassText() {
    final pass = pinTextController.text;
    if (pass.isEmpty) {
      isPinHasText.value = false;
      errorPass.value = "Please input data".tr;
    } else {
      isPinHasText.value = true;
      errorPass.value = "".tr;
    }
  }

  void clearPin() {
    pinTextController.text = '';
    isPinHasText.value = false;
  }

  onChangeTextPhone(String text) {
    onValidatePhone(text);
  }

  void clearTextPhone() {
    nameTextController.text = '';
    isPhoneNumberHasText.value = false;
  }

  void didTapLogin() async {
    var pass = pinTextController.text;
    onValidatePhoneText();
    onValidatePassText();
    if(errorPass.isNotEmpty || hasErrorPhone.isNotEmpty) {
      return;
    }
    FocusManager.instance.primaryFocus?.unfocus();
    String pattern = r'(^7[5,6]{1}[0-9]{6}$)';
    RegExp regExp = RegExp(pattern);
    final request = LoginRequest(
      username: (regExp.hasMatch(nameTextController.text))
          ? "670${nameTextController.text.trim()}"
          : nameTextController.text.trim(),
      password: pinTextController.text.trim(),
    );
    await openLoadingDialog();
    login(request).then((value) async {
      final accessToken = value?.data?.accessToken;
      final refreshToken = value?.data?.refreshToken;
      if (accessToken != null && refreshToken != null) {
        Map<String, dynamic> payload = Jwt.parseJwt(accessToken);
        final authorities = payload["authorities"];
        String strRole = "";
        if (authorities is List) {
          for (var element in authorities) {
            final role = element.toString().toUpperCase();
            if (role.contains("MERCHANT_OWNER")) {
              strRole = "MERCHANT_OWNER";
              break;
            } else if (role.contains("MERCHANT_STAFF")) {
              strRole = "MERCHANT_STAFF";
              break;
            }
          }
        }
        if (strRole.isNotEmpty) {
          if (strRole == "MERCHANT_OWNER") {
            checkPin(value?.data);
          } else {
            StorageData.instance.setAppToken(accessToken);
            StorageData.instance.setRefreshToken(refreshToken);
            StorageData.instance.setUserRole(strRole);
            if (Get.isRegistered<FCMController>()) {
              Get.find<FCMController>().registerDT();
            }
            await Get.offNamed(Routes.mainApp);
          }
        } else {
          errorPass.value = "Bạn không được cấp quyền sử dụng ứng dụng này".tr;
        }
      } else {
        tapCount.value++;
        if (pass.isEmpty) {
          errorPass.value = "Please input data".tr;
        } else if (value?.errorCode() == 4567) {
          await closeLoadingDialog();
          await showErrorBlockDevice(
              true,
              'Notification',
              value!.errorCodes!.elementAt(0).message ??
                  'Enter OTP incorrectly many times. Please retry \nafter 120 minutes.');
        } else if (value?.errorCode() == 1000) {
          errorPass.value = value?.errorMessage() ?? "";
        } else if (value?.errorCode() == 1003) {
          // errorPass.value = ("You are not authorized to use this app");
          errorPass.value = value?.errorMessage() ?? "";
        } else {
          await showErrorNetwork('Error', 'Network Error');
        }
        log('tap : ${tapCount.value}');
      }
    }).whenComplete(() async => await closeLoadingDialog());
  }

  checkPin(LoginData? data) async {
    await openLoadingDialog();
    final request = MerchantCheckPINRequest();
    merchantCheckPIN(request, data?.accessToken).then((value) async {
      if (value.message == "Success") {
        if (value.data?.isRegistered == true) {
          StorageData.instance.setAppToken(data?.accessToken);
          StorageData.instance.setRefreshToken(data?.refreshToken);
          StorageData.instance.setUserRole("MERCHANT_OWNER");
          if (Get.isRegistered<FCMController>()) {
            Get.find<FCMController>().registerDT();
          }
          await Get.offNamed(Routes.mainApp);
        } else {
          await Get.offNamed(Routes.newPinWhenFogot, arguments: {"data": data});
        }
      } else {
        await showErrorDialog(message: value.error);
      }
    }).catchError((error) async {
      await closeLoadingDialog();
      await showErrorOTP(tittle: error.toString(), check: true);
    }).whenComplete(() async => await closeLoadingDialog());
  }

  didTapMerchantForgotPass() async {
    await Get.toNamed(Routes.merchantForgotPassword);
  }

  didTapStaffForgotPass() {
    Get.toNamed(Routes.staffForgotPassword);
  }

  changeLanguage(String code) {
    StorageData.instance.setCurrentLanguage(code);
    LocalizationService().changeLocale(code);
  }

  List<SupportLanguage> getSupportLanguage() {
    final locale = LocalizationService().getCurrentLanguage();
    return SupportLanguage.values.where((element) {
      return element.locale != '${locale.languageCode}_${locale.countryCode}';
    }).toList();
  }

  exitApp() {
    if (Platform.isAndroid) {
      SystemNavigator.pop();
    } else if (Platform.isIOS) {
      exit(0);
    }
  }
}
