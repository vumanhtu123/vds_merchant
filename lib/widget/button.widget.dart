import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class BigButton extends StatefulWidget {
  final Function function;
  final String text;
  final Color? color;
  final Color textColor;
  final Color? splashColor;
  final double fontSize;
  final Widget? icon;
  final bool isIconFront;
  final BorderSide? border;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double? space;
  final double? elevation;
  final BorderRadius? borderRadius;
  final MainAxisAlignment mainAxisAlignment;

  const BigButton({
    super.key,
    required this.function,
    required this.text,
    this.splashColor,
    this.fontSize = 15,
    this.color,
    this.textColor = Colors.white,
    this.icon,
    this.space,
    this.borderRadius,
    this.isIconFront = false,
    this.padding,
    this.border,
    this.margin,
    this.elevation,
    this.mainAxisAlignment = MainAxisAlignment.center,
  });

  @override
  State createState() => _BigButtonState();
}

class _BigButtonState extends State<BigButton> {
  bool isClickButton = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: widget.margin,
      child: ButtonTheme(
        height: 0,
        shape: RoundedRectangleBorder(
          borderRadius: widget.borderRadius ?? BorderRadius.circular(4.0),
          side: widget.border ?? BorderSide.none,
        ),
        splashColor: widget.splashColor ?? Get.theme.primaryColorLight,
        buttonColor: widget.color ?? Get.theme.primaryColor,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: widget.elevation,
            backgroundColor: widget.color ?? Get.theme.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: widget.borderRadius ?? BorderRadius.circular(4.0),
              side: widget.border ?? BorderSide.none,
            ),
          ),
          onPressed: () {
            if (!isClickButton) {
              isClickButton = true;
              widget.function();
              Future.delayed(const Duration(seconds: 1), () {
                isClickButton = false;
              });
            }
          },
          child: Padding(
            padding:
                widget.padding ?? const EdgeInsets.symmetric(vertical: 2.0),
            child: Row(
              mainAxisAlignment: widget.mainAxisAlignment,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (widget.isIconFront) (widget.icon ?? const SizedBox()),
                if (widget.isIconFront)
                  SizedBox(
                    width: widget.isIconFront ? (widget.space ?? 0) : 0,
                  ),
                Expanded(
                  child: Text(
                    widget.text,
                    style: TextStyle(
                        letterSpacing: -0.0024,
                        color: widget.textColor,
                        fontSize: widget.fontSize,
                        height: 1.0,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  width: !widget.isIconFront ? (widget.space ?? 0) : 0,
                ),
                !widget.isIconFront
                    ? (widget.icon ?? Container())
                    : const SizedBox()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyTextButton extends StatefulWidget {
  final Function function;
  final String? text;
  final Color textColor;
  final double fontSize;

  const MyTextButton({
    super.key,
    required this.function,
    this.text,
    this.fontSize = 14,
    this.textColor = Colors.white,
  });

  @override
  State createState() => _MyTextState();
}

class _MyTextState extends State<MyTextButton> {
  bool isClickButton = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        if (!isClickButton) {
          isClickButton = true;
          widget.function();
          Future.delayed(const Duration(seconds: 1), () {
            isClickButton = false;
          });
        }
      },
      child: Text(
        widget.text ?? '',
        style: TextStyle(
          color: widget.textColor,
          fontSize: widget.fontSize,
        ),
      ),
    );
  }
}

class SmallButton extends StatefulWidget {
  final Function function;
  final String? text;
  final Color? color;
  final Color textColor;
  final Color? splashColor;
  final double fontSize;
  final EdgeInsets padding;
  final IconData? icon;
  final Size buttonSize;
  final bool isClickMulti;
  final BorderRadius? borderRadius;
  final Widget? widget;
  final BorderSide? border;
  final List<BoxShadow>? boxShadow;

  const SmallButton({
    super.key,
    required this.function,
    this.text,
    this.splashColor,
    this.fontSize = 15,
    this.color,
    this.textColor = Colors.white,
    this.padding = const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
    this.icon,
    this.widget,
    this.buttonSize = const Size(20, 20),
    this.isClickMulti = true,
    this.borderRadius,
    this.boxShadow,
    this.border,
  });

  @override
  State createState() => _SmallButtonState();
}

class _SmallButtonState extends State<SmallButton> {
  bool isClickButton = false;

  Color getColor(Set<MaterialState> states) {
    const interactiveStates = <MaterialState>{
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return widget.color ?? Get.theme.primaryColor;
    }
    if (states.any((element) => element == MaterialState.pressed)) {
      return widget.splashColor ?? Get.theme.primaryColorLight;
    }
    return widget.color ?? Get.theme.primaryColor;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        if (widget.isClickMulti) {
          if (!isClickButton) {
            isClickButton = true;
            widget.function();
            Future.delayed(const Duration(seconds: 1), () {
              isClickButton = false;
            });
          }
        } else {
          widget.function();
        }
      },
      child: Padding(
        padding: widget.padding,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: widget.color ?? Get.theme.primaryColorLight,
              boxShadow: widget.boxShadow,
              border: Border.fromBorderSide(
                  widget.border ?? const BorderSide(color: Colors.transparent)),
              borderRadius: widget.borderRadius ?? BorderRadius.circular(4)),
          constraints: BoxConstraints(
            minHeight: widget.buttonSize.height,
            minWidth: widget.buttonSize.width,
            maxHeight: widget.buttonSize.height,
            maxWidth: widget.buttonSize.width,
          ),
          child: widget.widget ??
              (widget.icon == null
                  ? Text(
                      widget.text!,
                      style: TextStyle(
                          color: widget.textColor,
                          fontSize: widget.fontSize,
                          height: 1,
                          fontWeight: FontWeight.w500),
                    )
                  : Icon(
                      widget.icon,
                      color: widget.textColor,
                      size: widget.fontSize,
                    )),
        ),
      ),
    );
  }
}

class MyIconButton extends StatefulWidget {
  final Function function;
  final String? icon;

  const MyIconButton({
    super.key,
    required this.function,
    this.icon,
  });

  @override
  State createState() => _MyIconState();
}

class _MyIconState extends State<MyIconButton> {
  bool isClickButton = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        if (!isClickButton) {
          isClickButton = true;
          widget.function();
          Future.delayed(const Duration(seconds: 1), () {
            isClickButton = false;
          });
        }
      },
      child: SvgPicture.asset(widget.icon ?? ""),
    );
  }
}
