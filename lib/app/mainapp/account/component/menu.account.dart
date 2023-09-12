import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vds/asset/Image.asset.dart';

import '../../../../base/translation/translation.dart';

class MenuAccount extends StatelessWidget {
  final List<MenuAccountEnum> menuItem;
  final Function(MenuAccountEnum) onTapItem;

  const MenuAccount({super.key, required this.menuItem, required this.onTapItem});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, left: 16, right: 16),
      child: Column(
        children: menuItem.map((e) {
          return MenuAccountChild(
            item: e,
            onTapItem: (e) => onTapItem(e),
          );
        }).toList(),
      ),
    );
  }
}

class MenuAccountChild extends StatelessWidget {

  final MenuAccountEnum item;
  final Function(MenuAccountEnum) onTapItem;
  const MenuAccountChild({super.key, required this.item, required this.onTapItem});

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

enum MenuAccountEnum { infoMerchant, resetPIN, changePass, settingLanguage, qr, logout}

extension MenuAccountEnumExtension on MenuAccountEnum {

  Widget get icon => _icon();

  Widget _icon() {
    switch (this) {
      case MenuAccountEnum.infoMerchant:
        return Image.asset(ImageAsset.iconInfoMerchant, width: 38, height: 38);
      case MenuAccountEnum.resetPIN:
        return Image.asset(ImageAsset.iconChangePass, width: 38, height: 38);
      case MenuAccountEnum.changePass:
        return Image.asset(ImageAsset.iconChangePass, width: 38, height: 38);
      case MenuAccountEnum.settingLanguage:
        return Image.asset(ImageAsset.iconSettingLanguage,
            width: 38, height: 38);
      case MenuAccountEnum.qr:
        return Image.asset(ImageAsset.iconAccountQrCode, width: 38, height: 38);
      case MenuAccountEnum.logout:
        return SvgPicture.asset(ImageAsset.iconLogout, width: 38, height: 38);
    }
  }

  String get title => _title();

  String _title() {
    switch (this) {
      case MenuAccountEnum.infoMerchant:
        return 'Thông tin Merchant'.tr;
      case MenuAccountEnum.resetPIN:
        return 'Reset mã PIN'.tr;
      case MenuAccountEnum.changePass:
        return 'Đổi mật khẩu'.tr;
      case MenuAccountEnum.settingLanguage:
        return 'Cài đặt ngôn ngữ'.tr;
      case MenuAccountEnum.qr:
        return 'QR của tôi'.tr;
      case MenuAccountEnum.logout:
        return 'Đăng xuất'.tr;
    }
  }

  String? get description => _description();

  String? _description() {
    switch (this) {
      case MenuAccountEnum.infoMerchant:
        return '${'Tên, email, số điện thoại'.tr}....'.tr;
      case MenuAccountEnum.resetPIN:
        return 'Thay đổi mã PIN hiện tại'.tr;
      case MenuAccountEnum.changePass:
        return 'Thay đổi mật khẩu hiện tại'.tr;
      case MenuAccountEnum.settingLanguage:
        return '${'Ngôn ngữ bạn đang sử dụng'.tr}: '
            '${SupportLanguage.values.firstWhereOrNull((element) => element.locale == Get.locale.toString())?.text}';
      case MenuAccountEnum.qr:
        return null;
      case MenuAccountEnum.logout:
        return null;
    }
  }
}
