import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../asset/Image.asset.dart';
import '../../helper/convert.dart';
import '../../model/invoice_response.dart';

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

  const InvoiceService({
    super.key,
    required this.title,
    required this.info,
  });

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
              fontWeight: FontWeight.w600,
            ),
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
                decoration: TextDecoration.none,
              ),
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
                    fontStyle: FontStyle.normal),
              )),
          const SizedBox(
            width: 12,
          ),
          Text(
            Convert.stringToDateAll(dayInvoice ?? ""),
            style: const TextStyle(
                fontSize: 14,
                decoration: TextDecoration.none,
                fontWeight: FontWeight.w400,
                color: Color(0xFF242424)),
          ),
        ],
      ),
    );
  }
}

Future<void> showInvoice({
  required final InvoiceData data,
  required String tittle,
}) async {
  final overlayContext = Get.overlayContext;
  if (overlayContext != null) {
    return showDialog(
      context: Get.context!,
      barrierDismissible: false,
      barrierColor: Colors.black45,
      builder: (BuildContext context) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: const BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.all(Radius.circular(6))),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                margin: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 17,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () => Get.back(),
                          child: SvgPicture.asset(ImageAsset.iconClose),
                        )
                      ],
                    ),
                    Center(
                      child: Text(
                        tittle,
                        style: const TextStyle(
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Color(0xFF242424)),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InvoiceInfo(
                      title: 'Invoice Code',
                      info: data.invoiceCode,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Divider(
                      height: 1,
                      thickness: 1,
                      color: Color(0xFFF6F7FB),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    InvoiceInfo(
                      title: 'Order Code',
                      info: data.orderCode,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Divider(
                      height: 1,
                      thickness: 1,
                      color: Color(0xFFF6F7FB),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    InvoiceInfo(
                      title: 'Customer name',
                      info: data.customerName,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Divider(
                      height: 1,
                      thickness: 1,
                      color: Color(0xFFF6F7FB),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    DayInvoice(
                      dayInvoice: data.createdOrderDate,
                      title: 'Create order',
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Divider(
                      height: 1,
                      thickness: 1,
                      color: Color(0xFFF6F7FB),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    DayInvoice(
                      dayInvoice: data.paymentDate,
                      title: 'Payment date',
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Divider(
                      height: 1,
                      thickness: 1,
                      color: Color(0xFFF6F7FB),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    InvoiceService(
                      title: 'Content',
                      info: data.content,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Divider(
                      height: 1,
                      thickness: 1,
                      color: Color(0xFFF6F7FB),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    InvoiceAmount(
                      title: 'Amount',
                      info: data.originalPrice.toString(),
                      current: data.currency.toString(),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Divider(
                      height: 1,
                      thickness: 1,
                      color: Color(0xFFF6F7FB),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    InvoiceInfo(
                      title: 'Discount',
                      info: (data.discountedPrice != null)
                          ? "${data.discountedPrice} ${data.currency!}"
                          : '0',
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Divider(
                      height: 1,
                      thickness: 1,
                      color: Color(0xFFF6F7FB),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    InvoiceTotal(
                        title: 'Total',
                        info: data.totalPrice.toString(),
                        current: data.currency ?? ""),
                    const SizedBox(
                      height: 12,
                    ),
                    const Divider(
                      height: 1,
                      thickness: 1,
                      color: Color(0xFFF6F7FB),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    InvoiceStatus(
                      title: 'Payment status',
                      info: data.paymentStatus,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
