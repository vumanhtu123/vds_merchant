import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class Convert {
  static String convertMoney(money, {bool isMoney = false}) {
    print(money);
    NumberFormat oCcy = NumberFormat('#,##0', 'en_US');
    if (money is int || money is double) {
      if (money.toString().contains(".")) {
        oCcy = NumberFormat('#,##0.00', 'en_US');
      }
      // return oCcy.format(money).replaceAll(',', '.');
      return oCcy.format(money);
    } else if (money is String) {
      if (money.isEmpty) {
        return '';
      }
      if (money.contains(".")) {
        oCcy = NumberFormat('#,##0.00', 'en_US');
      }
      return oCcy.format(double.tryParse(money) ?? 0);
    }
    return '0';
  }

  static DateTime stringToDate(String date, {String? pattern}) {
    if (date.isEmpty) return DateTime.now();
    pattern ??= 'dd/MM/yyyy';
    return DateFormat(pattern).parse(date);
  }

  static String stringToDateAnotherPattern(String date,
      {String? patternIn, String? patternOut, String? ifNull}) {
    if (date.isEmpty) {
      if (ifNull != null) {
        return ifNull;
      }
      return '';
    }
    patternIn ??= 'dd/MM/yyyy';
    patternOut ??= 'dd MM yyyy HH:mm:ss';
    return DateFormat(patternOut)
        .format(DateFormat(patternIn).parse(date, true).toLocal());
  }

  static String dateToString(DateTime? picked, String? patternOut) {
    if (picked == null) return '';
    patternOut ??= 'dd/MM/yyyy';
    return DateFormat(patternOut).format(picked);
  }

  static String stringToDatePromotion(String date, {String? ifNull}) {
    tz.initializeTimeZones();
    if (date.isEmpty) {
      if (ifNull != null) {
        return ifNull;
      }
      return '';
    }
// Get the current date and time
    DateTime now = DateTime.now();

// Get the local time zone offset in seconds
    int timeZoneOffset = now.timeZoneOffset.inHours;
    DateTime dateTime = DateTime.parse(date);
    dateTime = dateTime.add(Duration(hours: timeZoneOffset));
    print('Adjusted date and time: $dateTime');
    String formattedDate = DateFormat('dd/MM/yyyy').format(dateTime);
    return formattedDate;
  }

  static String stringToDateAll(String date, {String? ifNull}) {
    tz.initializeTimeZones();
    if (date.isEmpty) {
      if (ifNull != null) {
        return ifNull;
      }
      return '';
    }
// Get the current date and time
    DateTime now = DateTime.now();

// Get the local time zone offset in seconds
    int timeZoneOffset = now.timeZoneOffset.inHours;
    DateTime dateTime = DateTime.parse(date);
    dateTime = dateTime.add(Duration(hours: timeZoneOffset));
    print('Adjusted date and time: $dateTime');
    String formattedDate = DateFormat('dd/MM/yyyy HH:mm:ss').format(dateTime);
    return formattedDate;
  }

  static String stringToDatePayment(String date, {String? ifNull}) {
    if (date.isEmpty) {
      if (ifNull != null) {
        return ifNull;
      }
      return '';
    }
    DateTime dateTime = DateTime.parse(date);
    dateTime = dateTime.add(const Duration(hours: 7));
    String formattedDate = DateFormat('dd/MM/yyyy HH:mm:ss').format(dateTime);
    return formattedDate;
  }

  static String stringToDateHistory(String date, {String? ifNull}) {
    if (date.isEmpty) {
      if (ifNull != null) {
        return ifNull;
      }
      return '';
    }
    DateTime dateTime = DateTime.parse(date);
    dateTime = dateTime.add(const Duration(hours: 7));
    String formattedDate = DateFormat('HH:mm:ss dd/MM/yyyy ').format(dateTime);
    return formattedDate;
  }
}
