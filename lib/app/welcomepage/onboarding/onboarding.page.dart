import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vds/app/welcomepage/onboarding/step/step.dart';
import 'package:vds/widget/button.widget.dart';

import 'onboarding.controller.dart';
import 'step/dot.step.dart';

class OnBoardingPage extends GetView<OnBoardingController> {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
              child: Obx(() => PageView(
                    onPageChanged: controller.changePage,
                    controller: controller.pageController,
                    children: controller.dataOnBoarding
                        .map((data) => StepOnBoarding(data))
                        .toList(),
                  )),
            ),
            Obx(() {
              if(controller.currentIndex.value ==
                  controller.dataOnBoarding.length - 1) {
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: 20 + MediaQuery.of(context).padding.bottom,
                  ),
                  child: SmallButton(
                    function: controller.skip,
                    borderRadius: BorderRadius.circular(5),
                    text: 'Get Started'.tr,
                    fontSize: 18,
                    buttonSize: const Size(246, 47),
                    color: const Color(0xFFF4AD22),
                  ),
                );
              }
              return const BottomOnBoarding();
            }),
          ],
        ),
      ),
    );
  }
}

class BottomOnBoarding extends GetView<OnBoardingController> {
  const BottomOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
        bottom: 20 + MediaQuery.of(context).padding.bottom
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyTextButton(
            function: () => controller.skip(),
            text: 'Skip',
            fontSize: 16,
            textColor: const Color(0xFF5F768B),
          ),
          Expanded(
            child: Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: controller.dataOnBoarding
                      .map((data) =>
                          DotStep(controller.dataOnBoarding.indexOf(data)))
                      .toList(),
                )),
          ),
          MyTextButton(
            function: () => controller.next(),
            text: 'Next',
            fontSize: 16,
            textColor: const Color(0xFF3F91FF),
          )
        ],
      ),
    );
  }
}
