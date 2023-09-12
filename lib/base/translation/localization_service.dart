import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vds/common/storage_data.dart';
import 'translation.english.dart';
import 'translation.timor.dart';
import 'translation.vietnam.dart';

class LocalizationService extends Translations {
  // Default locale
  static const locale = Locale('en', 'US');

  // fallbackLocale saves the day when the locale gets in trouble
  static const fallbackLocale = Locale('en', 'US');

  // Supported languages
  // Needs to be same order with locales
  static final langs = ['en', 'vi', 'pt'];

  // Supported locales
  // Needs to be same order with langs
  static final locales = [
    const Locale('en', 'US'),
    const Locale('vi', 'VN'),
    const Locale('pt', 'TL'),
  ];

  // Keys and their translations
  // Translations are separated maps in `lang` file
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': usTranslation, // lang/en_us.dart
    'vi_VN': vietnamTranslation, // lang/tr_tr.dart
    'pt_TL': timorTranslation, // lang/ja_jp.dart
  };

  // Gets locale from language, and updates the locale
  void changeLocale(String lang) {
    final locale = _getLocaleFromLanguage(lang);
    Get.updateLocale(locale!);
  }

  Locale getCurrentLanguage() {
    String currentLang = StorageData.instance.getCurrentLanguage() ?? langs.first;
    return _getLocaleFromLanguage(currentLang) ?? locale;
  }

  // Finds language in `langs` list and returns it as Locale
  Locale? _getLocaleFromLanguage(String lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) return locales[i];
    }
    return Get.locale;
  }
}