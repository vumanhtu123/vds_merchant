import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vds/app/mainapp/dashboard/component/category.list.dart';
import 'package:vds/app/mainapp/dashboard/merchant/merchant.dashboard.page.dart';
import 'package:vds/app/mainapp/dashboard/staff/component/dashboard.child.order.list.dart';

import 'staff.dashboard.controller.dart';

class StaffDashboardPage extends GetView<StaffDashboardController> {
  const StaffDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          body: RefreshIndicator(
            onRefresh: () async => controller.getOrdersDashBoard(),
            child: Obx(() => CustomScrollView(
                  controller: controller.scrollController,
                  slivers: [
                    SliverPersistentHeader(
                      delegate: Header(),
                      pinned: true,
                      floating: true,
                    ),
                    if (controller.orderStaff.isEmpty) ...[
                      SliverToBoxAdapter(
                        child: Column(
                          children: [
                            CategoryList(
                                categories: controller.categories
                                    .map((element) => element)
                                    .toList(),
                                didTapItem: (item) =>
                                    controller.didTapItem(item)),
                            const SizedBox(height: 30),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Row(
                                children: [
                                  Text(
                                    'Danh sách các đơn hàng'.tr,
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  // MyIconButton(
                                  //     function: () {},
                                  //     icon:
                                  //         'assets/images/caretdoubleright_icon.svg')
                                ],
                              ),
                            ),
                            Center(
                                heightFactor: 25,
                                child: (controller.errorNetwork == false)
                                    ? Text('Data not found')
                                    : Text('Network Error'))
                          ],
                        ),
                      ),
                    ] else ...[
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          childCount: controller.orderStaff.length + 1,
                          addAutomaticKeepAlives: true,
                          (context, index) {
                            if (index == 0) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                CategoryList(
                                        categories: controller.categories
                                            .map((element) => element)
                                            .toList(),
                                        didTapItem: (item) =>
                                            controller.didTapItem(item)),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15.0, top: 30),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Danh sách các đơn hàng'.tr,
                                          style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        // MyIconButton(
                                        //     function: () {},
                                        //     icon:
                                        //         'assets/images/caretdoubleright_icon.svg')
                                      ],
                                    ),
                                  )
                                ],
                              );
                            }
                            var order = controller.orderStaff[index - 1];
                            return ChildOrder(order: order, index: index);
                          },
                        ),
                      )
                    ]
                  ],
                )),
          ),
        ));
  }
}
