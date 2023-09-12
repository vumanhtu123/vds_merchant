import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vds/app/account/changepass/change.pass.staff.controller.dart';
import 'package:vds/widget/button.widget.dart';
import 'package:vds/widget/text.form.widget.dart';

import '../../component/bottom.bar.not.in.main.dart';

class ChangePassStaffPage extends GetView<ChangePassStaffController> {
  const ChangePassStaffPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 1,
        title: Text('Đổi mật khẩu'.tr),
      ),
      bottomNavigationBar: const BottomBarNotInMain(),
      body: Obx(() {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 15),
              TextFormFieldCustom(
                fillColor: Colors.white,
                borderRadiusOut: BorderRadius.circular(4),
                prefixIconWidget: const SizedBox(width: 13),
                contentPadding: const EdgeInsets.only(
                    left: 30, top: 10, bottom: 10, right: -15),
                borderFather:
                Border.all(color: const Color(0xFFDFE0EB), width: 0.6),
                controller: controller.oldPasswordTextController,
                isCollapsed: true,
                obscureText: true,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                label: Text.rich(TextSpan(
                    text: 'Old password'.tr,
                    style: const TextStyle(fontSize: 12),
                    children: const [
                      TextSpan(text: ' *', style: TextStyle(color: Colors.red))
                    ])),
                errorMessage: controller.oldPassError.value,
                onChanged: (value) => controller.onChangeOldPass(value),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormFieldCustom(
                fillColor: Colors.white,
                borderRadiusOut: BorderRadius.circular(4),
                prefixIconWidget: const SizedBox(width: 13),
                contentPadding: const EdgeInsets.only(
                    left: 30, top: 10, bottom: 10, right: -15),
                borderFather:
                Border.all(color: const Color(0xFFDFE0EB), width: 0.6),
                controller: controller.newPasswordTextController,
                isCollapsed: true,
                obscureText: true,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                label: Text.rich(TextSpan(
                    text: 'New password'.tr,
                    style: const TextStyle(fontSize: 12),
                    children: const [
                      TextSpan(text: ' *', style: TextStyle(color: Colors.red))
                    ])),
                errorMessage: controller.newPassError.value,
                onChanged: (value) => controller.onChangeNewPass(value),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormFieldCustom(
                fillColor: Colors.white,
                borderRadiusOut: BorderRadius.circular(4),
                prefixIconWidget: const SizedBox(width: 13),
                contentPadding: const EdgeInsets.only(
                    left: 30, top: 10, bottom: 10, right: -15),
                borderFather:
                Border.all(color: const Color(0xFFDFE0EB), width: 0.6),
                controller: controller.renewPasswordTextController,
                isCollapsed: true,
                obscureText: true,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                label: Text.rich(TextSpan(
                    text: 'Re-enter new password'.tr,
                    style: const TextStyle(fontSize: 12),
                    children: const [
                      TextSpan(text: ' *', style: TextStyle(color: Colors.red))
                    ])),
                errorMessage: controller.renewPassError.value,
                onChanged: (value) => controller.onChangeRenewPass(value),
              ),
              const SizedBox(height: 20),
              BigButton(
                fontSize: 14,
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 17),
                function: controller.changePasswordClick,
                text: 'Đổi mật khẩu'.tr,
              )
            ],
          ),
        );
      }),
    );
  }
}
