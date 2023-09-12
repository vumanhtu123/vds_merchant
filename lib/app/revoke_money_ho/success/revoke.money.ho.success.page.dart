import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vds/app/revoke_money_ho/component/custom.devider.dart';
import 'package:vds/asset/Image.asset.dart';
import 'package:vds/helper/convert.dart';
import 'package:vds/widget/button.widget.dart';

import 'revoke.money.ho.success.controller.dart';

class RevokeMoneyHOSuccessPage extends GetView<RevokeMoneyHOSuccessController> {
  const RevokeMoneyHOSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          backgroundColor: const Color(0xFFF2F5F7),
          appBar: AppBar(
            centerTitle: true,
            leading: const SizedBox.shrink(),
            elevation: 1,
            title: Text('Yêu cầu rút tiền thành công'.tr),
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  offset: const Offset(5, 0),
                  blurRadius: 10,
                  color: const Color(0xFF747475).withOpacity(0.12))
            ]),
            padding: const EdgeInsets.only(
                left: 16.0, right: 16, bottom: 30, top: 14),
            child: SizedBox(
                height: 42,
                child: BigButton(
                    function: controller.close, text: 'Quay về trang chủ'.tr)),
          ),
          body: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: double.infinity,
                      margin:
                          const EdgeInsets.only(left: 30, right: 30, top: 55),
                      padding: const EdgeInsets.only(top: 55),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                color:
                                    const Color(0xFF747475).withOpacity(0.12))
                          ]),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              'Giao dịch của Quý khách đã thành công!'.tr,
                              style:
                                  const TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              'Nếu bạn gặp bất cứ vấn đề nào, vui lòng liên hệ bộ phận chăm sóc khách hàng để được hỗ trợ.'
                                  .tr,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 12),
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Row(
                            children: [
                              CustomPaint(
                                size: const Size(8, 16),
                                painter: CustomDivider(),
                              ),
                              const SizedBox(
                                width: 3,
                              ),
                              const Expanded(
                                child: DottedLine(
                                  direction: Axis.horizontal,
                                  lineLength: double.infinity,
                                  lineThickness: 1.0,
                                  dashGapLength: 5,
                                  dashLength: 6.0,
                                  dashColor: Color(0xFFF2F5F7),
                                ),
                              ),
                              const SizedBox(
                                width: 3,
                              ),
                              CustomPaint(
                                size: const Size(8, 16),
                                painter: CustomDivider(inLeft: false),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          InfoWithTitle(
                            title: 'Mã giao dịch'.tr,
                            info: controller.transactionId.value.toString(),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const DottedLine(
                            direction: Axis.horizontal,
                            lineLength: double.infinity,
                            lineThickness: 1.0,
                            dashGapLength: 5,
                            dashLength: 6.0,
                            dashColor: Color(0xFFF2F5F7),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          InfoWithTitle(
                            title: 'Ngày yêu cầu'.tr,
                            info: Convert.stringToDatePromotion(
                                controller.requestDate.value),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const DottedLine(
                            direction: Axis.horizontal,
                            lineLength: double.infinity,
                            lineThickness: 1.0,
                            dashGapLength: 5,
                            dashLength: 6.0,
                            dashColor: Color(0xFFF2F5F7),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          InfoWithTitle(
                            title: 'Giá trị'.tr,
                            isPrice: true,
                            info:
                                '${Convert.convertMoney(controller.values.value.toInt(), isMoney: true)} ${controller.currency.value}',
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset(
                        ImageAsset.orderSuccess,
                        height: 110,
                      )),
                ],
              ))),
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(color: Color(0xFF9A9CAD)),
          ),
          Text(info,
              style: !isPrice
                  ? const TextStyle(fontWeight: FontWeight.w600)
                  : const TextStyle(
                      color: Color(0xFFFF3B30), fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
