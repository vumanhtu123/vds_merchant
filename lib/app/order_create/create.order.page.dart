import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:vds/common/decimal_formatter.dart';
import 'package:vds/widget/button.widget.dart';
import 'package:vds/widget/text.form.widget.dart';
import '../component/bottom.bar.not.in.main.dart';
import 'create.order.controller.dart';

class CreateOrderPage extends GetView<CreateOrderController> {
  const CreateOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DismissKeyboard(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 1,
        title: Text(
          'Tạo mới đơn hàng'.tr,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      bottomNavigationBar: const BottomBarNotInMain(),
      body: SingleChildScrollView(
        //fix lỗi giao diện khi hiển thị bàn phím thật
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Obx(() {
                return TextFormFieldCustom(
                  fillColor: Colors.white,
                  borderRadiusOut: BorderRadius.circular(4),
                  prefixIconWidget: const SizedBox(width: 13),
                  contentPadding: const EdgeInsets.fromLTRB(30, 10, -15, 10),
                  borderFather:
                      Border.all(color: const Color(0xFFDFE0EB), width: 0.6),
                  controller: controller.codeTextController,
                  isCollapsed: true,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  label: Text.rich(
                    TextSpan(
                      text: 'Mã đơn hàng'.tr,
                      style: const TextStyle(fontSize: 12),
                      children: const [
                        TextSpan(
                          text: ' *',
                          style: TextStyle(color: Colors.red),
                        )
                      ],
                    ),
                  ),
                  onChanged: (value) => controller.onChangeOrderCode(value),
                  errorMessage: controller.orderCodeError.value,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-Z]")),
                    LengthLimitingTextInputFormatter(20),
                  ],
                );
              }),
              const SizedBox(
                height: 20,
              ),
              TextFormFieldCustom(
                inputFormatters: [
                  LengthLimitingTextInputFormatter(50),
                  FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-Z\\s]")),
                ],
                fillColor: Colors.white,
                borderRadiusOut: BorderRadius.circular(4),
                prefixIconWidget: const SizedBox(width: 13),
                contentPadding: const EdgeInsets.fromLTRB(30, 10, -15, 10),
                borderFather: Border.all(
                  color: const Color(0xFFDFE0EB),
                  width: 0.6,
                ),
                controller: controller.descriptionTextController,
                // isCollapsed: true,
                maxLines: 7,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                hintText: 'Nội dung'.tr,
              ),
              const SizedBox(
                height: 20,
              ),
              Obx(() {
                return TextFormFieldCustom(
                  fillColor: Colors.white,
                  borderRadiusOut: BorderRadius.circular(4),
                  prefixIconWidget: const SizedBox(width: 13),
                  contentPadding: const EdgeInsets.fromLTRB(30, 10, -15, 10),
                  borderFather: Border.all(
                    color: const Color(0xFFDFE0EB),
                    width: 0.6,
                  ),
                  controller: controller.priceTextController,
                  isCollapsed: true,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  suffixIconWidget: const Padding(
                    padding: EdgeInsets.only(right: 11.0, left: 5),
                    child: Text(
                      ' USD',
                      style: TextStyle(color: Color(0xFF747475), fontSize: 12),
                    ),
                  ),
                  label: Text.rich(
                    style: const TextStyle(fontSize: 12),
                    TextSpan(
                      text: 'Giá trị'.tr,
                      children: const [
                        TextSpan(
                          text: ' *',
                          style: TextStyle(color: Colors.red),
                        )
                      ],
                    ),
                  ),
                  keyboardType: const TextInputType.numberWithOptions(
                      decimal: true, signed: true),
                  inputFormatters: [
                    DecimalFormatter(),
                    LengthLimitingTextInputFormatter(9),
                    FilteringTextInputFormatter.allow(RegExp(r"[0-9.,]")),
                  ],
                  onChanged: (value) => controller.onChangePrice(value),
                  errorMessage: controller.priceError.value,
                );
              }),
              const SizedBox(height: 20),
              BigButton(
                fontSize: 14,
                elevation: 0,
                function: controller.didTapCreateOrder,
                text: 'Tạo QR thanh toán'.tr,
              )
            ],
          ),
        ),
      ),
    ));
  }
}
