import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vds/asset/Image.asset.dart';
import 'package:vds/widget/button.widget.dart';
import 'package:vds/widget/text.form.widget.dart';
import 'staff.forgot.pass.controller.dart';

class StaffForgotPasswordPage extends GetView<StaffForgotPasswordController> {
  const StaffForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Stack(
              children: [
                const SizedBox(
                  height: 260,
                  width: double.infinity,
                  child: ColoredBox(color: Color(0xFFF4AD22)),
                ),
                SizedBox(
                  height: Get.mediaQuery.padding.top,
                  width: double.infinity,
                  child: ColoredBox(
                      color: const Color(0xFFFF2E00).withOpacity(0.18)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 23 + Get.mediaQuery.padding.top),
                      SvgPicture.asset(
                        ImageAsset.loginLogoSvg,
                        color: Colors.white,
                        height: 70,
                      ),
                      const SizedBox(height: 25),
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
                                  'Quên mật khẩu'.tr,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Obx(() {
                                return TextFormFieldCustom(
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(11),
                                  ],
                                  controller: controller.phoneNumberController,
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.auto,
                                  color: Colors.transparent,
                                  fillColor: Colors.transparent,
                                  onChanged: controller.onChangeTextPhone,
                                  border: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFFCCD0D5)),
                                  ),
                                  labelFloatingStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                  labelText: 'Số điện thoại'.tr,
                                  hintText: 'Số điện thoại'.tr,
                                  keyboardType: TextInputType.number,
                                  errorMessage: controller.phoneError.value,
                                );
                              }),
                              const SizedBox(height: 20),
                              BigButton(
                                function: controller.continueButtonClick,
                                padding: const EdgeInsets.all(15),
                                text: 'continute'.tr.toUpperCase(),
                                elevation: 0,
                              ),
                              const SizedBox(height: 25),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () => Get.back(),
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 20,
                      top: Get.mediaQuery.padding.top + 23,
                    ),
                    child: const Icon(
                      Icons.arrow_back_ios,
                      size: 28,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
