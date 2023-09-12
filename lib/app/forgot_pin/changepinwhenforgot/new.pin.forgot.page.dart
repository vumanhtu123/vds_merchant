import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vds/asset/Image.asset.dart';
import 'card/card.new.pin.forgot.dart';
import 'card/card.new.pin.otp.dart';
import 'new.pin.forgot.controller.dart';

class NewPinWhenForgotPage extends GetView<NewPinWhenForgotController> {
  const NewPinWhenForgotPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => controller.onBack(),
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Stack(
              children: [
                const SizedBox(
                    height: 260,
                    width: double.infinity,
                    child: ColoredBox(color: Color(0xFFF4AD22))),
                SizedBox(
                    height: Get.mediaQuery.padding.top,
                    width: double.infinity,
                    child: ColoredBox(
                        color: const Color(0xFFFF2E00).withOpacity(0.18))),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: SizedBox(
                      height: Get.height,
                      child: Obx(() {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 23 + Get.mediaQuery.padding.top,
                            ),
                            SvgPicture.asset(
                              ImageAsset.loginLogoSvg,
                              color: Colors.white,
                              height: 70,
                            ),
                            const SizedBox(height: 25),
                            (controller.inputPIN.isTrue)
                                ? const CardNewPinWhenForgotComponent()
                                : const CardNewPinOTPWhenForgotComponent()
                          ],
                        );
                      })),
                ),
                Positioned(
                  left: 23,
                  top: 28 + Get.mediaQuery.padding.top,
                  child: InkWell(
                    onTap: () => controller.onBack(),
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
