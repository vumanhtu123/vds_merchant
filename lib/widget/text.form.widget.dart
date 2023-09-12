import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormFieldCustom extends StatelessWidget {
  final Function? validator;
  final String hintText;
  final TextEditingController? controller;
  final Color color;
  final Color? textColor;
  final Color splashColor;
  final double fontSize;
  final FocusNode? focusNode;
  final BorderRadius? borderRadiusOut;
  final TextInputType? keyboardType;
  final int maxLines;
  final bool hasIcon;
  final Widget? label;
  final bool enable;
  final Color? hintColor;
  final double? letterSpacing;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final Function(String text)? onChanged;
  final Function(String text)? onFieldSubmitted;
  final EdgeInsets? contentPadding;
  final bool hasPrefixIcon;
  final IconData? prefixIcon;
  final Widget? prefixIconWidget;
  final Widget? suffixIconWidget;
  final String? initialValue;
  final Color? borderColor;
  final Color? fillColor;
  final BoxBorder? borderFather;
  final Color? focusColor;
  final InputBorder? border;
  final TextStyle? labelFloatingStyle;
  final bool obscureText;
  final String? labelText;
  final Function()? onEditComplete;
  final bool isCollapsed;
  final AutovalidateMode? autoValidate;
  final List<TextInputFormatter>? inputFormatters;
  final String? errorMessage;
  final String? textInput;

  const TextFormFieldCustom(
      {Key? key,
      this.splashColor = Colors.blueGrey,
      this.fontSize = 14,
      this.hintColor,
      this.focusColor,
      this.onEditComplete,
      this.suffixIconWidget,
      this.color = Colors.transparent,
      this.textColor,
      this.hintText = '',
      this.validator,
      required this.controller,
      this.keyboardType,
      this.onChanged,
      this.maxLines = 1,
      this.focusNode,
      this.contentPadding,
      this.initialValue,
      this.hasIcon = true,
      this.enable = true,
      this.border,
      this.obscureText = false,
      this.autoValidate,
      this.isCollapsed = false,
      this.borderColor,
      this.fillColor,
      this.onFieldSubmitted,
      this.borderRadiusOut,
      this.hasPrefixIcon = false,
      this.prefixIcon,
      this.borderFather,
      this.prefixIconWidget,
      this.floatingLabelBehavior,
      this.labelText,
      this.labelFloatingStyle,
      this.letterSpacing,
      this.label,
      this.inputFormatters,
      this.errorMessage,
      this.textInput})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: borderRadiusOut,
              color: color,
              border: borderFather),
          child: TextFormField(
            cursorHeight: 14,
            keyboardType: keyboardType,
            maxLines: maxLines,
            focusNode: focusNode,
            initialValue: initialValue,
            obscureText: obscureText,
            // passwordText
            enabled: enable,
            style: TextStyle(
                fontSize: fontSize,
                color: textColor,
                letterSpacing: letterSpacing),
            onChanged: onChanged,
            obscuringCharacter: textInput ?? '*',
            enableInteractiveSelection: true,
            autofocus: false,
            readOnly: false,
            onFieldSubmitted: onFieldSubmitted,
            onEditingComplete: onEditComplete,
            toolbarOptions: const ToolbarOptions(
              paste: true,
              cut: true,
              selectAll: true,
              copy: true,
            ),
            textInputAction: TextInputAction.go,
            decoration: InputDecoration(
                floatingLabelBehavior: floatingLabelBehavior,
                isCollapsed: isCollapsed,
                // heightBackground
                hintText: hintText,
                labelText: labelText,
                fillColor: fillColor ?? const Color(0xFFF7F9FC),
                filled: true,
                labelStyle: const TextStyle(letterSpacing: 0),
                floatingLabelStyle: labelFloatingStyle,
                errorMaxLines: 2,
                label: label,
                hintStyle:
                    TextStyle(fontSize: 12, color: hintColor, letterSpacing: 0),
                hoverColor: focusColor,
                focusColor: focusColor,
                disabledBorder: border ??
                    OutlineInputBorder(
                        borderRadius: borderRadiusOut ??
                            const BorderRadius.all(Radius.circular(4)),
                        borderSide:
                            BorderSide(color: borderColor ?? Colors.white)),
                enabledBorder: border ??
                    OutlineInputBorder(
                        borderRadius: borderRadiusOut ??
                            const BorderRadius.all(Radius.circular(4)),
                        borderSide:
                            BorderSide(color: borderColor ?? Colors.white)),
                focusedBorder: border ??
                    OutlineInputBorder(
                        borderRadius: borderRadiusOut ??
                            const BorderRadius.all(Radius.circular(4)),
                        borderSide:
                            BorderSide(color: borderColor ?? Colors.white)),
                suffixIcon: suffixIconWidget,
                suffixIconConstraints: const BoxConstraints(
                    minWidth: 0, maxWidth: 50, minHeight: 0),
                prefixIcon: prefixIconWidget ??
                    (hasPrefixIcon
                        ? Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 8),
                            child: Icon(prefixIcon ?? Icons.phone,
                                color: Colors.black),
                          )
                        : SizedBox(
                            width: isCollapsed ? 10 : 6,
                          )),
                prefixIconConstraints:
                    const BoxConstraints(minWidth: 0, maxWidth: 40),
                errorBorder: OutlineInputBorder(
                    gapPadding: 0,
                    borderRadius: borderRadiusOut ??
                        const BorderRadius.all(Radius.circular(4)),
                    borderSide: const BorderSide(color: Colors.red)),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: borderRadiusOut ??
                        const BorderRadius.all(Radius.circular(4)),
                    borderSide: const BorderSide(color: Colors.red)),
                contentPadding: contentPadding ??
                    (isCollapsed
                        ? const EdgeInsets.fromLTRB(10, 10, -30, 10)
                        : const EdgeInsets.fromLTRB(15.0, 2, 0, 0)),
                border: InputBorder.none),
            controller: controller,
            validator: (String? text) {
              if (validator == null) return null;
              String? errorText = validator!(text);
              return errorText;
            },

            autovalidateMode:
                autoValidate ?? AutovalidateMode.onUserInteraction,
            inputFormatters: inputFormatters,
          ),
        ),
        if (errorMessage != null && errorMessage!.isNotEmpty) ...[
          const SizedBox(height: 5),
          Text(
            errorMessage ?? "",
            style: const TextStyle(color: Color(0xFFFF3B30)),
          )
        ]
      ],
    );
  }
}

class DismissKeyboard extends StatelessWidget {
  final Widget child;

  const DismissKeyboard({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: child,
    );
  }
}


class CommaTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    String truncated = newValue.text;
    TextSelection newSelection = newValue.selection;
    // print(oldValue.text + " ----- " + newValue.text);
    if (newValue.text.contains(',') && oldValue.text.isNotEmpty) {
      truncated = newValue.text.replaceFirst(RegExp(','), '.');
    }
    return TextEditingValue(
      text: truncated,
      selection: newSelection,
    );
  }
}