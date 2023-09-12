import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vds/app/account/info/component/title.with.info.dart';
import 'package:vds/app/account/info/infostaff/staff.info.controller.dart';
import '../../../../common/enums.dart';

class InfoStaffPage extends GetView<InfoStaffController> {
  const InfoStaffPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 1,
        title: Text('Thông tin nhân viên'.tr),
      ),
      // bottomNavigationBar: const BottomBarNotInMain(),
      body: Obx(() {
        if (controller.appState.value == MerAppState.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (controller.appState.value == MerAppState.failed) {
          return Center(
            child: Text(controller.messageError ?? ""),
          );
        }
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
            child: Column(
              children: [
                const StaffInfo(),
                if (controller.staffInfo.value!.subMerchant != null) ...[
                  const InfoSubMerchant(),
                  const InfoMerchantStaff()
                ] else ...[
                  const InfoMerchantStaff()
                ]
              ],
            ),
          ),
        );
      }),
    );
  }
}

class StaffInfo extends GetView<InfoStaffController> {
  const StaffInfo({super.key});

  @override
  Widget build(BuildContext context) {
    var staffInfo = controller.staffInfo;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Thông tin nhân viên'.tr,
            style: const TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(
          height: 15,
        ),
        TitleWithInfo(
            title: 'Tên nhân viên'.tr, info: staffInfo.value?.fullName ?? ''),
        TitleWithInfo(
            title: 'Mã nhân viên'.tr, info: staffInfo.value?.staffCode ?? ''),
        TitleWithInfo(
            title: 'Số điện thoại'.tr,
            info: staffInfo.value?.phoneNumber ?? ''),
        TitleWithInfo(title: 'Email'.tr, info: staffInfo.value?.email ?? ''),
      ],
    );
  }
}

class InfoMerchantStaff extends GetView<InfoStaffController> {
  const InfoMerchantStaff({super.key});

  @override
  Widget build(BuildContext context) {
    var infoMerchant = controller.staffInfo.value;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Thông tin merchant'.tr,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 15,
        ),
        TitleWithInfo(
          title: 'Tên Merchant'.tr,
          info: infoMerchant?.merchant?.merchantName ?? '',
        ),
        TitleWithInfo(
          title: 'Mã Merchant'.tr,
          info: infoMerchant?.merchant?.merchantCode ?? '',
        ),
        TitleWithInfo(
          title: 'Số điện thoại'.tr,
          info: infoMerchant?.merchant?.phoneNumber ?? '',
        ),
        TitleWithInfo(
          title: 'Địa chỉ'.tr,
          info: infoMerchant?.merchant?.address ?? '',
        ),
      ],
    );
  }
}

class InfoSubMerchant extends GetView<InfoStaffController> {
  const InfoSubMerchant({super.key});

  @override
  Widget build(BuildContext context) {
    var infoMerchant = controller.staffInfo.value?.subMerchant;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Thông tin sub merchant'.tr,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 15,
        ),
        TitleWithInfo(
          title: 'Tên sub Merchant'.tr,
          info: infoMerchant?.subMerchantName ?? '',
        ),
        TitleWithInfo(
          title: 'Mã sub Merchant'.tr,
          info: infoMerchant?.subMerchantCode ?? '',
        ),
        TitleWithInfo(
          title: 'Số điện thoại sub'.tr,
          info: infoMerchant?.subMerchantPhone ?? '',
        ),
        TitleWithInfo(
          title: 'Địa chỉ sub'.tr,
          info: infoMerchant?.address ?? '',
        ),
      ],
    );
  }
}
