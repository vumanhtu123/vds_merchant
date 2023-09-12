import 'package:collection/collection.dart' show IterableExtension;
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class ButtonDropdown<T> extends StatelessWidget {
  final String hintText;
  final Color textColor;
  final Color splashColor;
  final double fontSize;
  final List<T>? items;
  final Function(T value)? callback;
  final bool enable;
  final Widget Function(T value) childReturn;
  final Widget Function(T value) textButton;
  final Widget Function(T value)? childReturnChoose;

  final ValueNotifier<T> selectedItem;
  final List<DropdownMenuItem<T>>? childs;
  final ValueNotifier<bool> isOpen = ValueNotifier<bool>(false);

  ButtonDropdown({
    Key? key,
    this.splashColor = Colors.blueGrey,
    this.fontSize = 16,
    this.textColor = Colors.white,
    this.hintText = '',
    this.items = const [],
    this.callback,
    required this.selectedItem,
    this.childs,
    this.enable = true,
    required this.childReturn,
    required this.textButton,
    required this.childReturnChoose,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: ValueListenableBuilder<T>(
          valueListenable: selectedItem,
          builder: (BuildContext context, value, Widget? child) {
            return DropdownButton2<T>(
              isExpanded: true,
              hint: Text(
                hintText,
              ),
              customButton: ValueListenableBuilder<bool>(
                  valueListenable: isOpen,
                  builder: (BuildContext context, isOpenValue, Widget? child) {
                    return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            color: isOpenValue
                                ? const Color(0xFFF89E19)
                                : const Color(0xFFDFE0EB),
                          ),
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.only(left: 13, right: 13),
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Expanded(child: textButton(value)),
                            Icon(
                              isOpenValue
                                  ? Icons.keyboard_arrow_up_sharp
                                  : Icons.keyboard_arrow_down_sharp,
                              size: 30,
                              color: const Color(0xFF747475),
                            )
                          ],
                        ));
                  }),
              items: items!.map((item) {
                return DropdownMenuItem<T>(
                    value: item,
                    child: childReturnChoose != null
                        ? (item == value
                            ? childReturnChoose!(item)
                            : childReturn(item))
                        : childReturn(item));
              }).toList(),
              value: selectedItem.value != null
                  ? items!.firstWhereOrNull(
                      (element) => element == selectedItem.value)
                  : null,
              onChanged: enable
                  ? (T? value) {
                      selectedItem.value = value as T;
                      if (callback != null) {
                        callback!(value);
                      }
                    }
                  : null,
              icon: ValueListenableBuilder<bool>(
                builder: (BuildContext context, value, Widget? child) {
                  return Icon(
                    value
                        ? Icons.keyboard_arrow_up_sharp
                        : Icons.keyboard_arrow_down_sharp,
                    size: 30,
                    color: const Color(0xFF747475),
                  );
                },
                valueListenable: isOpen,
              ),
              onMenuStateChange: (isOpenTemp) {
                isOpen.value = isOpenTemp;
              },
              iconSize: 14,
              iconEnabledColor: Colors.yellow,
              iconDisabledColor: Colors.grey,
              buttonHeight: 50,
              selectedItemHighlightColor: const Color(0xFFF6F7FB),
              itemSplashColor: Colors.red,
              buttonPadding: const EdgeInsets.only(left: 0, right: 13),
              buttonDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: Colors.black26,
                ),
                color: Colors.white,
              ),
              buttonElevation: 0,
              itemHeight: 40,
              itemPadding:
                  const EdgeInsets.only(left: 13, right: 13, top: 8, bottom: 8),
              dropdownMaxHeight: 200,
              dropdownPadding: null,
              dropdownDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white,
                  border: Border.all(color: const Color(0xFFDFE0EB))),
              dropdownElevation: 0,
              scrollbarRadius: const Radius.circular(40),
              scrollbarThickness: 6,
              offset: const Offset(0, -10),
            );
          }),
    );
  }
}


class ButtonDropdownLine<T> extends StatelessWidget {
  final String hintText;
  final Color textColor;
  final Color splashColor;
  final double fontSize;
  final List<T>? items;
  final Function(T value)? callback;
  final bool enable;
  final Widget Function(T value) childReturn;
  final Widget Function(T value) textButton;
  final Widget Function(T value)? childReturnChoose;

  final ValueNotifier<T> selectedItem;
  final List<DropdownMenuItem<T>>? childs;
  final ValueNotifier<bool> isOpen = ValueNotifier<bool>(false);

  ButtonDropdownLine({
    Key? key,
    this.splashColor = Colors.blueGrey,
    this.fontSize = 16,
    this.textColor = Colors.white,
    this.hintText = '',
    this.items = const [],
    this.callback,
    required this.selectedItem,
    this.childs,
    this.enable = true,
    required this.childReturn,
    required this.textButton,
    required this.childReturnChoose,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: ValueListenableBuilder<T>(
          valueListenable: selectedItem,
          builder: (BuildContext context, value, Widget? child) {
            return DropdownButton2<T>(
              isExpanded: false,
              hint: Text(hintText),
              customButton: ValueListenableBuilder<bool>(
                  valueListenable: isOpen,
                  builder: (BuildContext context, isOpenValue, Widget? child) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Expanded(child: textButton(value)),
                        Icon(
                          isOpenValue
                              ? Icons.keyboard_arrow_up_sharp
                              : Icons.keyboard_arrow_down_sharp,
                          size: 18,
                          color: const Color(0xFFA6A6A6),
                        )
                      ],
                    );
                  }),
              items: items!.map((item) {
                return DropdownMenuItem<T>(
                    value: item,
                    child: childReturnChoose != null
                        ? (item == value
                        ? childReturnChoose!(item)
                        : childReturn(item))
                        : childReturn(item));
              }).toList(),
              value: selectedItem.value != null
                  ? items!.firstWhereOrNull(
                      (element) => element == selectedItem.value)
                  : null,
              onChanged: enable
                  ? (T? value) {
                selectedItem.value = value as T;
                if (callback != null) {
                  callback!(value);
                }
              }
                  : null,
              icon: ValueListenableBuilder<bool>(
                builder: (BuildContext context, value, Widget? child) {
                  return Icon(
                    value
                        ? Icons.keyboard_arrow_up_sharp
                        : Icons.keyboard_arrow_down_sharp,
                    size: 30,
                    color: const Color(0xFF747475),
                  );
                },
                valueListenable: isOpen,
              ),
              onMenuStateChange: (isOpenTemp) {
                isOpen.value = isOpenTemp;
              },
              iconSize: 14,
              iconEnabledColor: Colors.yellow,
              iconDisabledColor: Colors.grey,
              buttonHeight: 50,
              selectedItemHighlightColor: const Color(0xFFF6F7FB),
              itemSplashColor: Colors.red,
              buttonPadding: const EdgeInsets.only(left: 0, right: 13),
              buttonDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: Colors.black26,
                ),
                color: Colors.white,
              ),
              buttonElevation: 0,
              itemHeight: 40,
              // itemPadding:
              // const EdgeInsets.only(left: 13, right: 13, top: 8, bottom: 8),
              dropdownMaxHeight: 200,
              dropdownFullScreen: true,
              dropdownDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white,
                  border: Border.all(color: const Color(0xFFDFE0EB))),
              dropdownElevation: 0,
              scrollbarRadius: const Radius.circular(40),
              scrollbarThickness: 6,
              offset: const Offset(0, -10),
            );
          }),
    );
  }
}
