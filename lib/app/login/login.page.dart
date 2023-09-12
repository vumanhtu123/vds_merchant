import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vds/asset/Image.asset.dart';
import 'package:vds/base/translation/translation.dart';
import 'package:vds/setting/setting.controller.dart';
import 'login.controller.dart';
import 'package:slider_captcha/slider_capchar.dart';
import 'login.component.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => controller.exitApp(),
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
                          height: 40,
                        ),
                        const Expanded(
                          child: LoginComponent(),
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     SvgPicture.asset(ImageAsset.americanFlag,
                        //         height: 32),
                        //     const SizedBox(
                        //       width: 45,
                        //     ),
                        //     SvgPicture.asset(ImageAsset.timorLesteFlag,
                        //         height: 32)
                        //   ],
                        // ),
                        SizedBox(
                          height: 34,
                          width: 84,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              var locale =
                                  controller.getSupportLanguage()[index];
                              return GestureDetector(
                                behavior: HitTestBehavior.translucent,
                                onTap: () {
                                  controller
                                      .changeLanguage(locale.languageCode);
                                  Get.back();
                                },
                                child: Row(
                                  children: [
                                    const SizedBox(width: 25),
                                    locale.flagCircle,
                                    const SizedBox(width: 25),
                                  ],
                                ),
                              );
                            },
                            itemCount: SupportLanguage.values.length - 1,
                          ),
                        ),
                        const SizedBox(
                          height: 19,
                        ),
                        Obx(() => Text.rich(
                              TextSpan(text: 'Version'.tr, children: [
                                const TextSpan(text: ' '),
                                TextSpan(
                                    text: Get.find<SettingController>()
                                        .version
                                        .value)
                              ]),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Color(0xFFA6A6A6),
                                  fontWeight: FontWeight.w400),
                            )),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
                // Positioned(
                //   left: 23,
                //   top: 28 + Get.mediaQuery.padding.top,
                //   child: InkWell(
                //     onTap: () => controller.exitApp(),
                //     child: const Icon(
                //       Icons.arrow_back_ios,
                //       size: 28,
                //       color: Colors.white,
                //     ),
                //   ),
                // ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 60, horizontal: 20),
                  child: ShowCapCha(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ShowCapCha extends GetView<LoginController> {
  const ShowCapCha({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Visibility(
        visible: (controller.tapCount.value >= 5)
            ? controller.visibility.value = true
            : controller.visibility.value = false,
        child: SliderCaptcha(
          image: Image.asset(
            'assets/images/vietnam.png',
            fit: BoxFit.fitHeight,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 150,
            alignment: Alignment.center,
          ),
          colorBar: Colors.grey,
          colorCaptChar: Colors.blueAccent,
          captchaSize: 5,
          title: '  Xác minh bạn không phải là người máy',
          // space: 10,
          // fixHeightParent: false,
          borderImager: 5,
          onConfirm: (value) async {
            // debugPrint(value.toString());
            if (value == false) {
              return;
            } else {
              return await Future.delayed(const Duration(seconds: 2)).then(
                    (value) {
                  controller.tapCount.value = 4;
                  controller.visibility.value = false;
                },
              );
            }
          },
        ),
      );
    });
  }
}

// class ShowBlock extends GetView<LoginController> {
//   const ShowBlock({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//       () => Visibility(
//           visible: (controller.statusDevice.value == true)
//               ? controller.visibility.value = true
//               : controller.visibility.value = false,
//           child: Stack(
//             children: [
//               Container(
//                 height: MediaQuery.of(context).size.height - 150,
//                 color: Colors.black,
//               ),
//               Center(
//                   child: Text(
//                 'Time : ${controller.timerCountDown}',
//                 style: TextStyle(color: Colors.white),
//               ))
//             ],
//           )),
//     );
//   }
// }
