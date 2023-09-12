import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vds/base/routes.dart';
import 'package:vds/model/login_response.dart';

class SetupNewPinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SetupNewPinController>(() => SetupNewPinController());
  }
}

class SetupNewPinController extends GetxController {
  late GlobalKey<FormState> formKey;

  late TextEditingController phoneNumberTextController;

  final isPhoneNumberHasText = false.obs;
  final hasErrorPhoneNumber = false.obs;
  LoginData? data;

  @override
  void onInit() {
    phoneNumberTextController = TextEditingController();
    formKey = GlobalKey<FormState>();
    final arg = Get.arguments;
    if(arg is Map) {
      data = arg["data"];
    }
    super.onInit();
  }

  @override
  void dispose() {
    phoneNumberTextController.dispose();
    super.dispose();
  }

  onChangePhonenumber(String text) {
    if (text.isEmpty) {
      isPhoneNumberHasText.value = false;
    } else {
      isPhoneNumberHasText.value = true;
    }
  }

  void clearTextPhonenumber() {
    phoneNumberTextController.text = '';
    isPhoneNumberHasText.value = false;
    hasErrorPhoneNumber.value = false;
  }

  onContinuteClick() {
    Get.toNamed(Routes.newPinReset);
  }
}
