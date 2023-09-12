import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vds/asset/Image.asset.dart';
import 'package:vds/notification/notification.controller.dart';

class IconNotification extends GetView<NotificationController> {
  final bool isActive;
  const IconNotification({
    super.key,
    this.isActive = true,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SvgPicture.asset(
          ImageAsset.icBell,
          width: 25,
          height: 25,
          color: isActive ? Get.theme.primaryColor : const Color(0xFFA1A2A3),
        ),
        Positioned(
          left: 8,
          top: -8,
          child: Obx(
            () => controller.countNotificationUnread.value <= 0
                ? const SizedBox.shrink()
                : Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 4, vertical: 1.5),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(30)),
                    child: Text(
                      controller.countNotificationUnread.value.count,
                      style: const TextStyle(
                          fontSize: 12, height: 1.2, color: Colors.white),
                    )),
          ),
        )
      ],
    );
  }
}

extension CountNotificationTextExtension on int {
  String get count => _count();

  _count() {
    if (this > 99) {
      return '99+';
    }
    return toString().padLeft(2, '0');
  }
}
