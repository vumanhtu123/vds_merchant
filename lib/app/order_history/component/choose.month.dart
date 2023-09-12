import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vds/app/order_history/order.history.controller.dart';
import 'package:vds/helper/convert.dart';
import 'package:vds/widget/button.dropdown.dart';

class ChooseMonth extends GetView<OrderHistoryController> {

  final Function(DateTime)? onCallBack;

  const ChooseMonth({super.key, this.onCallBack});

  @override
  Widget build(BuildContext context) {
    return ButtonDropdown<DateTime>(
      childReturnChoose: (value) {
        return Text(
          '${'Tháng'.tr} ${Convert.dateToString(value, 'MM, yyyy')}',
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        );
      },
      selectedItem: controller.chooseTime,
      items: controller.listTime,
      textButton: (value) {
        return Text(
          '${'Tháng'.tr} ${Convert.dateToString(value, 'MM, yyyy')}',
          style: const TextStyle(color: Colors.black),
        );
      },
      childReturn: (value) {
        return Text(
          '${'Tháng'.tr} ${Convert.dateToString(value, 'MM, yyyy')}',
          style: const TextStyle(color: Color(0xFF747475)),
        );
      },
      callback: onCallBack,
    );
  }
}
