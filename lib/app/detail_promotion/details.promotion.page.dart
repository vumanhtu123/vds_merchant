import 'package:cached_network_image/cached_network_image.dart';
import 'package:cached_network_image_platform_interface/cached_network_image_platform_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:vds/app/detail_promotion/details.promotion.controller.dart';
import 'package:vds/common/storage_data.dart';
import 'package:vds/helper/convert.dart';
import 'package:vds/model/details.promotion.model.dart';

class DetailsPromotionPage extends GetView<DetailsPromotionController> {
  const DetailsPromotionPage({super.key});

  @override
  Widget build(BuildContext context) {
    print("bearer ${StorageData.instance.getAppToken()}");
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        title: Text('Chi tiết chương trình khuyến mãi'.tr),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Obx(() {
          if (controller.detailsPromotion.value.forms == null) {
            return const Center(child: CircularProgressIndicator());
          }
          return Column(
            children: [
              Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(
                      controller.detailsPromotion.value.bannerImage ?? "",
                      headers: {
                        "authorization":
                            "bearer ${StorageData.instance.getAppToken()}",
                        "Access-Control-Allow-Headers":
                            "Access-Control-Allow-Origin, Accept",
                      },
                      imageRenderMethodForWeb: ImageRenderMethodForWeb.HttpGet,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const SizedBox(width: 15),
                  const Icon(
                    Icons.card_giftcard,
                    color: Colors.red,
                    size: 17,
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Text(
                      '${controller.detailsPromotion.value.title}',
                      style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Color(0xFF242424)),
                    ),
                  ),
                  const SizedBox(width: 15),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const SizedBox(width: 15),
                  SvgPicture.asset('assets/images/Clock.svg'),
                  const SizedBox(width: 5),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        text: 'Start date ${controller.convertStartDate()}'.tr,
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF747475)),
                        children: [
                          TextSpan(
                              text: ' End ${controller.convertEndDate()}'.tr)
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: HtmlWidget(
                  '${controller.detailsPromotion.value.content}',
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Color(0xFF242424)),
                ),
              ),
              const SizedBox(height: 20),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                addAutomaticKeepAlives: true,
                controller: controller.scrollController,
                itemBuilder: (context, index) {
                  var form = controller.getForms()[index];
                  return (controller.getForms().isEmpty)
                      ? const SizedBox.shrink()
                      : ItemDetails(data: form);
                },
                itemCount: controller.getForms().length,
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox.shrink();
                },
              ),
            ],
          );
        }),
      ),
    );
  }
}

class ItemDetails extends GetView<DetailsPromotionController> {
  final Forms data;

  const ItemDetails({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          color: const Color(0xFFF2F5F7),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Text(
            'Hình thức và điều kiện khuyến mãi'.tr,
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF000000)),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Khuyến mãi theo: '.tr,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Color(0xFF747475)),
                ),
                const SizedBox(height: 8),
                Text(
                  'Hình thức: '.tr,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Color(0xFF747475)),
                ),
              ],
            ),
            const SizedBox(width: 4),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  (data.promotionType.toString() == "TRANSACTION_AND_SERVICE")
                      ? "TRANSACTION AND SERVICE"
                      : data.promotionType.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Color(0xFF242424)),
                ),
                const SizedBox(height: 8),
                Text(
                  (data.promotionBy.toString() == "CASH_BACK")
                      ? "CASH BACK"
                      : data.promotionBy.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Color(0xFF242424)),
                )
              ],
            ),
            const SizedBox(width: 4),
          ],
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          addAutomaticKeepAlives: true,
          controller: controller.scrollController,
          itemBuilder: (context, index) {
            var condition = data.conditions?[index];
            return (data.conditions?.isEmpty == true)
                ? const SizedBox.shrink()
                : ConditionPromotion(
                    index + 1,
                    conditions: condition,
                  );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox.shrink();
          },
          itemCount: data.conditions?.length ?? 0,
        )
      ],
    );
  }
}

class ConditionPromotion extends GetView<DetailsPromotionController> {
  const ConditionPromotion(this.index, {super.key, required this.conditions});

  final int index;
  final Conditions? conditions;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          const SizedBox(height: 15),
          Container(
            width: double.infinity,
            color: const Color(0xFFF2F5F7),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            child: Text(
              'Condition $index'.tr,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF242424)),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tổng hóa đơn từ: '.tr,
                    style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Color(0xFF747475)),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Đến: '.tr,
                    style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Color(0xFF747475)),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Sẽ được hoàn: '.tr,
                    style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Color(0xFF747475)),
                  ),
                ],
              ),
              const SizedBox(width: 4),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${Convert.convertMoney(conditions?.totalBillFrom)}'
                    ' ${(conditions?.currencyAlias == "usd") ? "USD" : conditions?.currencyAlias}',
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Color(0xFF242424)),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${Convert.convertMoney(conditions?.totalBillTo)}'
                    ' ${(conditions?.currencyAlias == "usd") ? "USD" : conditions?.currencyAlias}',
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Color(0xFF242424)),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${conditions?.amountDiscount}'
                    ' ${'%'}',
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Color(0xFF242424)),
                  )
                ],
              )
            ],
          ),
          // Container(
          //   margin: const EdgeInsets.only(left: 25, right: 25),
          //   child: const Text(
          //     'Điều kiện 2',
          //     style: TextStyle(
          //         fontSize: 14,
          //         fontWeight: FontWeight.w600,
          //         color: Color(0xFF242424)),
          //   ),
          // ),
          // Row(
          //   children: const [
          //     Text(
          //       'Tổng hóa đơn từ: ',
          //       style: TextStyle(
          //           fontWeight: FontWeight.w400,
          //           fontSize: 14,
          //           color: Color(0xFF747475)),
          //     ),
          //     Text(
          //       '',
          //       style: TextStyle(
          //           fontWeight: FontWeight.w500,
          //           fontSize: 14,
          //           color: Color(0xFF242424)),
          //     )
          //   ],
          // ),
          // Row(
          //   children: const [
          //     Text(
          //       'Đến: ',
          //       style: TextStyle(
          //           fontWeight: FontWeight.w400,
          //           fontSize: 14,
          //           color: Color(0xFF747475)),
          //     ),
          //     Text(
          //       '',
          //       style: TextStyle(
          //           fontWeight: FontWeight.w500,
          //           fontSize: 14,
          //           color: Color(0xFF242424)),
          //     )
          //   ],
          // ),
          // Row(
          //   children: const [
          //     Text(
          //       'Sẽ được hoàn: ',
          //       style: TextStyle(
          //           fontWeight: FontWeight.w400,
          //           fontSize: 14,
          //           color: Color(0xFF747475)),
          //     ),
          //     Text(
          //       '',
          //       style: TextStyle(
          //           fontWeight: FontWeight.w500,
          //           fontSize: 14,
          //           color: Color(0xFF242424)),
          //     )
          //   ],
          // ),
          // Row(
          //   children: const [
          //     Text(
          //       'Số tiền được hoàn \ntối đa: ',
          //       style: TextStyle(
          //           fontWeight: FontWeight.w400,
          //           fontSize: 14,
          //           color: Color(0xFF747475)),
          //     ),
          //     Text(
          //       '',
          //       style: TextStyle(
          //           fontWeight: FontWeight.w500,
          //           fontSize: 14,
          //           color: Color(0xFF242424)),
          //     )
          //   ],
          // ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }
}
