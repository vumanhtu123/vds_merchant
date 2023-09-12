import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vds/app/mainapp/component/app.bar.home.dart';
import 'component/order.list.merchant.dart';
import 'merchant.order.controller.dart';

class MerchantOrderPage extends GetView<MerchantOrderController> {
  const MerchantOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Column(
          children: [
            AppbarHome(
              title: 'Danh sách đơn hàng'.tr,
              show: false,
            ),
            const Expanded(child: OrderListMerchant())
          ],
        ),
      ),
    );
  }
}
