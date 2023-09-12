import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vds/app/details_transactions/details.payment.controller.dart';
import 'package:vds/helper/convert.dart';

import '../../asset/Image.asset.dart';

class DetailsPaymentPage extends GetView<DetailsPaymentController> {
  const DetailsPaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 1,
          title: Text('Lịch sử giao dịch'.tr),
        ),
        body: Obx(() {
          return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  InvoiceInfo(
                    title: 'Transaction Code',
                    info:
                        controller.detailsTran.value!.transactionId.toString(),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Divider(
                    height: 1,
                    thickness: 1,
                    color: Color(0xFFF6F7FB),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  InvoiceInfo(
                    title: 'Order Code',
                    info: controller.detailsTran.value!.orderCode,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Divider(
                    height: 1,
                    thickness: 1,
                    color: Color(0xFFF6F7FB),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  InvoiceInfo(
                    title: 'Customer name',
                    info: controller.detailsTran.value!.customerName,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Divider(
                    height: 1,
                    thickness: 1,
                    color: Color(0xFFF6F7FB),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  DayInvoice(
                    dayInvoice: controller.detailsTran.value!.orderDate,
                    title: 'Create Date',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Divider(
                    height: 1,
                    thickness: 1,
                    color: Color(0xFFF6F7FB),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  DayInvoice(
                    dayInvoice: controller.detailsTran.value!.paymentDate,
                    title: 'Payment date',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Divider(
                    height: 1,
                    thickness: 1,
                    color: Color(0xFFF6F7FB),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  InvoiceService(
                    title: 'Content',
                    info: controller.detailsTran.value!.content,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Divider(
                    height: 1,
                    thickness: 1,
                    color: Color(0xFFF6F7FB),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  InvoiceAmount(
                    title: 'Amount',
                    info: controller.detailsTran.value!.amount.toString(),
                    current: controller.detailsTran.value!.currency,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Divider(
                    height: 1,
                    thickness: 1,
                    color: Color(0xFFF6F7FB),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  InvoiceInfo(
                    title: 'Discount',
                    info: (controller.detailsTran.value!.discount != null)
                        ? '${controller.detailsTran.value!.discount} ${controller.detailsTran.value!.currency} '
                        : '0',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Divider(
                    height: 1,
                    thickness: 1,
                    color: Color(0xFFF6F7FB),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  InvoiceTotal(
                      title: 'Total',
                      info:
                          controller.detailsTran.value!.total.toString() ?? "",
                      current: controller.detailsTran.value!.currency ?? ""),
                  const SizedBox(
                    height: 15,
                  ),
                  const Divider(
                    height: 1,
                    thickness: 1,
                    color: Color(0xFFF6F7FB),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  InvoiceStatus(
                    title: 'Payment status',
                    info: controller.detailsTran.value!.status,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Divider(
                    height: 1,
                    thickness: 1,
                    color: Color(0xFFF6F7FB),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  (controller.detailsTran.value!.status == "SUCCESS")
                      ? Center(
                          child: InkWell(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(ImageAsset.iconView),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Xem đơn hàng'.tr,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF3F91FF),
                                    ),
                                  ),
                                ],
                              ),
                              onTap: () => controller.gotoOrderDetails(
                                  controller.detailsTran.value!.orderUUID,
                                  true)),
                        )
                      : const SizedBox(
                          height: 15,
                        ),
                  const Divider(
                    height: 1,
                    thickness: 1,
                    color: Color(0xFFF6F7FB),
                  ),
                ],
              ));
        }));
  }
}

class InvoiceTotal extends StatelessWidget {
  final String title;
  final String info;
  final String current;

  const InvoiceTotal(
      {super.key,
      required this.title,
      required this.info,
      required this.current});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                decoration: TextDecoration.none,
                fontSize: 14,
                color: Color(0xFF747475),
                fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            "${Convert.convertMoney(info)} $current",
            softWrap: true,
            style: const TextStyle(
                fontSize: 14,
                color: Color(0xFFFF3B30),
                fontWeight: FontWeight.w600,
                decoration: TextDecoration.none),
          ),
        ],
      ),
    );
  }
}

class InvoiceStatus extends StatelessWidget {
  final String? title;
  final String? info;

  const InvoiceStatus({super.key, required this.title, required this.info});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title ?? "",
            style: const TextStyle(
                decoration: TextDecoration.none,
                fontSize: 14,
                color: Color(0xFF747475),
                fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 2,
          ),
          (info == 'SUCCESS')
              ? Text(
                  info ?? "",
                  softWrap: true,
                  style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF00CC6A),
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.none),
                )
              : Text(
                  info ?? "",
                  softWrap: true,
                  style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFFFF3B30),
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.none),
                )
        ],
      ),
    );
  }
}

class InvoiceInfo extends StatelessWidget {
  final String? title;
  final String? info;

  const InvoiceInfo({super.key, required this.title, required this.info});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title ?? '',
            style: const TextStyle(
                decoration: TextDecoration.none,
                fontSize: 14,
                color: Color(0xFF747475),
                fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            info ?? "",
            softWrap: true,
            style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF242424),
                fontWeight: FontWeight.w400,
                decoration: TextDecoration.none),
          ),
        ],
      ),
    );
  }
}

class InvoiceService extends StatelessWidget {
  final String? title;
  final String? info;

  const InvoiceService({super.key, required this.title, required this.info});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title ?? "",
            style: const TextStyle(
                decoration: TextDecoration.none,
                fontSize: 14,
                color: Color(0xFF242424),
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 2,
          ),
          SizedBox(
            width: 165,
            child: Text(
              info ?? "",
              softWrap: true,
              textAlign: TextAlign.right,
              style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF242424),
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.none),
            ),
          ),
        ],
      ),
    );
  }
}

class InvoiceAmount extends StatelessWidget {
  final String? title;
  final String? info;
  final String? current;

  const InvoiceAmount(
      {super.key,
      required this.title,
      required this.info,
      required this.current});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title ?? "",
            style: const TextStyle(
                decoration: TextDecoration.none,
                fontSize: 14,
                color: Color(0xFF242424),
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 2,
          ),
          SizedBox(
            width: 165,
            child: Text(
              "${Convert.convertMoney(info)} $current",
              softWrap: true,
              textAlign: TextAlign.right,
              style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF242424),
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.none),
            ),
          ),
        ],
      ),
    );
  }
}

class DayInvoice extends StatelessWidget {
  final String? dayInvoice;
  final String? title;

  const DayInvoice({super.key, required this.dayInvoice, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Text(
                title ?? "",
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  decoration: TextDecoration.none,
                  color: Color(0xFF747475),
                ),
              )),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            flex: 3,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                Convert.stringToDatePayment(dayInvoice ?? ""),
                style: const TextStyle(
                    fontSize: 14,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF242424)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
