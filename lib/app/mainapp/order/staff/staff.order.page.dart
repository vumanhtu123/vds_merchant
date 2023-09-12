import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vds/app/mainapp/component/app.bar.home.dart';
import 'component/order.list.staff.dart';
import 'staff.order.controller.dart';

class StaffOrderPage extends GetView<StaffOrderController> {
  const StaffOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
            body: Column(
          children: [
            AppbarHome(
              title: 'Danh sách đơn hàng'.tr, show: false,
            ),
            const Expanded(child: OrderListStaff())
          ],
        )));
  }
}
