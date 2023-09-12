import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:vds/app/mainapp/main.app.controller.dart';
import 'package:vds/app/mainapp/main.app.dart';

class BottomBarNotInMain extends GetView<MainAppController> {
  const BottomBarNotInMain({super.key});

  @override
  Widget build(BuildContext context) {
    void hideKeyboard() {
      SystemChannels.textInput.invokeMethod('TextInput.hide');
    }

    if (!Get.isRegistered<MainAppController>()) return const SizedBox();
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index) async {
          // await Get.offNamedUntil(
          //   Routes.mainApp,
          //   (route) => Get.currentRoute == Routes.mainApp,
          // );
          hideKeyboard();
          Get.back();
          await controller.onChangeTab(index);
        },
        currentIndex: controller.currentIndex.value,
        fixedColor: const Color(0xFFA1A2A3),
        selectedFontSize: 12,
        unselectedItemColor: const Color(0xFFA1A2A3),
        unselectedLabelStyle:
            const TextStyle(color: Color(0xFFA1A2A3), fontSize: 12),
        selectedIconTheme: const IconThemeData(color: Color(0xFFA1A2A3)),
        selectedLabelStyle: const TextStyle(color: Colors.red, fontSize: 12),
        items: IconHome.values.map((element) {
          return BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 3.0),
              child: element.iconUnActive,
            ),
            activeIcon: Padding(
              padding: const EdgeInsets.only(bottom: 3.0),
              child: element.iconUnActive,
            ),
            label: element.text,
          );
        }).toList());
  }
}
