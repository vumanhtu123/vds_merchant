import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vds/app/revoke_money_ho/accept/revoke.money.ho.accept.controller.dart';
import 'package:vds/asset/Image.asset.dart';

class PinDialog extends GetView<RevokeMoneyHOAcceptController> {
  const PinDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
      height: 485,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      'Nhập mã Pin'.tr,
                      style: const TextStyle(
                          color: Color(0xFF263D60), fontSize: 16),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                        width: 200,
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 24),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: const Color(0xFFC4C4C4)),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: controller.listCodePin
                              .map((code) => Text('●',
                                  style: TextStyle(
                                      color: code.isEmpty
                                          ? const Color(0xFF9A9CAD)
                                          : Colors.black)))
                              .toList(),
                        )),
                    const SizedBox(height: 16),
                    (controller.tapCount.value > 0)
                        ? Expanded(
                        child: Column(
                          children: [
                            (controller.tapCount.value == 1)
                                ? (controller.checkSuccess.value == "Success")
                                ? const SizedBox()
                                : const Text(
                              'Pin code is not correct.\n'
                                  'Please check again!',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: Color(0xFFFF3B30)),
                            )
                                : (controller.tapCount.value == 2)
                                ? const Text(
                              'You already entered pin code wrong 2\n times.'
                                  ' Your account will be blocked if still\n wrong in next time',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: Color(0xFFFF3B30)),
                            )
                                : (controller.tapCount.value == 3)
                                ? const Text(
                              'Your account has been blocked cause of\n'
                                  ' wrong pin code in 3 consecutive time.'
                                  '\n Thank you!',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: Color(0xFFFF3B30)),
                            )
                                : const SizedBox(),
                          ],
                        ))
                        : SizedBox(),
                  ],
                ),
              ),
              KeyboardNumberCustom(
                onClickNumber: controller.onClickNumberPin,
                onDeleteButtonClick: controller.onDeletePin,
                onNextButtonClick: controller.nextButtonPinClick,
              )
            ],
          ),
        ));
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
                          color: const Color(0xFF3F91FF),
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
