import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:vds/app/mainapp/main.app.controller.dart';
import 'package:vds/base/base_controller.dart';
import 'package:vds/base/request/register_device_token_request.dart';
import 'package:vds/common/storage_data.dart';
import 'package:vds/main.dart';

class FCMController extends BaseController {
  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  @override
  void onInit() {
    firebaseMessaging.getToken().then((value) async {
      debugPrint('VDSFirebaseToken:$value');
      await StorageData.instance.setDeviceStore(value);
      registerDT();
    });
    super.onInit();
    initIos();
    initAndroid();
    initMessage();
  }

  void registerDT() async {
    if(StorageData.instance.isRegisterDeviceToken()) return;
    String token = StorageData.instance.getDeviceStore() ?? "";
    String appToken = StorageData.instance.getAppToken() ?? "";
    if(token.isEmpty || appToken.isEmpty) return;
    final request = RegisterDeviceTokenRequest(token: token);
    registerDeviceToken(request).then((value) {
      if(value?.message == "Success") {
        StorageData.instance.setRegisterDeviceToken();
      }
    }).catchError((error) { debugPrint('$error'); });
  }

  Future<void> initIos() async {
    if (Platform.isIOS) {
      final settings = await firebaseMessaging.requestPermission();
      debugPrint('User granted permission: ${settings.authorizationStatus}');
    }
  }

  void initAndroid() async {
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
    await firebaseMessaging.setForegroundNotificationPresentationOptions(
        alert: Platform.isIOS ? false : true, badge: true, sound: true);
  }

  void initMessage() {
    FirebaseMessaging.onMessage.listen((event) async {
      final body = event.notification?.body ?? "";
      debugPrint('FirebaseMessaging onMessage event:$event');
      debugPrint('FirebaseMessaging onMessage body:$body');
      debugPrint('FirebaseMessaging onMessage data:${event.data}');
      if(body.isNotEmpty) {
        Get.snackbar("", body, backgroundColor: Colors.white);
        int count = StorageData.instance.getNotifyCount();
        count = count + 1;
        StorageData.instance.setNotifyCount(count);
        if(Get.isRegistered<MainAppController>() == true) {
          Get.find<MainAppController>().notifyCount.value = count;
        }
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      debugPrint('FirebaseMessaging onMessageOpenedApp:${event.notification?.body}');
      debugPrint('FirebaseMessaging onMessageOpenedApp:${event.data}');
    });
  }
}
