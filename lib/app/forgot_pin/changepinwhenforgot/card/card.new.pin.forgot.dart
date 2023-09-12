import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:vds/widget/button.widget.dart';
import 'package:vds/widget/text.form.widget.dart';
import '../new.pin.forgot.controller.dart';

class CardNewPinWhenForgotComponent
    extends GetView<NewPinWhenForgotController> {
  const CardNewPinWhenForgotComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Card(
            shadowColor: Colors.black.withOpacity(0.8),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 28),
                  Center(
                    child: Text(
                      'Thiết lập mã PIN mới'.tr,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormFieldCustom(
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(6),
                      FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                    ],
                    controller: controller.newPINTextController,
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    border: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFCCD0D5))),
                    color: Colors.transparent,
                    fillColor: Colors.transparent,
                    onChanged: controller.onChangeNewPIN,
                    obscureText: true,
                    fontSize: 14,
                    letterSpacing: 6,
                    labelFloatingStyle: const TextStyle(
                        fontSize: 18,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                    // labelText: 'Enter PIN'.tr,
                    hintText: 'Mã PIN mới'.tr,
                    errorMessage: controller.newPINError.value,
                  ),
                  const SizedBox(height: 20),
                  TextFormFieldCustom(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(6),
                      FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                    ],
                    controller: controller.renewPINTextController,
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    border: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFCCD0D5))),
                    color: Colors.transparent,
                    fillColor: Colors.transparent,
                    onChanged: controller.onChangeRenewPIN,
                    obscureText: true,
                    fontSize: 14,
                    letterSpacing: 6,
                    keyboardType: TextInputType.number,
                    labelFloatingStyle: const TextStyle(
                        fontSize: 18,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                    hintText: 'Nhập lại mã PIN mới'.tr,
                    errorMessage: controller.renewPINError.value,
                  ),
                  const SizedBox(height: 32),
                  BigButton(
                    function: controller.onResetPinClick,
                    padding: const EdgeInsets.all(15),
                    text: 'continue'.tr.toUpperCase(),
                    elevation: 0,
                  ),
                  const SizedBox(height: 25),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}
