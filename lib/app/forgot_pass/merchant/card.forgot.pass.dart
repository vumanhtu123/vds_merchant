import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:vds/common/enums.dart';
import 'package:vds/widget/button.dropdown.dart';
import 'package:vds/widget/text.form.widget.dart';
import '../../../widget/button.widget.dart';
import 'forgot.pass.controller.dart';

class CardForgotPasswordComponent extends GetView<ForgotPasswordController> {
  const CardForgotPasswordComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
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
                    const SizedBox(height: 28),
                    Center(
                      child: Text(
                        'FORGOT PASSWORD'.tr,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormFieldCustom(
                      controller: controller.phoneNumberController,
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      color: Colors.transparent,
                      fillColor: Colors.transparent,
                      onChanged: controller.onChangeTextPhone,
                      border: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFCCD0D5)),
                      ),
                      labelFloatingStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(11),
                        FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                      ],
                      labelText: 'Số điện thoại'.tr,
                      hintText: 'Số điện thoại'.tr,
                      keyboardType: TextInputType.number,
                      errorMessage: controller.phoneError.value,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        SizedBox(
                          width: 140,
                          child: Column(
                            children: [
                              const SizedBox(height: 15),
                              ButtonDropdownLine<ForgetPassTypeEnum>(
                                selectedItem: controller.chooseType,
                                hintText: 'Type',
                                items: ForgetPassTypeEnum.values,
                                childReturnChoose: (value) {
                                  return Text(
                                    value.text,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Color(0xff747475),
                                    ),
                                  );
                                },
                                textButton: (value) {
                                  var text = value.text;
                                  if (text.isEmpty) {
                                    text = "Type";
                                  }
                                  return Text(
                                    text,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color((text == "Type")
                                          ? 0xff9A9CAD
                                          : 0xff747475),
                                    ),
                                  );
                                },
                                childReturn: (value) {
                                  return Text(
                                    value.text,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Color(0xff747475),
                                    ),
                                  );
                                },
                                callback: controller.onChangeType,
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 15),
                                width: double.infinity,
                                height: 1,
                                color: const Color(0xFFCCD0D5),
                              ),
                              if (controller.typeError.isNotEmpty) ...[
                                const SizedBox(height: 5),
                                Text(
                                  controller.typeError.value,
                                  style:
                                      const TextStyle(color: Color(0xFFFF3B30)),
                                )
                              ],
                            ],
                          ),
                        ),
                        const SizedBox(width: 25),
                        Expanded(
                          child: TextFormFieldCustom(
                            controller: controller.idController,
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            border: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFCCD0D5)),
                            ),
                            color: Colors.transparent,
                            fillColor: Colors.transparent,
                            onChanged: controller.onChangeID,
                            obscureText: false,
                            fontSize: 14,
                            letterSpacing: 1,
                            inputFormatters: [controller.textInput.value],
                            labelFloatingStyle: const TextStyle(
                              fontSize: 18,
                              letterSpacing: 0,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                            keyboardType: controller.textInputType.value,
                            labelText: 'ID'.tr,
                            hintText: 'ID'.tr,
                            errorMessage: controller.idError.value,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    BigButton(
                      function: controller.continueButtonClick,
                      padding: const EdgeInsets.all(15),
                      text: 'continute'.tr.toUpperCase(),
                      elevation: 0,
                    ),
                    const SizedBox(height: 25),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
