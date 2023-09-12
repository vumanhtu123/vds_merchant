import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vds/app/promotion/promotion.controller.dart';

class DetailsPromotion extends GetView<PromotionController> {
  const DetailsPromotion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        title: Text('Chi tiết chương trình khuyến mãi'.tr),
      ),
      body: Obx(() => Column(
            children: [
              SvgPicture.asset(''),
              const SizedBox(height: 20),
              const Text(
                '',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Color(0xFF242424)),
              ),
              Row(
                children: [
                  SvgPicture.asset('assets/image/Clock.svg'),
                  const Text(
                    '',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF747475)),
                  )
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                '',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Color(0xFF242424)),
              )
            ],
          )),
    );
  }
}

class ItemDetails extends StatelessWidget {
  const ItemDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: const Color(0xFFF2F5F7),
          child: const Text(
            '',
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF000000)),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          children: const [
            Text(
              'Khuyến mãi theo: ',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Color(0xFF747475)),
            ),
            Text(
              '',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Color(0xFF242424)),
            )
          ],
        ),
        Row(
          children: const [
            Text(
              'Hình thức: ',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Color(0xFF747475)),
            ),
            Text(
              '',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Color(0xFF242424)),
            )
          ],
        ),
        Container(
          margin: const EdgeInsets.only(left: 25, right: 25),
          child: const Text(
            'Điều kiện 1',
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF242424)),
          ),
        ),
        Row(
          children: const [
            Text(
              'Khuyến mãi theo: ',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Color(0xFF747475)),
            ),
            Text(
              '',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Color(0xFF242424)),
            )
          ],
        ),
        Row(
          children: const [
            Text(
              'Hình thức: ',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Color(0xFF747475)),
            ),
            Text(
              '',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Color(0xFF242424)),
            )
          ],
        ),
        Row(
          children: const [
            Text(
              'Sẽ được hoàn: ',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Color(0xFF747475)),
            ),
            Text(
              '',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Color(0xFF242424)),
            )
          ],
        ),
        Container(
          margin: const EdgeInsets.only(left: 25, right: 25),
          child: const Text(
            'Điều kiện 2',
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF242424)),
          ),
        ),
        Row(
          children: const [
            Text(
              'Tổng hóa đơn từ: ',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Color(0xFF747475)),
            ),
            Text(
              '',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Color(0xFF242424)),
            )
          ],
        ),
        Row(
          children: const [
            Text(
              'Đến: ',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Color(0xFF747475)),
            ),
            Text(
              '',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Color(0xFF242424)),
            )
          ],
        ),
        Row(
          children: const [
            Text(
              'Sẽ được hoàn: ',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Color(0xFF747475)),
            ),
            Text(
              '',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Color(0xFF242424)),
            )
          ],
        ),
        Row(
          children: const [
            Text(
              'Số tiền được hoàn \ntối đa: ',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Color(0xFF747475)),
            ),
            Text(
              '',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Color(0xFF242424)),
            )
          ],
        ),
        Container(
          margin: const EdgeInsets.only(left: 25, right: 25),
          child: const Text(
            'Điều kiện 2',
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF242424)),
          ),
        ),
        Row(
          children: const [
            Text(
              'Tổng hóa đơn từ: ',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Color(0xFF747475)),
            ),
            Text(
              '',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Color(0xFF242424)),
            )
          ],
        ),
        Row(
          children: const [
            Text(
              'Giảm giá: ',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Color(0xFF747475)),
            ),
            Text(
              '',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Color(0xFF242424)),
            )
          ],
        ),
        Row(
          children: const [
            Text(
              'Số tiền giảm tối đa: ',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Color(0xFF747475)),
            ),
            Text(
              '',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Color(0xFF242424)),
            )
          ],
        ),
      ],
    );
  }
}
