import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vds/app/welcomepage/welcome.controller.dart';
import 'package:vds/asset/Image.asset.dart';
import 'package:vds/setting/setting.controller.dart';
import 'package:vds/widget/button.widget.dart';

class WelcomePage extends GetView<WelcomeController> {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final settingController = Get.find<SettingController>();
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                alignment: Alignment.bottomCenter,
                fit: BoxFit.fitWidth,
                image: AssetImage(
                  ImageAsset.loginBackground,
                ),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 60),
                SvgPicture.asset(
                  ImageAsset.loginLogoSvg,
                  width: 82,
                  height: 80,
                  color: Get.theme.primaryColor,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Mosan Agent brings you tons of services '
                      '\nin the most convinient ways',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                Image.asset(
                  ImageAsset.loginThumnail,
                  width: 280,
                ),
                BigButton(
                  margin: const EdgeInsets.fromLTRB(70, 20, 70, 15),
                  function: () => controller.goToMerchantLogin(),
                  borderRadius: BorderRadius.circular(6),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  fontSize: 18,
                  elevation: 0,
                  textColor: Colors.black,
                  color: Colors.white,
                  text: 'Merchant login'.tr,
                ),
                BigButton(
                  margin: const EdgeInsets.only(left: 70, right: 70),
                  function: () => controller.goToStaffLogin(),
                  borderRadius: BorderRadius.circular(6),
                  border: const BorderSide(color: Colors.white, width: 2),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  fontSize: 18,
                  elevation: 0,
                  textColor: Colors.white,
                  color: Get.theme.primaryColor,
                  text: 'Staff Login'.tr,
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Obx(() {
                    return Text.rich(
                      TextSpan(text: 'Version'.tr, children: [
                        const TextSpan(text: ' : '),
                        TextSpan(text: settingController.version.value)
                      ]),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    );
                  }),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
