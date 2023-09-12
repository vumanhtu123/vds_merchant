import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vds/base/routes.dart';

class NewPinResetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewPinResetController>(() => NewPinResetController());
  }
}

class NewPinResetController extends GetxController {
  late GlobalKey<FormState> formKey;

  late TextEditingController pinTextController;
  late TextEditingController rePinTextController;

  final isPinHasText = false.obs;
  final isRePinHasText = false.obs;
  final hasErrorPin = false.obs;
  final hasErrorRepin = false.obs;

  @override
  void onInit() {
    pinTextController = TextEditingController();
    rePinTextController = TextEditingController();
    formKey = GlobalKey<FormState>();
    super.onInit();
  }

  @override
  void dispose() {
    pinTextController.dispose();
    rePinTextController.dispose();
    super.dispose();
  }

  onChangePin(String text) {
    if (text.isEmpty) {
      isPinHasText.value = false;
    } else {
      isPinHasText.value = true;
    }
  }

  void clearPin() {
    pinTextController.text = '';
    isPinHasText.value = false;
    hasErrorPin.value = false;
  }

  onChangeRePin(String text) {
    if (text.isEmpty) {
      isRePinHasText.value = false;
    } else {
      isRePinHasText.value = true;
    }
  }

  void clearTextRePin() {
    rePinTextController.text = '';
    isRePinHasText.value = false;
    hasErrorRepin.value = false;
  }

  onContinuteClick() {
    Get.until((route) => Get.currentRoute == Routes.login);
  }
}
