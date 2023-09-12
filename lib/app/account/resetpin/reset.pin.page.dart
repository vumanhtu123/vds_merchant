import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:vds/widget/button.widget.dart';
import 'package:vds/widget/text.form.widget.dart';
import '../../component/bottom.bar.not.in.main.dart';
import 'reset.pin.controller.dart';

class MerchantResetPinPage extends GetView<MerchantResetPinController> {
  const MerchantResetPinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 1,
        title: Text('Reset mã PIN'.tr),
      ),
      bottomNavigationBar: const BottomBarNotInMain(),
      body: Obx(() {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 15),
              TextFormFieldCustom(
                keyboardType: TextInputType.number,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(6),
                  FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                ],
                fillColor: Colors.white,
                borderRadiusOut: BorderRadius.circular(4),
                prefixIconWidget: const SizedBox(width: 13),
                contentPadding: const EdgeInsets.only(
                    left: 30, top: 10, bottom: 10, right: -15),
                borderFather:
                    Border.all(color: const Color(0xFFDFE0EB), width: 0.6),
                controller: controller.oldPINTextController,
                isCollapsed: true,
                obscureText: true,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                label: Text.rich(TextSpan(
                    text: 'Old PIN'.tr,
                    style: const TextStyle(fontSize: 12),
                    children: const [
                      TextSpan(text: ' *', style: TextStyle(color: Colors.red))
                    ])),
                errorMessage: controller.oldPINError.value,
                onChanged: (value) => controller.onChangeOldPass(value),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormFieldCustom(
                keyboardType: TextInputType.number,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(6),
                  FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                ],
                fillColor: Colors.white,
                borderRadiusOut: BorderRadius.circular(4),
                prefixIconWidget: const SizedBox(width: 13),
                contentPadding: const EdgeInsets.only(
                    left: 30, top: 10, bottom: 10, right: -15),
                borderFather:
                    Border.all(color: const Color(0xFFDFE0EB), width: 0.6),
                controller: controller.newPINTextController,
                isCollapsed: true,
                obscureText: true,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                label: Text.rich(TextSpan(
                    text: 'New PIN'.tr,
                    style: const TextStyle(fontSize: 12),
                    children: const [
                      TextSpan(text: ' *', style: TextStyle(color: Colors.red))
                    ])),
                errorMessage: controller.newPINError.value,
                onChanged: (value) => controller.onChangeNewPass(value),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormFieldCustom(
                keyboardType: TextInputType.number,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(6),
                ],
                fillColor: Colors.white,
                borderRadiusOut: BorderRadius.circular(4),
                prefixIconWidget: const SizedBox(width: 13),
                contentPadding: const EdgeInsets.only(
                    left: 30, top: 10, bottom: 10, right: -15),
                borderFather:
                    Border.all(color: const Color(0xFFDFE0EB), width: 0.6),
                controller: controller.renewPINTextController,
                isCollapsed: true,
                obscureText: true,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                label: Text.rich(TextSpan(
                    text: 'Re-enter new PIN'.tr,
                    style: const TextStyle(fontSize: 12),
                    children: const [
                      TextSpan(text: ' *', style: TextStyle(color: Colors.red))
                    ])),
                errorMessage: controller.renewPINError.value,
                onChanged: (value) => controller.onChangeRenewPass(value),
              ),
              const SizedBox(height: 20),
              BigButton(
                fontSize: 14,
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 17),
                function: () => controller.changePinClick(),
                text: 'Reset mã PIN'.tr,
              )
            ],
          ),
        );
      }),
    );
  }
}
