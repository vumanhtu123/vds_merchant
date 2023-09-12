import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vds/app/welcomepage/onboarding/onboarding.controller.dart';
import 'package:vds/asset/Image.asset.dart';
import 'package:vds/model/onboarding.model.dart';

class StepOnBoarding   extends GetView<OnBoardingController>{
  final OnboardingModel data;
  const StepOnBoarding(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ImageOnboard(
            imageUrl: data.image ?? '',
          ),
          Text(
            data.title ?? '',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              data.description ?? '',
              textAlign: TextAlign.center,
              style: const TextStyle(color: Color(0xFFA1AEDB), height: 17 / 14),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class ImageOnboard extends StatelessWidget {
  final String imageUrl;
  const ImageOnboard({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    if (imageUrl.contains(baseAsset)) {
      return Image.asset(
        imageUrl,
        fit: BoxFit.fitWidth,
      );
    }
    if (imageUrl.contains('http://') || imageUrl.contains('https://')) {
      return Image.network(imageUrl);
    }
    return Image.asset(ImageAsset.placeholder);
  }
}
