import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vds/app/revoke_money_ho/accept/revoke.money.ho.accept.controller.dart';
import 'package:vds/asset/Image.asset.dart';

class OtpDialog extends GetView<RevokeMoneyHOAcceptController> {
  const OtpDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 508,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      child: Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          Text.rich(
              TextSpan(
                  text: 'Verification code has been sent to'.tr,
                  children: [
                    const TextSpan(text: ' '),
                    TextSpan(text: controller.phoneNumberBank.value)
                  ]),
              style: const TextStyle(
                  fontWeight: FontWeight.w600, color: Color(0xFF263D60))),
          const SizedBox(
            height: 16,
          ),
          Obx(() => controller.isCanResent.value
              ? GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: controller.resendOtp,
                  child: Text(
                    'Gửi lại'.tr,
                    style: const TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline),
                  ),
                )
              : Text.rich(
                  TextSpan(text: 'Gửi lại'.tr, children: [
                    const TextSpan(text: ' ('),
                    TextSpan(text: 'Sau'.tr),
                    TextSpan(text: ' '.tr),
                    WidgetSpan(
                        child: Obx(() => Text(
                            controller.countDownTime.value
                                .toString()
                                .padLeft(2, '0'),
                            strutStyle: const StrutStyle(leading: 0),
                            style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                height: 1.3,
                                color: Color(0xFFA9A9A9))))),
                    TextSpan(text: 's'.tr),
                    TextSpan(text: ')'.tr),
                  ]),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, color: Color(0xFFA9A9A9)))),
          const SizedBox(
            height: 20,
          ),
          const Divider(
            height: 1,
            thickness: 1,
            indent: 17,
            endIndent: 17,
            color: Color(0xFFDCDCDC),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Nhập mã OTP'.tr,
                  style:
                      const TextStyle(color: Color(0xFF263D60), fontSize: 16),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  width: 200,
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: const Color(0xFFC4C4C4)),
                      borderRadius: BorderRadius.circular(10)),
                  child: Obx(() => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: controller.listCodeOtp
                            .map((code) => Text('●',
                                style: TextStyle(
                                    color: code.isEmpty
                                        ? const Color(0xFF9A9CAD)
                                        : Colors.black)))
                            .toList(),
                      )),
                )
              ],
            ),
          ),
          KeyboardNumberCustom(
            onClickNumber: controller.onClickNumberOtp,
            onDeleteButtonClick: controller.deleteButtonOtpClick,
            onNextButtonClick: (context) => controller.nextButtonOtpClick(),
          )
        ],
      ),
    );
  }
}

class KeyboardNumberCustom extends StatelessWidget {
  final Function(String) onClickNumber;
  final Function(BuildContext) onNextButtonClick;
  final Function() onDeleteButtonClick;

  const KeyboardNumberCustom({
    Key? key,
    required this.onClickNumber,
    required this.onNextButtonClick,
    required this.onDeleteButtonClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(6),
        color: const Color(0xFFD4D7DC),
        height: 291,
        child: Column(
          children: [
            Row(
              children: [
                ButtonNumber(
                  number: '1',
                  onClickNumber: onClickNumber,
                ),
                const SizedBox(
                  width: 8,
                ),
                ButtonNumber(
                  number: '2',
                  onClickNumber: onClickNumber,
                ),
                const SizedBox(
                  width: 8,
                ),
                ButtonNumber(
                  number: '3',
                  onClickNumber: onClickNumber,
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                ButtonNumber(
                  number: '4',
                  onClickNumber: onClickNumber,
                ),
                const SizedBox(
                  width: 8,
                ),
                ButtonNumber(
                  number: '5',
                  onClickNumber: onClickNumber,
                ),
                const SizedBox(
                  width: 8,
                ),
                ButtonNumber(
                  number: '6',
                  onClickNumber: onClickNumber,
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                ButtonNumber(
                  number: '7',
                  onClickNumber: onClickNumber,
                ),
                const SizedBox(
                  width: 8,
                ),
                ButtonNumber(
                  number: '8',
                  onClickNumber: onClickNumber,
                ),
                const SizedBox(
                  width: 8,
                ),
                ButtonNumber(
                  number: '9',
                  onClickNumber: onClickNumber,
                ),
                Expanded(
                    child: GestureDetector(
                        onTap: onDeleteButtonClick,
                        behavior: HitTestBehavior.translucent,
                        child: Center(
                            child: SvgPicture.asset(
                          ImageAsset.iconDelete,
                          color: Color(0xFF3F91FF),
                        ))))
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 92,
                  height: 52,
                ),
                const SizedBox(
                  width: 8,
                ),
                ButtonNumber(
                  number: '0',
                  onClickNumber: onClickNumber,
                ),
                const SizedBox(
                  width: 8,
                ),
                // ButtonNumber(
                //   number: '.',
                //   onClickNumber: onClickNumber,
                // ),
                const SizedBox(
                  width: 92,
                ),
                Expanded(
                    child: GestureDetector(
                        onTap: () {
                          onNextButtonClick(context);
                        },
                        behavior: HitTestBehavior.translucent,
                        child: const Center(child: Text('Next'))))
              ],
            ),
            const SizedBox(
              height: 8,
            ),
          ],
        ));
  }
}

class ButtonNumber extends StatelessWidget {
  final String number;
  final Function(String) onClickNumber;

  const ButtonNumber(
      {super.key, required this.number, required this.onClickNumber});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 92,
      height: 52,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(color: Color(0xFF848688), offset: Offset(0, 1))
          ]),
      child: TextButton(
        onPressed: () {
          onClickNumber(number);
        },
        style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            fixedSize: const Size(92, 52),
            foregroundColor: Colors.black),
        child: Text(
          number.toString(),
          style: const TextStyle(
              fontSize: 25, height: 1, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
