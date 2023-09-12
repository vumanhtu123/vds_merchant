import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vds/asset/Image.asset.dart';
import 'card.forgot.pass.dart';
import 'forgot.pass.controller.dart';

class ForgotPasswordPage extends GetView<ForgotPasswordController> {
  const ForgotPasswordPage({super.key});

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
                  child: ColoredBox(color: const Color(0xFFFF2E00).withOpacity(0.18)),
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
                      const CardForgotPasswordComponent(),
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
