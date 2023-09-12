import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vds/app/component/bottom.bar.not.in.main.dart';
import 'package:vds/widget/button.widget.dart';
import 'package:vds/widget/text.form.widget.dart';
import 'reset_pin_otp_controller.dart';

class MerchantResetPinOTPPage extends GetView<MerchantResetPinOTPController> {
  const MerchantResetPinOTPPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        title: Text('OTP'.tr),
      ),
      // bottomNavigationBar: const BottomBarNotInMain(),
      body: Obx(() {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 15),
              TextFormFieldCustom(
                fillColor: Colors.white,
                borderRadiusOut: BorderRadius.circular(4),
                prefixIconWidget: const SizedBox(width: 13),
                contentPadding: const EdgeInsets.only(
                    left: 30, top: 10, bottom: 10, right: -15),
                borderFather:
                Border.all(color: const Color(0xFFDFE0EB), width: 0.6),
                controller: controller.otpTextController,
                isCollapsed: true,
                obscureText: true,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                label: Text.rich(TextSpan(
                    text: 'Nhập OTP'.tr,
                    style: const TextStyle(fontSize: 12),
                    children: const [
                      TextSpan(text: ' *', style: TextStyle(color: Colors.red))
                    ])),
                errorMessage: controller.otpError.value,
                onChanged: (value) => controller.onChangeNewPass(value),
              ),
              const SizedBox(
                height: 20,
              ),
              // BigButton(
              //   fontSize: 14,
              //   elevation: 0,
              //   padding: const EdgeInsets.symmetric(vertical: 17),
              //   // function: controller.changePasswordClick,
              //   text: 'Gửi OTP'.tr,
              // ),
              Text(
                'Thời gian còn lại'.tr,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF747475)
                ),
              ),

            ],
          ),
        );
      }),
    );
  }
}
