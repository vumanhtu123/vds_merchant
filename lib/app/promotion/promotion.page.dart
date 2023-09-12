import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vds/app/mainapp/component/app.bar.home.dart';
import 'package:vds/app/promotion/promotion.controller.dart';
import 'package:vds/common/enums.dart';
import 'package:vds/common/storage_data.dart';
import 'package:vds/model/promotion.model.dart';

class PromotionPage extends GetView<PromotionController> {
  const PromotionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppbarHome(
            title: 'Chương trình khuyến mãi'.tr,
            show: true,
          ),
          Expanded(
            child: Obx(() {
              if (controller.appState.value == MerAppState.loading) {
                return const Center(child: CircularProgressIndicator());
              } else if (controller.errorNetwork.value == true) {
                return const Center(child: Text('Network Error'));
              }
              return ListView.separated(
                padding: EdgeInsets.zero,
                addAutomaticKeepAlives: true,
                controller: controller.scrollController,
                itemBuilder: (context, index) {
                  var promotion = controller.promotion[index];
                  return ItemPromotion(promotion, index);
                },
                itemCount: controller.promotion.length,
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox.shrink();
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}

class ItemPromotion extends GetView<PromotionController> {
  const ItemPromotion(this.content, this.index, {super.key});

  final Content content;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 30),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
                blurRadius: 12,
                offset: const Offset(0, 0),
                color: const Color(0xFF747475).withOpacity(0.12)),
          ]),
      child: InkWell(
        onTap: () => controller.gotoDetails(content.campaignId!),
        child: Column(
          children: [
            // Image.network(
            //   content.bannerImage.toString(),
            //   fit: BoxFit.fitWidth,
            //   errorBuilder: (c, o, s) => const SizedBox.shrink(),
            // ),
            CachedNetworkImage(
              imageUrl: content.thumbnailImg ?? "",
              httpHeaders: {
                "authorization": "Bearer ${StorageData.instance.getAppToken()}"
              },
              errorWidget: (c, o, s) => const SizedBox.shrink(),
              fit: BoxFit.fitWidth,
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.card_giftcard,
                    color: Colors.red,
                    size: 14,
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Text(
                      content.name.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                          color: Color(0xFF242424)),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: 17),
                SvgPicture.asset(
                  'assets/images/Clock.svg',
                  width: 13,
                  height: 13,
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: RichText(
                      text: TextSpan(
                          text:
                              'Start date: ${controller.convertStartDate(content.startDate!)}',
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF747475)),
                          children: [
                        TextSpan(
                          text:
                              ' End date: ${controller.convertEndDate(content.endDate!)}',
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF747475)),
                        )
                      ])),
                )
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
