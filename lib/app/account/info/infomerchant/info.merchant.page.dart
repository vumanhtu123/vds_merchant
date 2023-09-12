import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vds/app/account/info/component/title.with.info.dart';
import 'package:vds/common/enums.dart';
import 'package:vds/helper/convert.dart';
import 'info.merchant.controller.dart';

class InfoMerchantPage extends GetView<InfoMerchantController> {
  const InfoMerchantPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 1,
        title: Text('Thông tin Merchant'.tr),
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
              children: const [MerchantInfo(), BankInfo()],
            ),
          ),
        );
      }),
    );
  }
}

class MerchantInfo extends GetView<InfoMerchantController> {
  const MerchantInfo({super.key});

  @override
  Widget build(BuildContext context) {
    var merchantInfo = controller.merInfo;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Thông tin Merchant'.tr,
            style: const TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(
          height: 15,
        ),
        TitleWithInfo(
            title: 'Kiểu Merchant'.tr,
            info: merchantInfo.value?.merchantType ?? ''),
        TitleWithInfo(
            title: 'Lĩnh vực kinh doanh'.tr,
            info: merchantInfo.value?.businessSector?.businessSectorName ?? ''),
        TitleWithInfo(
            title: 'Giấy phép kinh doanh'.tr,
            info: merchantInfo.value?.businessLicense ?? ''),
        TitleWithInfo(
            title: 'Mã Merchant'.tr,
            info: merchantInfo.value?.merchantCode ?? ''),
        TitleWithInfo(
            title: 'Tên Merchant'.tr,
            info: merchantInfo.value?.merchantName ?? ''),
        TitleWithInfo(
            title: 'Merchant Phone'.tr,
            info: merchantInfo.value?.merchantPhone ?? ''),
        TitleWithInfo(
          title: 'Paper type'.tr,
          info: merchantInfo.value?.paperType ?? '',
        ),
        TitleWithInfo(
          title: 'Paper number'.tr,
          info: merchantInfo.value?.paperNumber ?? '',
        ),
        TitleWithInfo(
            title: 'Issued Date'.tr,
            info: Convert.stringToDatePromotion(
                merchantInfo.value?.issuedDate ?? '')),
        TitleWithInfo(
            title: 'Expired Date'.tr,
            info: Convert.stringToDatePromotion(
                merchantInfo.value?.expiredDate ?? '')),
        TitleWithInfo(
          title: 'Issued Place'.tr,
          info: merchantInfo.value?.issuedPlace ?? '',
        ),
        TitleWithInfo(
          title: 'Province'.tr,
          info: merchantInfo.value?.province?.areaName ?? '',
        ),
        TitleWithInfo(
          title: 'District'.tr,
          info: merchantInfo.value?.district?.areaName ?? '',
        ),
        TitleWithInfo(
          title: 'Precinct'.tr,
          info: merchantInfo.value?.precinct?.areaName ?? '',
        ),
        TitleWithInfo(
          title: 'Address'.tr,
          info: merchantInfo.value?.address ?? '',
        ),
        TitleWithInfo(
          title: 'Gender'.tr,
          info: merchantInfo.value?.gender ?? '',
        ),
        TitleWithInfo(
          title: 'Email'.tr,
          info: merchantInfo.value?.email ?? '',
        ),
      ],
    );
  }
}

class BankInfo extends GetView<InfoMerchantController> {
  const BankInfo({super.key});

  @override
  Widget build(BuildContext context) {
    var bankInfo = controller.merInfo.value;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Thông tin ngân hàng'.tr,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 15,
        ),
        TitleWithInfo(
          title: 'Bank Account Name'.tr,
          info: bankInfo?.bankAccountName ?? '',
        ),
        TitleWithInfo(
          title: 'Bank Account No'.tr,
          info: bankInfo?.bankAccountNo ?? '',
        ),
        TitleWithInfo(
          title: 'Bank Name'.tr,
          info: bankInfo?.bank?.bankName ?? '',
        ),
        TitleWithInfo(
          title: 'Bank Branch'.tr,
          info: bankInfo?.bankBranch ?? '',
        ),
      ],
    );
  }
}
