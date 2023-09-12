import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vds/asset/Image.asset.dart';
import 'package:vds/base/routes.dart';
import 'package:vds/model/onboarding.model.dart';

class OnBoardingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnBoardingController>(() => OnBoardingController());
  }
}

class OnBoardingController extends GetxController {

  Future<List<OnboardingModel>> getDataOnboarding() async {
    return [
      OnboardingModel(
          title: 'Recieve Money'.tr,
          description: 'To / From Your Friends And Relatives'.tr,
          image: ImageAsset.onboarding1Image),
      OnboardingModel(
          title: 'Pay Bill'.tr,
          description:
          'Including Electricity Bill, Phone \nTop-up, Scan QR Code To Pay'
              .tr,
          image: ImageAsset.onboarding2Image),
      OnboardingModel(
          title: 'Discount, Special Event'.tr,
          description: 'Get Unlimited Promotions And Discounts From MOSAN'.tr,
          image: ImageAsset.onboarding3Image)
    ];
  }

  final RxList<OnboardingModel> dataOnBoarding = <OnboardingModel>[
    OnboardingModel(),
    OnboardingModel(),
    OnboardingModel(),
  ].obs;

  final currentIndex = 0.obs;
  late PageController pageController;

  @override
  void onInit() {
    getDataOnBoarding();
    pageController = PageController();
    super.onInit();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void getDataOnBoarding() async {
    dataOnBoarding.clear();
    var temp = await getDataOnboarding();
    currentIndex.value = 0;
    dataOnBoarding.addAll(temp);
    dataOnBoarding.refresh();
  }

  void changePage(int value) {
    currentIndex.value = value;
  }

  void next() {
    pageController.nextPage(
        duration: const Duration(milliseconds: 500), curve: Curves.linear);
  }

  void skip() {
    Get.offNamed(Routes.login);
  }
}
