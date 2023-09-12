import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vds/asset/Image.asset.dart';
import 'card/card.new.pin.dart';
import 'new.pin.controller.dart';

class SetupNewPinPage extends GetView<SetupNewPinController> {
  const SetupNewPinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
          body: Stack(
        children: [
          const SizedBox(
              height: 260,
              width: double.infinity,
              child: ColoredBox(color: Color(0xFFF4AD22))),
          SizedBox(
              height: Get.mediaQuery.padding.top,
              width: double.infinity,
              child:
                  ColoredBox(color: const Color(0xFFFF2E00).withOpacity(0.18))),
          Positioned(
              left: 23,
              top: 28 + Get.mediaQuery.padding.top,
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  Get.back();
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  size: 28,
                  color: Colors.white,
                ),
              )),
          Padding(
            padding: const EdgeInsets.all(8),
            child: SizedBox(
                height: Get.height,
                width: double.infinity,
                child: Column(
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
                    const SizedBox(
                      height: 25,
                    ),
                    const Expanded(
                      child: CardSetupNewPinComponent(),
                    ),
                  ],
                )),
          )
        ],
      )),
    );
  }
}
