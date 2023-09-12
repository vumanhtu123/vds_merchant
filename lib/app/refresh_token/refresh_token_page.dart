import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'refresh_token_controller.dart';

class RefreshTokenPage extends GetView<RefreshTokenController> {
  const RefreshTokenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RefreshTokenController>(
      init: RefreshTokenController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.orange,
          body: SizedBox(
            width: Get.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset('assets/images/logo_splas.svg',
                  width: 150,
                  height: 150,
                ),
                const SizedBox(height: 100),
                Lottie.network(
                    'https://lottie.host/ee249ec8-ac37-41c8-8bab-58c41b74f2ac/4FjOx1jl8N.json'),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    '${'Tài khoản hết hạn đăng nhập. Đang thực hiện đăng nhập lại'.tr}...',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 18,
                        color: Color(0xFFFFFFFF),
                        fontWeight: FontWeight.w400),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
