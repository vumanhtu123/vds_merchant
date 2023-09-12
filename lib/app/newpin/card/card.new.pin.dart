import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vds/asset/Image.asset.dart';
import 'package:vds/widget/button.widget.dart';
import 'package:vds/widget/text.form.widget.dart';
import '../new.pin.controller.dart';

class CardSetupNewPinComponent extends GetView<SetupNewPinController> {
  const CardSetupNewPinComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Card(
            shadowColor: Colors.black.withOpacity(0.8),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 28,
                  ),
                  Center(
                      child: Text(
                    'Thiết lập mật khẩu mới'.tr.toUpperCase(),
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  )),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormFieldCustom(
                      controller: controller.phoneNumberTextController,
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      border: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFCCD0D5))),
                      color: Colors.transparent,
                      fillColor: Colors.transparent,
                      onChanged: controller.onChangePhonenumber,
                      fontSize: 14,
                      letterSpacing: 36,
                      suffixIconWidget: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Obx(() => controller.isPhoneNumberHasText.value
                              ? GestureDetector(
                                  behavior: HitTestBehavior.translucent,
                                  onTap: () {
                                    controller.clearTextPhonenumber();
                                  },
                                  child: SizedBox(
                                      height: 30,
                                      child: Align(
                                        alignment: Alignment.bottomRight,
                                        child: SvgPicture.asset(
                                            ImageAsset.removeTextIcon),
                                      )))
                              : const SizedBox.shrink()),
                        ],
                      ),
                      labelFloatingStyle: const TextStyle(
                          fontSize: 18,
                          letterSpacing: 0,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                      labelText: 'Số điện thoại'.tr,
                      hintText: 'Số điện thoại'.tr),
                  const SizedBox(
                    height: 32,
                  ),
                  BigButton(
                    function: controller.onContinuteClick,
                    padding: const EdgeInsets.all(15),
                    text: 'continute'.tr,
                    elevation: 0,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
