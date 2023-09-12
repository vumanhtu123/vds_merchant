import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vds/asset/Image.asset.dart';
import 'package:vds/common/enums.dart';
import 'package:vds/widget/container_shadow.dart';
import 'dart:convert';
import 'qr.account.controller.dart';

class QrAccountPage extends GetView<QrAccountController> {
  const QrAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F5F7),
      appBar: AppBar(
        centerTitle: true,
        elevation: 1,
        title: Text('QR của tôi'.tr),
      ),
      // bottomNavigationBar: const BottomBarNotInMain(),
      body: Obx(
        () {
          if (controller.appState.value == MerAppState.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (controller.appState.value == MerAppState.failed) {
            return Center(
              child: Text(controller.messageError ?? ""),
            );
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ContainerShadow(
              padding: EdgeInsets.zero,
              child:(controller.merInfo.value != null) ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 20),
                  Image.memory(
                    base64Decode((controller.merInfo.value?.qrCode ?? "")
                        .replaceAll("data:image/png;base64,", "")),
                    errorBuilder: (c, v, b) => const SizedBox.shrink(),
                    width: 160,
                    height: 160,
                    fit: BoxFit.fill,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    controller.merInfo.value?.merchantName ?? '',
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '${'Mã Merchant'.tr}: ${controller.merInfo.value?.merchantCode}',
                  ),
                  const SizedBox(height: 20),
                  const Divider(
                    height: 1,
                    thickness: 1,
                    color: Color(0xFFF6F7FB),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () => controller.downloadImageFromBase64(
                              controller.merInfo.value!.qrCode.toString()),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(ImageAsset.iconDownload),
                              const SizedBox(
                                height: 6,
                              ),
                              Text('Download'.tr)
                            ],
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: VerticalDivider(
                          width: 1,
                          thickness: 1,
                          color: Color(0xFFF6F7FB),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () => controller.shareBarcode(
                              controller.merInfo.value!.qrCode.toString()),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(ImageAsset.iconShare),
                              const SizedBox(
                                height: 6,
                              ),
                              Text('Share'.tr)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                ],
              ) :  Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 20),
                  Image.memory(
                    base64Decode((controller.staffInfo.value?.qrCode ?? "")
                        .replaceAll("data:image/png;base64,", "")),
                    errorBuilder: (c, v, b) => const SizedBox.shrink(),
                    width: 160,
                    height: 160,
                    fit: BoxFit.fill,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    controller.staffInfo.value?.fullName ?? '',
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '${'Mã Merchant'.tr}: ${controller.staffInfo.value?.staffCode}',
                  ),
                  const SizedBox(height: 20),
                  const Divider(
                    height: 1,
                    thickness: 1,
                    color: Color(0xFFF6F7FB),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () => controller.downloadImageFromBase64(
                              controller.staffInfo.value!.qrCode.toString()),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(ImageAsset.iconDownload),
                              const SizedBox(
                                height: 6,
                              ),
                              Text('Download'.tr)
                            ],
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: VerticalDivider(
                          width: 1,
                          thickness: 1,
                          color: Color(0xFFF6F7FB),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () => controller.shareBarcode(
                              controller.staffInfo.value!.qrCode.toString()),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(ImageAsset.iconShare),
                              const SizedBox(
                                height: 6,
                              ),
                              Text('Share'.tr)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                ],
              )
            ),
          );
        },
      ),
    );
  }
}
