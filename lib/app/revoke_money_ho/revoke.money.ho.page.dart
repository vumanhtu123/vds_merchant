import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vds/asset/Image.asset.dart';
import 'package:vds/common/enums.dart';
import 'package:vds/helper/convert.dart';
import 'package:vds/widget/button.widget.dart';
import 'package:vds/widget/container_shadow.dart';
import 'package:vds/widget/text.form.widget.dart';

import '../../common/decimal_formatter.dart';
import 'revoke.money.ho.controller.dart';

class RevokeMoneyHOPage extends GetView<RevokeMoneyHOController> {
  const RevokeMoneyHOPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DismissKeyboard(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        title: Text('Yêu cầu rút tiền tại HO'.tr),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 30),
        child: SizedBox(
          height: 42,
          child: BigButton(
            text: 'Tiếp tục'.tr,
            function: controller.onNextClick,
          ),
        ),
      ),
      body: Obx(() {
        if (controller.appState.value == MerAppState.loading) {
          return const Center(
            heightFactor: 10,
            child: CircularProgressIndicator(),
          );
        } else if (controller.appState.value == MerAppState.failed) {
          return InkWell(
            onTap: () => controller.loadData(),
            child: Center(
              child: Text(controller.messageError ?? "",
                  textAlign: TextAlign.center),
            ),
          );
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ContainerShadow(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Số dư ví của tôi'.tr,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 12),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text.rich(
                          TextSpan(
                            text: controller.isBlind.isTrue
                                ? "********"
                                : Convert.convertMoney(
                                    controller.totalMoney.value),
                            style: controller.isBlind.isTrue
                                ? const TextStyle(color: Color(0xFF242424))
                                : const TextStyle(color: Color(0xFFFF3B30)),
                            children: const [
                              TextSpan(
                                text: ' USD',
                                style: TextStyle(color: Color(0xFF242424)),
                              )
                            ],
                          ),
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        InkWell(
                          onTap: () => controller.didTapEye(),
                          child: SvgPicture.asset(
                            controller.isBlind.isTrue
                                ? ImageAsset.iconEyeBlind
                                : ImageAsset.iconEye,
                            width: 18,
                            height: 18,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Text(
                'Amount you want to withdraw'.tr,
                style:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
              ),
              const SizedBox(height: 10),
              TextFormFieldCustom(
                fillColor: Colors.white,
                enable: !controller.isInvokeAll.value,
                borderRadiusOut: BorderRadius.circular(4),
                prefixIconWidget: const SizedBox(width: 13),
                contentPadding: const EdgeInsets.only(
                    left: 30, top: 10, bottom: 10, right: -15),
                borderFather: Border.all(
                    color: controller.isInvokeAll.value
                        ? const Color(0xFFDFE0EB).withOpacity(0.5)
                        : const Color(0xFFDFE0EB),
                    width: 0.6),
                controller: controller.revokeMoneyTextController,
                isCollapsed: true,
                suffixIconWidget: Padding(
                  padding: const EdgeInsets.only(right: 13.0),
                  child: Text(
                    ' ${controller.current.value}',
                    style: TextStyle(
                      fontSize: 12,
                      color: controller.isInvokeAll.value
                          ? const Color(0xFF747475).withOpacity(0.5)
                          : const Color(0xFF747475),
                    ),
                  ),
                ),
                onChanged: (value) => controller.onChangeText(value),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                inputFormatters: [
                  CommaTextInputFormatter(),
                  DecimalFormatter(),
                ],
                floatingLabelBehavior: FloatingLabelBehavior.never,
                label: Text.rich(TextSpan(
                    text: 'Nhập số tiền muốn rút'.tr,
                    style: const TextStyle(fontSize: 12),
                    children: const [
                      TextSpan(text: ' *', style: TextStyle(color: Colors.red))
                    ],
                ),
                ),
                errorMessage: controller.inputMoneyError.value,
              ),
              const SizedBox(height: 19),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () => controller.setInvokeAll(),
                child: Row(
                  children: [
                    Checkbox(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      side: const BorderSide(
                          color: Color(0xFFDFE0EB), width: 0.6),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2),
                          side: const BorderSide(
                              color: Color(0xFFDFE0EB), width: 0.6)),
                      visualDensity: const VisualDensity(
                          horizontal: VisualDensity.minimumDensity,
                          vertical: VisualDensity.minimumDensity),
                      value: controller.isInvokeAll.value,
                      onChanged: (isCheck) => controller.setInvokeAll(),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Text.rich(
                        TextSpan(
                          text: 'Rút toàn bộ số dư trong ví'.tr,
                          children: [
                            TextSpan(
                                text:
                                    ' (${Convert.convertMoney(controller.totalMoney.value)} ${controller.current.value})')
                          ],
                        ),
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      }),
    ));
  }
}