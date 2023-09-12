import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vds/asset/Image.asset.dart';

import '../../../../base/translation/translation.dart';

class StaffMenuAccount extends StatelessWidget {
  final List<StaffMenuAccountEnum> menuItem;
  final Function(StaffMenuAccountEnum) onTapItem;

  const StaffMenuAccount({super.key, required this.menuItem, required this.onTapItem});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, left: 16, right: 16),
      child: Column(
        children: menuItem.map((e) {
          return StaffMenuAccountChild(
            item: e,
            onTapItem: (e) => onTapItem(e),
          );
        }).toList(),
      ),
    );
  }
}

class StaffMenuAccountChild extends StatelessWidget {

  final StaffMenuAccountEnum item;
  final Function(StaffMenuAccountEnum) onTapItem;
  const StaffMenuAccountChild({super.key, required this.item, required this.onTapItem});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => onTapItem(item),
      child: Column(
        children: [
          const SizedBox(height: 15),
          Row(
            children: [
              item.icon,
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                  if (item.description != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      item.description ?? '',
                      style: const TextStyle(fontSize: 11),
                    )
                  ]
                ],
              )
            ],
          ),
          const SizedBox(height: 15),
          const SizedBox(
            width: double.infinity,
            child: Divider(
              height: 1,
              thickness: 1,
              color: Color(0xFFF6F7FB),
            ),
          )
        ],
      ),
    );
  }
}

enum StaffMenuAccountEnum { infoMerchant, resetPIN, changePass, settingLanguage, qr, logout}

extension StaffMenuAccountEnumExtension on StaffMenuAccountEnum {

  Widget get icon => _icon();

  Widget _icon() {
    switch (this) {
      case StaffMenuAccountEnum.infoMerchant:
        return Image.asset(ImageAsset.iconInfoMerchant, width: 38, height: 38);
      case StaffMenuAccountEnum.resetPIN:
        return Image.asset(ImageAsset.iconChangePass, width: 38, height: 38);
      case StaffMenuAccountEnum.changePass:
        return Image.asset(ImageAsset.iconChangePass, width: 38, height: 38);
      case StaffMenuAccountEnum.settingLanguage:
        return Image.asset(ImageAsset.iconSettingLanguage,
            width: 38, height: 38);
      case StaffMenuAccountEnum.qr:
        return Image.asset(ImageAsset.iconAccountQrCode, width: 38, height: 38);
      case StaffMenuAccountEnum.logout:
        return SvgPicture.asset(ImageAsset.iconLogout, width: 38, height: 38);
    }
  }

  String get title => _title();

  String _title() {
    switch (this) {
      case StaffMenuAccountEnum.infoMerchant:
        return 'Thông tin Staff'.tr;
      case StaffMenuAccountEnum.resetPIN:
        return 'Reset mã PIN'.tr;
      case StaffMenuAccountEnum.changePass:
        return 'Đổi mật khẩu'.tr;
      case StaffMenuAccountEnum.settingLanguage:
        return 'Cài đặt ngôn ngữ'.tr;
      case StaffMenuAccountEnum.qr:
        return 'QR của tôi'.tr;
      case StaffMenuAccountEnum.logout:
        return 'Đăng xuất'.tr;
    }
  }

  String? get description => _description();

  String? _description() {
    switch (this) {
      case StaffMenuAccountEnum.infoMerchant:
        return '${'Tên, email, số điện thoại'.tr}....'.tr;
      case StaffMenuAccountEnum.resetPIN:
        return 'Thay đổi mã PIN hiện tại'.tr;
      case StaffMenuAccountEnum.changePass:
        return 'Thay đổi mật khẩu hiện tại'.tr;
      case StaffMenuAccountEnum.settingLanguage:
        return '${'Ngôn ngữ bạn đang sử dụng'.tr}: '
            '${SupportLanguage.values.firstWhereOrNull((element) => element.locale == Get.locale.toString())?.text}';
      case StaffMenuAccountEnum.qr:
        return null;
      case StaffMenuAccountEnum.logout:
        return null;
    }
  }
}
