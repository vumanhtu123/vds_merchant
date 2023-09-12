import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:vds/widget/button.widget.dart';
import 'package:vds/widget/text.form.widget.dart';
import 'new.pass.forgot.controller.dart';

class CardNewPassWhenForgotComponent
    extends GetView<NewPassWhenForgotController> {
  const CardNewPassWhenForgotComponent({super.key});

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
                  SizedBox(
                    width: Get.width,
                    child: Text(
                      'NEW PASSWORD'.tr,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormFieldCustom(
                    inputFormatters: [LengthLimitingTextInputFormatter(6)],
                    controller: controller.otpTextController,
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    border: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFCCD0D5))),
                    color: Colors.transparent,
                    fillColor: Colors.transparent,
                    onChanged: controller.onChangeOTP,
                    obscureText: true,
                    fontSize: 14,
                    letterSpacing: 6,
                    suffixIconWidget: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Obx(() {
                          if (controller.isCanResent.isTrue) {
                            return const SizedBox.shrink();
                          }
                          return Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(
                              '${'${controller.countDownTime.value}'.padLeft(2, '0')}s',
                              style: const TextStyle(
                                  height: 0.7, color: Color(0xFF848688)),
                            ),
                          );
                        })
                      ],
                    ),
                    labelFloatingStyle: const TextStyle(
                        fontSize: 18,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                    labelText: 'Nhập OTP'.tr,
                    hintText: 'Nhập OTP'.tr,
                    keyboardType: TextInputType.number,
                    errorMessage: controller.otpError.value,
                  ),
                  Obx(() => !controller.isCanResent.value
                      ? const SizedBox.shrink()
                      : GestureDetector(
                          onTap: controller.resendOTP,
                          behavior: HitTestBehavior.translucent,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5, top: 15.0),
                            child: Text(
                              'Resend'.tr,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  height: 0.7,
                                  color: Color(0xFF3F91FF)),
                            ),
                          ),
                        )),
                  const SizedBox(height: 20),
                  TextFormFieldCustom(
                    controller: controller.newPassTextController,
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
                    labelText: 'Mật khẩu mới'.tr,
                    hintText: 'Mật khẩu mới'.tr,
                    errorMessage: controller.newPassError.value,
                  ),
                  const SizedBox(height: 20),
                  TextFormFieldCustom(
                    controller: controller.renewPassTextController,
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    border: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFCCD0D5))),
                    color: Colors.transparent,
                    fillColor: Colors.transparent,
                    onChanged: controller.onChangeRenewPIN,
                    obscureText: true,
                    fontSize: 14,
                    letterSpacing: 6,
                    labelFloatingStyle: const TextStyle(
                        fontSize: 18,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                    labelText: 'Nhập lại mật khẩu mới'.tr,
                    hintText: 'Nhập lại mật khẩu mới'.tr,
                    errorMessage: controller.renewPassError.value,
                  ),
                  const SizedBox(height: 32),
                  BigButton(
                    function: controller.onSetNewPass,
                    padding: const EdgeInsets.all(15),
                    text: 'RESET PASSWORD'.tr.toUpperCase(),
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
