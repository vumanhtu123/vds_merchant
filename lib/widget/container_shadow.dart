import 'package:flutter/material.dart';

class ContainerShadow extends StatelessWidget {

  final Widget child;
  final EdgeInsets? padding;

  const ContainerShadow({super.key, required this.child, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          blurRadius: 10,
          color: const Color(0xFF747475).withOpacity(0.12),
        )
      ], color: Colors.white),
      margin: const EdgeInsets.only(top: 15, bottom: 25),
      padding: padding ?? const EdgeInsets.fromLTRB(18, 18, 18, 15),
      child: child,
    );
  }
}