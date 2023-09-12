import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vds/asset/Image.asset.dart';
import 'translation.english.dart';
import 'translation.timor.dart';

class MyTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys =>
      {for (var e in SupportLanguage.values) e.locale: e.supportLanguage};
}

// enum SupportLanguage { us, vi, lt }
enum SupportLanguage { us, lt }

extension SupportLanguageExtension on SupportLanguage {
  Widget get flag => _flag();
  Widget get flagCircle => _flagCircle();

  Widget _flag() {
    switch (this) {
      case SupportLanguage.us:
        return ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.asset(
              ImageAsset.flagEnglish,
              height: 20,
              fit: BoxFit.cover,
              width: 30,
            ));
      // case SupportLanguage.vi:
      //   return ClipRRect(
      //       borderRadius: BorderRadius.circular(5),
      //       child: Image.asset(
      //         ImageAsset.flagVietnam,
      //         height: 20,
      //         fit: BoxFit.cover,
      //         width: 30,
      //       ));
      case SupportLanguage.lt:
        return ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.asset(
              ImageAsset.flagTimor,
              fit: BoxFit.cover,
              height: 20,
              width: 30,
            ));
    }
  }

  Widget _flagCircle() {
    switch (this) {
      case SupportLanguage.us:
        return ClipRRect(
            borderRadius: BorderRadius.circular(17),
            child: Image.asset(
              ImageAsset.flagEnglishCircle,
              height: 34,
              fit: BoxFit.cover,
              width: 34,
            ));
      // case SupportLanguage.vi:
      //   return ClipRRect(
      //       borderRadius: BorderRadius.circular(17),
      //       child: Image.asset(
      //         ImageAsset.flagVietnam,
      //         height: 34,
      //         fit: BoxFit.cover,
      //         width: 34,
      //       ));
      case SupportLanguage.lt:
        return ClipRRect(
            borderRadius: BorderRadius.circular(17),
            child: Image.asset(
              ImageAsset.flagTimorCircle,
              fit: BoxFit.cover,
              height: 34,
              width: 34,
            ));
    }
  }

  String get text => _text();

  String _text() {
    switch (this) {
      case SupportLanguage.us:
        return 'English';
      // case SupportLanguage.vi:
      //   return 'Tiếng Việt';
      case SupportLanguage.lt:
        return 'Língua timorense';
    }
  }

  String get languageCode => _languageCode();

  String _languageCode() {
    switch (this) {
      case SupportLanguage.us:
        return 'en';
      // case SupportLanguage.vi:
      //   return 'vi';
      case SupportLanguage.lt:
        return 'pt';
    }
  }

  String get countryCode => _countryCode();

  String _countryCode() {
    switch (this) {
      case SupportLanguage.us:
        return 'US';
      // case SupportLanguage.vi:
      //   return 'VN';
      case SupportLanguage.lt:
        return 'TL';
    }
  }

  String get locale => _locale();

  String _locale() {
    switch (this) {
      case SupportLanguage.us:
        return 'en_US';
      // case SupportLanguage.vi:
      //   return 'vi_VN';
      case SupportLanguage.lt:
        return 'pt_TL';
    }
  }

  Map<String, String> get supportLanguage => _supportLanguage();

  Map<String, String> _supportLanguage() {
    switch (this) {
      case SupportLanguage.us:
        return usTranslation;
      // case SupportLanguage.vi:
      //   return vietnamTranslation;
      case SupportLanguage.lt:
        return timorTranslation;
    }
  }
}
