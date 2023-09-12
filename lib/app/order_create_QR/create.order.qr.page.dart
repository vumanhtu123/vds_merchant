import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vds/app/component/bottom.bar.not.in.main.dart';
import 'package:vds/app/component/info.order.create.dart';
import 'package:vds/common/enums.dart';
import '../../asset/Image.asset.dart';
import '../component/info.invoice.create.dart';
import 'create.order.qr.controller.dart';

class CreateOrderQRPage extends GetView<CreateOrderQRController> {
  const CreateOrderQRPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          elevation: 1,
          title: Obx(() {
            return Text((controller.check != true)
                ? '${'Chi tiết đơn hàng'.tr} ${controller.details.value.orderCode}'
                : '${'Chi tiết giao dịch'.tr} ${controller.detailsTran.value.transactionId}');
          }),
        ),
        // bottomNavigationBar: const BottomBarNotInMain(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Obx(() {
              return Column(children: [
                if (controller.appState.value == MerAppState.loading) ...[
                  const SizedBox(
                    height: 300,
                    child: Center(child: CircularProgressIndicator()),
                  )
                ] else ...[
                  if (controller.details.value.showQR == true) ...[
                    if (controller.check != true) ...[
                      if (controller.details.value.orderUUID != null) ...[
                        if ((controller.details.value.expireTime ?? 0) > 0) ...[
                          const SizedBox(height: 16),
                          //sửa qr đúng như be trả về
                          Image.memory(
                            base64Decode((controller.details.value.qrCode ?? "")
                                .replaceAll("data:image/png;base64,", "")),
                            errorBuilder: (c, v, b) => const SizedBox.shrink(),
                            width: 240,
                            height: 240,
                            fit: BoxFit.fill,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Thời gian còn lại'.tr,
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF747475)),
                          ),
                          const SizedBox(height: 5),
                          Container(
                            width: 85,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: const Color(0xFFA1AEDB)),
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  ImageAsset.iconClock,
                                  width: 18,
                                  height: 18,
                                ),
                                const SizedBox(width: 5),
                                Obx(() {
                                  return Text(
                                    controller.timerCountDown.value,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  );
                                })
                              ],
                            ),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            'Quét QR Code để thanh toán'.tr,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 25),
                          InfoOrderCreate(
                            checker: controller.check,
                            order: controller.details.value,
                            data: controller.invoice.value,
                          )
                        ] else ...[
                          const SizedBox(height: 30),
                          Stack(
                            children: [
                              Opacity(
                                opacity: 0.2,
                                child: Image.memory(
                                  base64Decode(
                                      (controller.details.value.qrCode ?? "")
                                          .replaceAll(
                                              "data:image/png;base64,", "")),
                                  errorBuilder: (c, v, b) =>
                                      const SizedBox.shrink(),
                                  width: 240,
                                  height: 240,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Positioned(
                                width: 240,
                                height: 240,
                                child: Center(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 10),
                                    decoration: BoxDecoration(
                                        color: const Color(0xFFFF3B30),
                                        borderRadius: BorderRadius.circular(4)),
                                    child: Text(
                                      'Mã đã hết hạn'.tr,
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 30),
                          InfoOrderCreate(
                            checker: controller.check,
                            order: controller.details.value,
                            data: controller.invoice.value,
                          )
                        ]
                      ] else ...[
                        const Center(
                            heightFactor: 10,
                            child: CircularProgressIndicator())
                      ]
                    ] else ...[
                      if (controller.details.value.orderUUID != null) ...[
                        if (controller.details.value.status == "SUCCEED") ...[
                          InfoOrderCreate(
                            checker: controller.check,
                            order: controller.details.value,
                            data: controller.invoice.value,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          InfoInvoiceCreate(
                            data: controller.detailsTran.value,
                          )
                        ] else ...[
                          InfoOrderCreate(
                            checker: controller.check,
                            order: controller.details.value,
                            data: controller.invoice.value,
                          ),
                        ]
                      ] else ...[
                        const Center(
                            heightFactor: 10,
                            child: CircularProgressIndicator())
                      ]
                    ]
                  ] else ...[
                    InfoOrderCreate(
                      checker: controller.check,
                      order: controller.details.value,
                      data: controller.invoice.value,
                    ),
                  ],
                ]
              ]);
            }),
          ),
        ));
  }
}
