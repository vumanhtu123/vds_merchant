import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vds/app/component/view.invoice.dart';
import 'package:vds/asset/Image.asset.dart';
import 'package:vds/common/storage_data.dart';
import 'package:vds/helper/convert.dart';
import 'package:vds/model/invoice_response.dart';

import '../../model/order.details.model.dart';

class InfoOrderCreate extends StatelessWidget {
  final Data order;
  final InvoiceData data;
  final bool? checker;

  const InfoOrderCreate(
      {super.key,
      required this.order,
      required this.data,
      required this.checker});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 16,
        ),
        Text('Thông tin giao dịch'.tr,
            style: const TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(
          height: 20,
        ),
        Column(
          children: [
            InfoDayTranfer(
              dayTranfer: order.createdDate?.split(' ').last ?? '',
            ),
            const Divider(
              height: 33,
              thickness: 1,
              color: Color(0xFFF6F7FB),
            ),
          ],
        ),
        InfoContent(
          content: order.content ?? '',
        ),
        const Divider(
          height: 33,
          thickness: 1,
          color: Color(0xFFF6F7FB),
        ),
        InfoPrice(
          price:
              "${Convert.convertMoney(order.originalPrice)} ${order.currency ?? "USD"}",
        ),
        const Divider(
          height: 33,
          thickness: 1,
          color: Color(0xFFF6F7FB),
        ),
        InfoStatus(
          status: order,
        ),
        const SizedBox(height: 16),
        const Divider(
          height: 1,
          thickness: 1,
          color: Color(0xFFF6F7FB),
        ),
        const SizedBox(height: 15),
        if (StorageData.instance.isMerchant()) ...[
          InfoEmployee(employee: order.staff),
        ],
        if (order.currentStatus == OrderStatus.SUCCEED && checker != true) ...[
          const SizedBox(height: 15),
          Center(
            child: InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(ImageAsset.iconView),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Xem hóa đơn'.tr,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF3F91FF),
                      ),
                    ),
                  ],
                ),
                onTap: () => showInvoice(data: data, tittle: 'View Invoice')),
          ),
          // ViewInvoice(data: data),
          const SizedBox(height: 16),
          const Divider(
            thickness: 1,
            color: Color(0xFFF6F7FB),
          ),
        ],
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
              'Ngày tạo Giao dịch'.tr,
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
                Convert.stringToDateAll(dayTranfer),
              ),
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
              'Nội dung'.tr,
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
              'Giá trị'.tr,
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
  final Data status;

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
              'Trạng thái thanh toán'.tr,
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
                child: StatusWidget(status: status.status ?? "")))
      ],
    );
  }
}

class StatusWidget extends StatelessWidget {
  final String status;

  const StatusWidget({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: ColoredBox(
        color: status == "WAITING_TO_PAY"
            ? OrderStatus.WAITING_TO_PAY.color
            : (status == "SUCCEED")
                ? OrderStatus.SUCCEED.color
                : (status == "CANCELLED")
                    ? OrderStatus.CANCELLED.color
                    : (status == "PARTIALLY_PAID")
                        ? OrderStatus.PARTIALLY_PAID.color
                        : OrderStatus.EXPIRED.color,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
          child: Text(
            status == "WAITING_TO_PAY"
                ? OrderStatus.WAITING_TO_PAY.text
                : (status == "SUCCEED")
                    ? OrderStatus.SUCCEED.text
                    : (status == "CANCELLED")
                        ? OrderStatus.CANCELLED.text
                        : (status == "PARTIALLY_PAID")
                            ? OrderStatus.PARTIALLY_PAID.text
                            : OrderStatus.EXPIRED.text,
            style: const TextStyle(
                color: Colors.white, fontSize: 11, fontWeight: FontWeight.w400),
          ),
        ),
      ),
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
