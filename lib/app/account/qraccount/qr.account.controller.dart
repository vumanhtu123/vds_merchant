import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:vds/base/base_controller.dart';
import 'package:vds/base/request/StaffDetailRequest.dart';
import 'package:vds/base/request/merchant_detail_request.dart';
import 'package:vds/common/enums.dart';
import 'package:vds/model/info.staff.model.dart';
import 'package:vds/model/merchant_detail_response.dart';

class QrAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QrAccountController>(() => QrAccountController());
  }
}

class QrAccountController extends BaseController {
  Rx<Datas?> merInfo = Datas().obs;
  Rx<Data?> staffInfo = Data().obs;
  Rx<MerAppState> appState = MerAppState.loading.obs;
  String? messageError;
  final GlobalKey genKey = GlobalKey();
  bool isShareBarcode = false;

  @override
  void onInit() {
    getInfo();
    super.onInit();
  }

  void getInfo() {
    appState.value = MerAppState.loading;
    merchantDetail(MerchantDetailRequest()).then((value) {
      if (value.message == "Success") {
        appState.value = MerAppState.success;
        merInfo.value = value.data;
      } else {
        // messageError = value.message;
        messageError = 'Network Error';
        appState.value = MerAppState.failed;
      }
    }).catchError((error) {
      messageError = error.toString();
      appState.value = MerAppState.failed;
    }).whenComplete(() {});
  }

  void getInfoStaff() {
    appState.value = MerAppState.loading;
    staffDetail(StaffDetailRequest()).then((value) {
      if (value.message == "Success") {
        appState.value = MerAppState.success;
      } else {
        messageError = value.message;
        appState.value = MerAppState.failed;
      }
      staffInfo.value = value.data;
    }).catchError((error) {
      // messageError = error.toString();
      messageError = 'Network Error';
      appState.value = MerAppState.failed;
    }).whenComplete(() {});
  }

  void downloadImageFromBase64(String base64String) async {
    // Decode the base64 string to bytes
    //show loading
    if (isShareBarcode) {
      return;
    } else {
      base64String = base64String.replaceAll(
          "data:image/png;base64,", ""); // remove whitespace characters
      Uint8List bytes = base64.decode(base64String);
      // Create a file from the decoded bytes
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/image.png');
      await file.writeAsBytes(bytes);
      File imgFile = File(join(directory.path, 'imagetest.png'));
      await imgFile.writeAsBytes(bytes);
      var isSuccess = await GallerySaver.saveImage(imgFile.path);
      if (isSuccess == true) {
        isShareBarcode = false;
        await openSaveDialog();
        isShareBarcode = false;
      }
      print('Download status: $isSuccess');
    }
  }

  void shareBarcode(String base64String) async {
    if (isShareBarcode) return;
    isShareBarcode = true;
    base64String = base64String.replaceAll(
        "data:image/png;base64,", ""); // remove whitespace characters
    Uint8List bytes = base64.decode(base64String);
    // Create a file from the decoded bytes
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/image.png');
    await file.writeAsBytes(bytes);
    var shareResule = await Share.shareXFiles([
      XFile.fromData(
        bytes,
        name: 'barcode.png',
        mimeType: 'image/png',
      )
    ]);
    isShareBarcode = false;
    print(shareResule.status);
  }
}
