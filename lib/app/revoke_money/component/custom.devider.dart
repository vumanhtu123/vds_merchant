import 'package:flutter/material.dart';
import 'dart:math';

class CustomDivider extends CustomPainter {
  final bool inLeft;
  CustomDivider({this.inLeft = true});
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var width = size.width;
    var height = size.height;

    var paint = Paint()..color = const Color(0xFFF2F5F7);
    if (inLeft) {
      canvas.drawArc(
          Rect.fromCircle(center: Offset(0, height / 2), radius: width),
          3 * pi / 2,
          pi,
          true,
          paint);
    } else {
      canvas.drawArc(
          Rect.fromCircle(center: Offset(width, height / 2), radius: width),
          pi / 2,
          pi,
          true,
          paint);
    }
  }
}
