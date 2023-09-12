import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vds/common/enums.dart';
import 'package:vds/helper/convert.dart';
import 'package:vds/widget/button.widget.dart';
import 'revoke.money.ho.accept.controller.dart';

class RevokeMoneyHOAcceptPage extends GetView<RevokeMoneyHOAcceptController> {
  const RevokeMoneyHOAcceptPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        title: Text('Transaction confirmation'.tr),
      ),
      body: Obx(() {
        if (controller.appState.value == MerAppState.loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (controller.appState.value == MerAppState.failed) {
          return InkWell(
            onTap: () => controller.getWithdrawFee(),
            child: Center(child: Text(controller.messageError ?? "")),
          );
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const SizedBox(height: 25),
                  InfoWithTitle(
                    title: 'Account receiving money'.tr,
                    isPrice: true,
                    info:
                        '${Convert.convertMoney(controller.amount.value)} ${controller.current.value}',
                  ),
                  const SizedBox(height: 8),
                  const Divider(
                    height: 1,
                    thickness: 1,
                    color: Color(0xFFF6F7FB),
                  ),
                  const SizedBox(height: 8),
                  InfoWithTitle(
                    title: 'Phí giao dịch'.tr,
                    info: controller.feeMoney.value == 0
                        ? 'Miễn phí'.tr
                        : '${Convert.convertMoney(controller.feeMoney.value)} ${controller.current.value}',
                  ),
                  const SizedBox(height: 8),
                  const Divider(
                    height: 1,
                    thickness: 1,
                    color: Color(0xFFF6F7FB),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                ],
              ),
              Column(
                children: [
                  const Divider(
                    height: 1,
                    thickness: 1,
                    color: Color(0xFFF6F7FB),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  InfoWithTitle(
                    title: 'Total amount'.tr,
                    isPrice: true,
                    info:
                        '${Convert.convertMoney(controller.totalMoney.value)} ${controller.current.value}',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: SizedBox(
                      height: 42,
                      child: Builder(
                        builder: (context) {
                          return BigButton(
                              function: () => controller.accept(context),
                              text: 'Xác nhận'.tr);
                        },
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      }),
    );
  }
}

class InfoWithTitle extends StatelessWidget {
  final String title;
  final String info;
  final bool isPrice;

  const InfoWithTitle(
      {super.key,
      required this.title,
      required this.info,
      this.isPrice = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(color: Color(0xFF9A9CAD)),
        ),
        Text(info,
            style: const TextStyle(
                color: Color(0xFFFF3B30), fontWeight: FontWeight.w600)),
      ],
    );
  }
}
