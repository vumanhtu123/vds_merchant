import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.orange,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: SvgPicture.asset('assets/images/logo_splas.svg',
                  width: 150,
                  height: 150,
                ),
              ),
              const SizedBox(height: 100),
              Column(
                children: [
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: Lottie.network(
                      'https://lottie.host/ee249ec8-ac37-41c8-8bab-58c41b74f2ac/4FjOx1jl8N.json',
                      errorBuilder: (e,c,b) {
                        return const SizedBox.shrink();
                      }
                    ),
                  ),
                  const Text(
                    'LOADING',
                    style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFFFFFFFF),
                        fontWeight: FontWeight.w400),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
