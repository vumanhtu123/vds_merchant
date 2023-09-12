import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vds/base/pages.dart';
import 'base/binding.dart';
import 'base/routes.dart';
import 'base/theme.dart';
import 'base/translation/localization_service.dart';
import 'notification/fcm_conttroller.dart';

int androidSDKLevel = 0;
final firebaseMessaging = FirebaseMessaging.instance;

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  debugPrint('Handling a background message ${message.messageId}');
}

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel',
  'High Importance Notifications',
  importance: Importance.max,
);

GetStorage? appStorage;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  appStorage = GetStorage();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  Get.put(FCMController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: theme,
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splash,
      initialBinding: MainBind(),
      getPages: getPages,
      translations: LocalizationService(),
      locale: LocalizationService().getCurrentLanguage(),
      fallbackLocale: LocalizationService.fallbackLocale,
    );
  }
}