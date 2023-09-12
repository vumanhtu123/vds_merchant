import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vds/asset/Image.asset.dart';
import 'package:vds/helper/convert.dart';
import 'package:vds/widget/button.widget.dart';

import 'create.order.success.controller.dart';

class CreateOrderSuccessPage extends GetView<CreateOrderSuccessController> {
  const CreateOrderSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 1,
        title: Text(
          'Kết quả giao dịch'.tr,
        ),
      ),
      bottomNavigationBar: Container(
        height: 79,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              offset: const Offset(5, 0),
              blurRadius: 10,
              spreadRadius: 0,
              color: const Color(0xFF747475).withOpacity(0.12))
        ]),
        padding:
            const EdgeInsets.only(top: 14, bottom: 24, left: 16, right: 16),
        child: BigButton(
          function: () => Get.back(),
          text: 'Quay về trang chủ'.tr,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child:
          Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            Image.asset(
              ImageAsset.orderSuccess,
              width: 218,
            ),
            const SizedBox(
              height: 30,
            ),
            Text.rich(
              TextSpan(
                  text: 'Khách hàng'.tr,
                  style: const TextStyle(
                      fontSize: 14,
                      height: 22 / 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF747475)),
                  children: [
                    TextSpan(text: ' '.tr),
                    TextSpan(
                        text: controller.customer ?? "",
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF242424))),
                    TextSpan(text: ''.tr),
                    TextSpan(
                      text: 'đã thanh toán'.tr,
                    ),
                    const TextSpan(text: ' '),
                    TextSpan(
                        text: 'đơn hàng'.tr,
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF242424))),
                    TextSpan(text: ' '.tr),
                    TextSpan(
                        text: controller.code,
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF242424))),
                    TextSpan(text: ' '.tr),
                    TextSpan(text: 'với giá trị'.tr),
                    TextSpan(text: ' '.tr),
                    TextSpan(
                        text: '${controller.value} ${controller.current!}',
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFFF3B30))),
                    TextSpan(text: ' '.tr),
                    TextSpan(text: 'cho quý khách thành công'.tr),
                    TextSpan(text: '. '.tr),
                    TextSpan(text: 'Mã giao dịch'.tr),
                    TextSpan(text: ' '.tr),
                    TextSpan(
                        text: controller.orders ?? "",
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF242424))),
                    const TextSpan(text: '.'),
                  ]),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 15,
            ),
            Text.rich(
              TextSpan(
                  text: 'Thời gian thanh toán thành công'.tr,
                  style: const TextStyle(
                      fontSize: 14,
                      height: 22 / 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF747475)),
                  children: [
                    const TextSpan(text: ':\n'),
                    TextSpan(
                        text: Convert.stringToDateHistory(
                            controller.date ?? ""),
                        style: const TextStyle(
                            fontSize: 14,
                            height: 22 / 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF242424))),
                  ]),
              textAlign: TextAlign.center,
            )
          ],
        )
      ),
    );
  }
}
