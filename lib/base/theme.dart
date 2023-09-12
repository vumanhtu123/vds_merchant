import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData theme = ThemeData(
  primaryColor: const Color(0xFFF4AD22),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
    titleTextStyle: TextStyle(
        fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
    ),
  ),
);
