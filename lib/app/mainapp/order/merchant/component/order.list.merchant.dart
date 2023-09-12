import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vds/app/mainapp/order/merchant/merchant.order.controller.dart';
import 'package:vds/asset/Image.asset.dart';
import 'package:vds/common/enums.dart';
import 'package:vds/helper/convert.dart';
import 'package:vds/model/orders.model.dart';
import 'package:vds/widget/button.widget.dart';

class OrderListMerchant extends GetView<MerchantOrderController> {
  const OrderListMerchant({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => controller.onGetMerchantOrder(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BigButton(
              margin: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              function: () => controller.goToCreateOrderPage(),
              elevation: 0,
              text: 'Tạo giao dịch'.tr),
          Expanded(
            child: Obx(() {
              if (controller.appState.value == MerAppState.loading) {
                return const Center(child: CircularProgressIndicator());
              } else if (controller.errorNetwork.value == true &&
                  controller.appState.value == MerAppState.failed) {
                return Center(
                  child: (controller.errorNetwork.value == true)
                      ? const Text('Network Error')
                      : const SizedBox(),
                );
              }
              return ListView.separated(
                padding: EdgeInsets.zero,
                addAutomaticKeepAlives: true,
                controller: controller.scrollController,
                itemBuilder: (context, index) {
                  var order = controller.orders[index];
                  return ChildOrder(order: order, index: index);
                },
                itemCount: controller.orders.length,
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox.shrink();
                },
              );
            }),
          )
        ],
      ),
    );
  }
}

class ChildOrder extends GetView<MerchantOrderController> {
  const ChildOrder({
    Key? key,
    required this.order,
    required this.index,
  }) : super(key: key);

  final Content order;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(
          top: index == 0 ? 15 : 12.5, bottom: 12.5, right: 16, left: 16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
                blurRadius: 10,
                offset: const Offset(0, 0),
                color: const Color(0xFF747475).withOpacity(0.12)),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      SvgPicture.asset(ImageAsset.iconHandWithMoney),
                      const SizedBox(
                        width: 7,
                      ),
                      Expanded(
                        child: Text(
                          order.orderCode ?? '',
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                      text: "${Convert.convertMoney(order.originalPrice)} ",
                      style: const TextStyle(
                          color: Color(0xFFFF3B30),
                          fontWeight: FontWeight.w600,
                          height: 18 / 14),
                      children: [TextSpan(text: order.currency ?? "USD")]),
                  strutStyle: const StrutStyle(height: 18 / 14),
                )
              ],
            ),
          ),
          const Divider(
            height: 1,
            thickness: 1,
            color: Color(0xFFF6F7FB),
          ),
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SizedBox(
              height: 42,
              child:
                  // order.customerName != null
                  //     ? Row(
                  //         children: [
                  //           Expanded(
                  //             child: InfoWithTitle(
                  //                 title: 'Tên khách hàng'.tr,
                  //                 info: order.customerName ?? ''),
                  //           ),
                  //           const VerticalDivider(),
                  //           const SizedBox(
                  //             width: 15,
                  //           ),
                  //           // Expanded(
                  //           //   child:
                  //             InfoWithTitle(
                  //                 title: 'Ngày tạo Giao dịch'.tr,
                  //                 info: order.createdAt ?? ''),
                  //           // ),
                  //         ],
                  //       )
                  //     :
                  Row(children: [
                Expanded(
                  child: InfoWithTitle(
                      title: 'Ngày tạo Giao dịch'.tr,
                      info:
                          Convert.stringToDatePromotion(order.createdAt ?? '')),
                ),
                const VerticalDivider(),
                const Expanded(child: SizedBox())
              ]),
            ),
          ),
          const SizedBox(
            height: 13,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: StatusWidget(status: order.status ?? ""),
          ),
          const Divider(
            height: 26,
            thickness: 1,
            color: Color(0xFFF6F7FB),
          ),
          order.staff?.staffName == null
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 16),
                    child: DefaultTextStyle(
                      style: const TextStyle(fontWeight: FontWeight.w600),
                      child: MyTextButton(
                        function: () => controller.goToDetail(order),
                        text: 'Xem chi tiết'.tr,
                        textColor: const Color(0xFF325EA5),
                      ),
                    ),
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Visibility(
                      visible: true,
                      child: InfoEmployee(employee: order.staff),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 16),
                      child: DefaultTextStyle(
                        style: const TextStyle(fontWeight: FontWeight.w600),
                        child: MyTextButton(
                          function: () => controller.goToDetail(order),
                          text: 'Xem chi tiết'.tr,
                          textColor: const Color(0xFF325EA5),
                        ),
                      ),
                    )
                  ],
                )
        ],
      ),
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
          SvgPicture.string(
            employee!.barcodeString,
            width: 30,
            height: 30,
          ),
          const SizedBox(
            width: 5,
          ),
          InfoWithTitle(
            title: 'Nhân viên'.tr,
            info: employee!.staffName ?? '',
          )
        ],
      ),
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
            style: const TextStyle(color: Colors.white),
          ),
        ),
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
        SizedBox(
          width: 130,
          child: Text(
            info,
            softWrap: false,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
