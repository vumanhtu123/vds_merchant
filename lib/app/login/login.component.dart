import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vds/app/login/login.controller.dart';
import 'package:vds/asset/Image.asset.dart';
import 'package:vds/widget/button.widget.dart';
import 'package:vds/widget/text.form.widget.dart';

class LoginComponent extends GetView<LoginController> {
  const LoginComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
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
                  const SizedBox(height: 20),
                  TextFormFieldCustom(
                    controller: controller.nameTextController,
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    color: Colors.transparent,
                    fillColor: Colors.transparent,
                    onChanged: controller.onChangeTextPhone,
                    suffixIconWidget: Obx(() => controller
                            .isPhoneNumberHasText.value
                        ? GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () {
                              controller.clearTextPhone();
                            },
                            child: SvgPicture.asset(ImageAsset.removeTextIcon))
                        : const SizedBox.shrink()),
                    border: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFCCD0D5))),
                    labelFloatingStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                    labelText: 'Tên tài khoản'.tr,
                    hintText: 'Tên tài khoản'.tr,
                  ),
                  Obx(() => controller.hasErrorPhone.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            controller.hasErrorPhone.value,
                            style: const TextStyle(
                              height: 1,
                              fontSize: 12,
                              color: Color(0xFFFF3B30),
                            ),
                          ),
                        )
                      : const SizedBox.shrink()),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormFieldCustom(
                    textInput: '●',
                    controller: controller.pinTextController,
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    border: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFCCD0D5))),
                    color: Colors.transparent,
                    fillColor: Colors.transparent,
                    onChanged: controller.onChangePin,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    fontSize: 14,
                    letterSpacing: 6,
                    suffixIconWidget: Obx(() => controller.isPinHasText.value
                        ? GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () => controller.clearPin(),
                            child: SvgPicture.asset(ImageAsset.removeTextIcon))
                        : const SizedBox.shrink()),
                    labelFloatingStyle: const TextStyle(
                        fontSize: 18,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                    labelText: 'Mật khẩu'.tr,
                    hintText: 'Mật khẩu'.tr,
                  ),
                  Obx(() => controller.errorPass.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            controller.errorPass.value,
                            style: const TextStyle(
                                height: 1,
                                fontSize: 12,
                                color: Color(0xFFFF3B30)),
                          ),
                        )
                      : const SizedBox.shrink()),
                  const SizedBox(
                    height: 32,
                  ),
                  BigButton(
                    function: () => controller.didTapLogin(),
                    padding: const EdgeInsets.all(15),
                    text: 'Đăng nhập'.tr,
                    elevation: 0,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: MyTextButton(
                      function: controller.didTapMerchantForgotPass,
                      text: '${'Merchant quên mật khẩu'.tr}?',
                      textColor: const Color(0xFF6A6A6A),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: MyTextButton(
                      function: controller.didTapStaffForgotPass,
                      text: '${'Nhân viên quên mật khẩu'.tr}?',
                      textColor: const Color(0xFF6A6A6A),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 26),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     SvgPicture.asset(ImageAsset.fingerprint),
          //     const SizedBox(width: 12),
          //     const Text('Đăng nhập bằng vân tay')
          //   ],
          // ),
          // const SizedBox(height: 24),
          // Row(
          //   children: [
          //     const SizedBox(width: 30),
          //     const Expanded(
          //       child: Divider(
          //         height: 1,
          //         thickness: 1,
          //         color: Color(0xFFCCD0D5),
          //       ),
          //     ),
          //     const SizedBox(width: 15),
          //     Text('OR'.tr),
          //     const SizedBox(width: 30),
          //     const Expanded(
          //       child: Divider(
          //         height: 1,
          //         thickness: 1,
          //         color: Color(0xFFCCD0D5),
          //       ),
          //     ),
          //     const SizedBox(width: 15),
          //   ],
          // ),
          // const SizedBox(height: 24),
          // GestureDetector(
          //   behavior: HitTestBehavior.translucent,
          //   onTap: () => controller.onSetupNewPinClick(),
          //   child: const Text(
          //     'Set up new pin',
          //     style: TextStyle(
          //         decoration: TextDecoration.underline,
          //         color: Colors.blue,
          //         wordSpacing: 2),
          //   ),
          // ),
        ],
      ),
    );
  }
}
