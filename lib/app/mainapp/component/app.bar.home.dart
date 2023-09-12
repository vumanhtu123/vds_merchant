import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vds/asset/Image.asset.dart';

class AppbarHome extends StatelessWidget {
  final String title;
  final bool? show;

  const AppbarHome({super.key, required this.title, this.show});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 89,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFF6B71E),
        image: DecorationImage(
          fit: BoxFit.fitWidth,
          alignment: Alignment.bottomCenter,
          image: AssetImage(ImageAsset.backgroundAppbarMainApp),
        ),
      ),
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          SizedBox(
            height: Get.mediaQuery.padding.top,
            width: double.infinity,
            child: ColoredBox(
              color: const Color(0xFFFF2E00).withOpacity(0.18),
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if ((show ?? false) == true) ...[
                  Visibility(
                    visible: true,
                    child: InkWell(
                      onTap: () => Get.back(),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: SvgPicture.asset(
                          'assets/images/arrow_left.svg',
                          width: 25,
                          height: 25,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    title.tr,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  const SizedBox(width: 55)
                ] else ...[
                  Expanded(
                    child: Center(
                      child: Text(title.tr,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ]
              ],
            ),
          )
        ],
      ),
    );
  }
}
