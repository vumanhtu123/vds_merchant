import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vds/app/component/bottom.bar.not.in.main.dart';
import 'package:vds/helper/convert.dart';
import 'package:vds/model/transition.model.dart';
import 'component/choose.month.dart';
import 'order.history.controller.dart';

class StaffOrderHistoryPage extends GetView<OrderHistoryController> {
  const StaffOrderHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        title: Text('Lịch sử giao dịch'.tr),
      ),
      bottomNavigationBar: const BottomBarNotInMain(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 20),
            ChooseMonth(
              onCallBack: controller.onDateFilter,
            ),
            const Divider(
              color: Color(0xFFDFE0EB),
              height: 35,
              thickness: 1,
            ),
            Expanded(
              child: Obx(() {
                if (controller.transitions.isEmpty) {
                  return const SizedBox(
                    height: 300,
                    child: Text(
                      'Data not found',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                  );
                }
                return ListView.separated(
                  addAutomaticKeepAlives: true,
                  padding: EdgeInsets.zero,
                  controller: controller.scrollController,
                  itemBuilder: (context, index) {
                    var transition = controller.transitions[index];
                    return ChildTransition(transition: transition);
                    // return SizedBox();
                  },
                  itemCount: controller.transitions.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox.shrink();
                  },
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}

class ChildTransition extends GetView<OrderHistoryController> {
  final Content transition;

  const ChildTransition({super.key, required this.transition});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(TextSpan(
                        style: const TextStyle(fontWeight: FontWeight.w600),
                        children: [
                          if (transition.customerName != null) ...[
                            TextSpan(text: transition.customerName),
                            const TextSpan(text: ' '),
                            TextSpan(text: 'Thanh toán đơn hàng'.tr)
                          ] else ...[
                            TextSpan(text: 'Thanh toán đơn hàng'.tr),
                          ],
                          const TextSpan(text: ' '),
                          TextSpan(text: transition.transactionCode ?? "")
                        ])),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      Convert.stringToDateHistory(transition.createdDate ?? ''),
                      style: const TextStyle(
                          fontSize: 12, color: Color(0xFF747475)),
                    )
                  ],
                )),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '${transition.status == "SUCCESS" ? '+' : ''}'
                      '${Convert.convertMoney(transition.price)} ${transition.currency!}',
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      transition.statusTransition?.text ?? "",
                      style: TextStyle(
                          color: transition.statusTransition?.color,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                )
              ],
            ),
            onTap: () => controller.gotoDetailsTransaction(
                transition.transactionUUID ?? "",
                transition.orderUUID ?? "",
                true,
                transition.transactionCode!)),
        const Divider(
          thickness: 1,
          height: 30,
          color: Color(0xFFDFE0EB),
        )
      ],
    );
  }
}
