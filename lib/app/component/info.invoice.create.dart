import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vds/asset/Image.asset.dart';
import 'package:vds/helper/convert.dart';

import '../../model/details.transaction.model.dart';
import '../../model/order.details.model.dart';

class InfoInvoiceCreate extends StatelessWidget {
  final DataTransaction data;

  const InfoInvoiceCreate({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 16,
        ),
        Text('Invoice information'.tr,
            style: const TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(
          height: 20,
        ),
        Column(
          children: [
            InfoDayTranfer(
              dayTranfer: data.transactionId.toString(),
            ),
            const Divider(
              height: 33,
              thickness: 1,
              color: Color(0xFFF6F7FB),
            ),
          ],
        ),
        InfoContent(
          content: data.customerName ?? '',
        ),
        const Divider(
          height: 33,
          thickness: 1,
          color: Color(0xFFF6F7FB),
        ),
        InfoDay(
          dayTranfer: Convert.stringToDateAll(data.paymentDate ?? ""),
        ),
        const Divider(
          height: 33,
          thickness: 1,
          color: Color(0xFFF6F7FB),
        ),
        InfoStatus(
          status:
              "${Convert.convertMoney(data.discount)} ${data.currency ?? "USD"}",
        ),
        const Divider(
          height: 33,
          thickness: 1,
          color: Color(0xFFF6F7FB),
        ),
        InfoPrice(
          price:
              "${Convert.convertMoney(data.total)} ${data.currency ?? "USD"}",
        ),
        const SizedBox(height: 16),
        const Divider(
          height: 1,
          thickness: 1,
          color: Color(0xFFF6F7FB),
        ),
      ],
    );
  }
}

class InfoDayTranfer extends StatelessWidget {
  final String dayTranfer;

  const InfoDayTranfer({super.key, required this.dayTranfer});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(ImageAsset.iconCalendarBlank),
        const SizedBox(
          width: 5,
        ),
        Expanded(
            flex: 2,
            child: Text(
              'Invoice code'.tr,
              style: const TextStyle(
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
              child: Text(dayTranfer),
            ))
      ],
    );
  }
}

class InfoDay extends StatelessWidget {
  final String dayTranfer;

  const InfoDay({super.key, required this.dayTranfer});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(ImageAsset.iconCalendarBlank),
        const SizedBox(
          width: 5,
        ),
        Expanded(
            flex: 2,
            child: Text(
              'Payment date'.tr,
              style: const TextStyle(
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
              child: Text(dayTranfer),
            ))
      ],
    );
  }
}

class InfoContent extends StatelessWidget {
  final String content;

  const InfoContent({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(ImageAsset.iconArticle),
        const SizedBox(
          width: 5,
        ),
        Expanded(
            flex: 2,
            child: Text(
              'Customer'.tr,
              style: const TextStyle(
                color: Color(0xFF747475),
              ),
            )),
        const SizedBox(
          width: 20,
        ),
        Expanded(
            flex: 3,
            child:
                Align(alignment: Alignment.centerRight, child: Text(content)))
      ],
    );
  }
}

class InfoPrice extends StatelessWidget {
  final String price;

  const InfoPrice({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(ImageAsset.iconMoney),
        const SizedBox(
          width: 5,
        ),
        Expanded(
            flex: 2,
            child: Text(
              'Total'.tr,
              style: const TextStyle(
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
                price,
                style: const TextStyle(
                    color: Color(0xFFFF3B30),
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ))
      ],
    );
  }
}

class InfoStatus extends StatelessWidget {
  final String status;

  const InfoStatus({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(ImageAsset.iconMoneyHand),
        const SizedBox(
          width: 5,
        ),
        Expanded(
            flex: 2,
            child: Text(
              'Discount'.tr,
              style: const TextStyle(
                color: Color(0xFF747475),
              ),
            )),
        const SizedBox(
          width: 20,
        ),
        Expanded(
            flex: 3,
            child: Align(alignment: Alignment.centerRight, child: Text(status)))
      ],
    );
  }
}

class InfoUser extends StatelessWidget {
  final String customerName;

  const InfoUser({super.key, required this.customerName});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(ImageAsset.iconUser),
        const SizedBox(
          width: 5,
        ),
        Expanded(
            flex: 2,
            child: Text(
              'Tên khách hàng'.tr,
              style: const TextStyle(
                color: Color(0xFF747475),
              ),
            )),
        const SizedBox(
          width: 20,
        ),
        Expanded(
            flex: 3,
            child: Align(
                alignment: Alignment.centerRight, child: Text(customerName)))
      ],
    );
  }
}

class InfoEmployee extends StatelessWidget {
  final Staff? employee;

  const InfoEmployee({super.key, required this.employee});

  @override
  Widget build(BuildContext context) {
    if (employee == null) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, bottom: 15),
      child: Row(
        children: [
          Image.memory(
            base64Decode((employee?.qrCode ?? "")
                .replaceAll("data:image/png;base64,", "")),
            errorBuilder: (c, v, b) => const SizedBox.shrink(),
            width: 30,
            height: 30,
            fit: BoxFit.fill,
          ),
          const SizedBox(
            width: 5,
          ),
          InfoWithTitle(
            title: 'Nhân viên'.tr,
            info: employee?.fullName ?? '',
          )
        ],
      ),
    );
  }
}

class InfoWithTitle extends StatelessWidget {
  final String title;
  final String info;

  const InfoWithTitle({super.key, required this.title, required this.info});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 12, color: Color(0xFF747475)),
        ),
        const SizedBox(
          height: 2,
        ),
        Text(
          info,
          softWrap: true,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
