import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vds/app/mainapp/component/app.bar.home.dart';
import 'package:vds/app/mainapp/dashboard/component/category.list.dart';
import 'package:vds/asset/Image.asset.dart';
import 'package:vds/widget/button.widget.dart';

import 'component/child.order.list.dart';
import 'merchant.dashboard.controller.dart';

class MerchantDashboardPage extends GetView<MerchantDashboardController> {
  const MerchantDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: RefreshIndicator(
          onRefresh: () async => controller.initData(),
          child: CustomScrollView(
            controller: controller.scrollController,
            slivers: [
              SliverPersistentHeader(
                delegate: Header(),
                pinned: true,
                floating: true,
              ),
              Obx(() {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: controller.orders.length + 1,
                    addAutomaticKeepAlives: true,
                    (context, index) {
                      if (index == 0) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Obx(() {
                              return Container(
                                margin: const EdgeInsets.all(15),
                                width: double.infinity,
                                height: 76,
                                decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color(0xFFFC4A1A),
                                        Color(0xFFF7B733),
                                      ],
                                      stops: [0.0, 1.0],
                                      begin: FractionalOffset.centerLeft,
                                      end: FractionalOffset.centerRight,
                                      tileMode: TileMode.repeated,
                                    ),
                                    borderRadius: BorderRadius.circular(4)),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Số dư ví của tôi'.tr,
                                      style: const TextStyle(
                                          fontSize: 12, color: Colors.white),
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text.rich(
                                          TextSpan(
                                            text: controller.isBlind.isTrue
                                                ? "********"
                                                : controller.getPriceText(),
                                            style: controller.isBlind.isTrue
                                                ? const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16)
                                                : const TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 6,
                                        ),
                                        InkWell(
                                          onTap: () =>
                                              controller.didTapEyeDashBoard(),
                                          child: SvgPicture.asset(
                                            controller.isBlind.isTrue
                                                ? ImageAsset.iconEyeBlind
                                                : ImageAsset.iconEye,
                                            width: 18,
                                            height: 18,
                                            color: Colors.white,
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              );
                            }),
                            CategoryList(
                              categories: controller.categories
                                  .map((element) => element)
                                  .toList(),
                              didTapItem: (item) => controller.didTapItem(item),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Danh sách các đơn hàng'.tr,
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  MyIconButton(
                                    function: () => controller.goToOrder(),
                                    icon: ImageAsset.caretDoubleRight,
                                  )
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () async =>
                                  await controller.getOrdersDashBoard(),
                              child: Center(
                                child: (controller.errorNetwork.value == true)
                                    ? const Text('Network Error')
                                    : const SizedBox(),
                              ),
                            )
                          ],
                        );
                      }
                      var order = controller.orders[index - 1];
                      return ChildOrder(order: order, index: index);
                    },
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class Header extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return AppbarHome(title: 'Dashboard'.tr);
  }

  @override
  double get maxExtent => 89;

  @override
  double get minExtent => 89;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
