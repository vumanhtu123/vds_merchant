import 'package:flutter/material.dart';

class FormFieldCustom extends StatelessWidget {
  final Widget Function(FormFieldState<dynamic> field) child;
  final String? Function(Object?)? validator;
  final Color colorBorder;
  final bool showBorder;
  final EdgeInsets? paddingError;
  final BorderRadius? borderRadius;

  const FormFieldCustom(
      {Key? key,
      required this.child,
      this.validator,
      this.colorBorder = Colors.transparent,
      this.borderRadius,
      this.showBorder = true, this.paddingError})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormField(
        builder: (FormFieldState<dynamic> field) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  decoration: BoxDecoration(
                      borderRadius: borderRadius,
                      border: showBorder
                          ? Border.all(
                              color: (field.errorText != null
                                  ? Colors.red
                                  : colorBorder))
                          : null),
                  child: child(field)),
              if (field.errorText != null)
                Padding(
                  padding: paddingError ?? const EdgeInsets.only(left: 0.0, top: 8),
                  child: Text(field.errorText ?? '',
                      style: const TextStyle(color: Colors.red, fontSize: 12)),
                )
            ],
          );
        },
        validator: validator);
  }
}
