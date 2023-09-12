import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vds/app/welcomepage/onboarding/onboarding.controller.dart';

class DotStep extends GetView<OnBoardingController> {
  final int index;
  const DotStep(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          width: 10,
          height: 10,
          margin: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: index == controller.currentIndex.value
                  ? const Color(0xFF3F91FF)
                  : Colors.white,
              border: Border.all(color: const Color(0xFF3F91FF))),
        ));
  }
}
