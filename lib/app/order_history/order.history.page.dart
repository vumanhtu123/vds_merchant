import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vds/common/enums.dart';
import 'package:vds/helper/convert.dart';
import 'package:vds/model/transition.model.dart';
import 'package:vds/widget/button.widget.dart';

import '../../model/withdraw.money.model.dart';
import '../component/bottom.bar.not.in.main.dart';
import 'component/choose.month.dart';
import 'order.history.controller.dart';

class OrderHistoryPage extends GetView<OrderHistoryController> {
  const OrderHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 1,
        title: Text('Lịch sử giao dịch'.tr),
      ),
      bottomNavigationBar: const BottomBarNotInMain(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(children: [
          const SizedBox(height: 10),
          Obx(() {
            return Row(
              children: [
                Expanded(
                  child: BigButton(
                    elevation: 0,
                    text: 'Thanh toán đơn hàng'.tr,
                    fontSize: 14,
                    textColor: controller.filterType.value == 1
                        ? Colors.white
                        : const Color(0xFF747475),
                    color: controller.filterType.value == 1
                        ? const Color(0xFFF4AD22)
                        : Colors.white,
                    border: controller.filterType.value == 1
                        ? const BorderSide(color: Color(0xFFF4AD22))
                        : const BorderSide(color: Color(0xFFDFE0EB)),
                    function: () => controller.onChangedFilter(1),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: BigButton(
                    elevation: 0,
                    text: 'Rút tiền'.tr,
                    textColor: controller.filterType.value == 2
                        ? Colors.white
                        : const Color(0xFF747475),
                    fontSize: 14,
                    color: controller.filterType.value == 2
                        ? const Color(0xFFF4AD22)
                        : Colors.white,
                    border: controller.filterType.value == 2
                        ? const BorderSide(color: Color(0xFFF4AD22))
                        : const BorderSide(color: Color(0xFFDFE0EB)),
                    function: () => controller.onChangedFilter(2),
                  ),
                ),
              ],
            );
          }),
          const SizedBox(height: 20),
          ChooseMonth(onCallBack: controller.onDateFilter),
          const Divider(
            color: Color(0xFFDFE0EB),
            height: 35,
            thickness: 1,
          ),
          Obx(() {
            if (controller.appState.value == MerAppState.loading) {
              return const SizedBox(
                height: 300,
                child: Center(child: CircularProgressIndicator()),
              );
            }
            if (controller.filterType.value == 1) {
              return (controller.transitions.isNotEmpty)
                  ? Expanded(
                      child: ListView.separated(
                        addAutomaticKeepAlives: true,
                        padding: EdgeInsets.zero,
                        controller: controller.scrollController,
                        itemBuilder: (context, index) {
                          var transition = controller.transitions[index];
                          return ChildTransition(transition: transition);
                        },
                        itemCount: controller.transitions.length,
                        separatorBuilder: (context, index) {
                          return const SizedBox.shrink();
                        },
                      ),
                    )
                  : (controller.checkInternet == true &&
                          controller.appState.value == MerAppState.success)
                      ? SizedBox(
                          height: 300,
                          child: Center(
                            child: Text(
                              'Network Error'.tr,
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.black),
                            ),
                          ),
                        )
                      : SizedBox(
                          height: 300,
                          child: Center(
                            child: Text(
                              'Data not found'.tr,
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.black),
                            ),
                          ),
                        );
            }
            return Expanded(
                child: (controller.withdraw.isNotEmpty)
                    ? ListView.separated(
                        addAutomaticKeepAlives: true,
                        padding: EdgeInsets.zero,
                        controller: controller.scrollController,
                        itemBuilder: (context, index) {
                          var withdraw = controller.withdraw[index];
                          return ChildWithdraw(withdrawMoney: withdraw);
                        },
                        itemCount: controller.withdraw.length,
                        separatorBuilder: (context, index) {
                          return const SizedBox.shrink();
                        },
                      )
                    : (controller.checkInternet == true &&
                            controller.appState.value == MerAppState.success)
                        ? SizedBox(
                            height: 300,
                            child: Center(
                              child: Text(
                                'Network Error'.tr,
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                            ),
                          )
                        : SizedBox(
                            height: 300,
                            child: Center(
                              child: Text(
                                'Data not found'.tr,
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                            ),
                          ));
          })
        ]),
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
                        fontSize: 12,
                        color: Color(0xFF747475),
                      ),
                    )
                  ],
                )),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '${transition.status == "SUCCESS" ? '+' : ''}${Convert.convertMoney(transition.price)} ${transition.currency!}',
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

class ChildWithdraw extends GetView<OrderHistoryController> {
  final Contents withdrawMoney;

  const ChildWithdraw({super.key, required this.withdrawMoney});

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
                          if (withdrawMoney.type != null) ...[
                            TextSpan(text: withdrawMoney.type),
                            const TextSpan(text: ' '),
                            TextSpan(text: 'Rút tiền'.tr)
                          ] else ...[
                            TextSpan(text: 'Rút tiền'.tr),
                          ],
                          const TextSpan(text: ' '),
                          // TextSpan(text: withdrawMoney.type ?? "")
                        ])),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      Convert.stringToDateHistory(withdrawMoney.dateTime ?? ""),
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF747475),
                      ),
                    )
                  ],
                )),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '${Convert.convertMoney(withdrawMoney.amount)} ${withdrawMoney.currency}',
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      withdrawMoney.statusTransition?.text ?? "",
                      style: TextStyle(
                          color: withdrawMoney.statusTransition?.color,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                )
              ],
            ),
            onTap: () => const SizedBox()),
        // controller.gotoDetailsTransaction(transition.transactionUUID!)),
        const Divider(
          thickness: 1,
          height: 30,
          color: Color(0xFFDFE0EB),
        )
      ],
    );
  }
}
