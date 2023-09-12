import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vds/base/repository/account_repositories.dart';
import 'package:vds/base/repository/auth_repositories.dart';
import 'package:vds/base/repository/order_repositories.dart';
import 'package:vds/base/repository/promotion_repositories.dart';
import 'package:vds/base/repository/wallet_repositories.dart';
import 'package:vds/base/routes.dart';
import '../asset/Image.asset.dart';
import '../common/storage_data.dart';

class BaseController extends GetxController
    with
        AuthRepositories,
        OrderRepositories,
        AccountRepositories,
        WalletRepositories,
        PromotionRepositories {
  @override
  void onInit() {
    super.onInit();
  }

  Future<void> openLoadingDialog() async {
    final overlayContext = Get.overlayContext;
    if (overlayContext != null) {
      showDialog(
        context: overlayContext,
        barrierDismissible: false,
        builder: (_) => WillPopScope(
          onWillPop: () async => false,
          child: const Center(
            child: SizedBox(
              width: 60,
              height: 60,
              child: CircularProgressIndicator(
                strokeWidth: 10,
              ),
            ),
          ),
        ),
      );
    }
  }

  Future<void> openSaveDialog() async {
    final overlayContext = Get.overlayContext;
    if (overlayContext != null) {
      showDialog(
          context: overlayContext,
          barrierDismissible: true,
          barrierColor: Colors.transparent,
          builder: (_) => WillPopScope(
                onWillPop: () async => false,
                child: Center(
                  child: Opacity(
                    opacity: 0.5,
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: const BoxDecoration(
                          color: Color(0xFF242424),
                          borderRadius: BorderRadius.all(Radius.circular(6))),
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          SvgPicture.asset('assets/images/Check_icon.svg'),
                          const Text(
                            'Đã lưu',
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: Color(0xFFFFFFFF)),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ));
      await Future.delayed(const Duration(seconds: 2));
      closeLoadingDialog();
    }
  }

  Future<void> closeLoadingDialog() async {
    final overlayContext = Get.overlayContext;
    if (overlayContext != null) {
      Navigator.of(overlayContext).pop();
    }
  }

  Future<void> showErrorDialog({required String? message}) async {
    return showDialog<void>(
      context: Get.context!,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('error'.tr),
          content: SingleChildScrollView(
            child: Text(message ?? ""),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  Future<dynamic> showErrorOTP(
      {required String tittle, required bool check}) async {
    return showDialog(
        context: Get.context!,
        barrierDismissible: false,
        barrierColor: Colors.black45,
        builder: (BuildContext context) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 200),
            child: Column(
              children: [
                Container(
                    width: 343,
                    height: 251,
                    decoration: const BoxDecoration(
                        color: Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.all(Radius.circular(6))),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 34,
                        ),
                        SvgPicture.asset('assets/images/error_icon.svg'),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          tittle,
                          style: const TextStyle(
                              decoration: TextDecoration.none,
                              color: Color(0xFFFF3B30),
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextButton(
                            onPressed: () {
                              (check == true)
                                  ? Navigator.pop(context)
                                  : Get.close(1);
                            },
                            child: Container(
                              width: 284,
                              height: 42,
                              color: const Color(0xFFF4AD22),
                              child: const Center(
                                  child: Text(
                                'Cancel',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: Colors.white),
                              )),
                            ))
                      ],
                    )),
              ],
            ),
          );
        });
  }

  Future<void> showSuccessChange({required String tittle}) async {
    final overlayContext = Get.overlayContext;
    if (overlayContext != null) {
      showDialog(
          context: Get.context!,
          barrierDismissible: false,
          barrierColor: Colors.black45,
          builder: (BuildContext context) {
            return WillPopScope(
                onWillPop: () async => false,
                child: Container(
                  margin: const EdgeInsets.only(top: 200),
                  child: Column(
                    children: [
                      Container(
                          width: 343,
                          height: 204,
                          decoration: const BoxDecoration(
                              color: Color(0xFFFFFFFF),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6))),
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 42,
                              ),
                              SvgPicture.asset(
                                  'assets/images/CheckCircleSuccess.svg'),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                tittle,
                                style: const TextStyle(
                                    decoration: TextDecoration.none,
                                    color: Color(0xFF00CC6A),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          )),
                    ],
                  ),
                ));
          });
    }
    await Future.delayed(const Duration(seconds: 2));
    closeLoadingDialog();
  }

  Future<dynamic> showErrorChange({required String tittle}) async {
    {
      showDialog(
          context: Get.context!,
          barrierDismissible: false,
          barrierColor: Colors.black45,
          builder: (BuildContext context) {
            return WillPopScope(
                onWillPop: () async => false,
                child: Container(
                  margin: const EdgeInsets.only(top: 200),
                  child: Column(
                    children: [
                      Container(
                          width: 343,
                          height: 204,
                          decoration: const BoxDecoration(
                              color: Color(0xFFFFFFFF),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6))),
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 42,
                              ),
                              SvgPicture.asset('assets/images/InfoError.svg'),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                tittle,
                                style: const TextStyle(
                                    decoration: TextDecoration.none,
                                    color: Color(0xFFFF3B30),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          )),
                    ],
                  ),
                ));
          });
    }
    await Future.delayed(const Duration(seconds: 3));
    closeLoadingDialog();
  }

  Future<dynamic> showAppDialog(
      {required String title,
      required String message,
      List<Widget>? actions}) async {
    return showDialog<dynamic>(
      context: Get.context!,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: Text(message),
          ),
          actions: actions ??
              <Widget>[
                TextButton(
                  child: const Text('Ok'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
        );
      },
    );
  }

  Future<dynamic> showLogout() async {
    return Get.bottomSheet(
      StatefulBuilder(builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 95,
              decoration: const BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.all(Radius.circular(6)),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 15),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const Spacer(),
                  Text(
                    'Bạn có chắc chắn muốn đăng xuất không?'.tr,
                    style: const TextStyle(
                        decoration: TextDecoration.none,
                        color: Color(0xFF242424),
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                  const Spacer(),
                  const Divider(
                    height: 1,
                    color: Color(0xFFF6F7FB),
                  ),
                  TextButton(
                    onPressed: () {
                      StorageData.instance.onLogout();
                      Get.offAllNamed(Routes.login);
                    },
                    child: Text(
                      'Đăng xuất'.tr,
                      style: const TextStyle(
                          color: Color(0xFFFF3B30),
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              margin: EdgeInsets.only(
                left: 15,
                right: 15,
                bottom: MediaQuery.of(context).padding.bottom,
              ),
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(6)),
              ),
              child: TextButton(
                onPressed: () => Get.back(),
                child: Text(
                  'Hủy'.tr,
                  style: const TextStyle(
                    color: Color(0xFF3F91FF),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  Future<dynamic> showErrorBlockDevice(
      bool check, String tittle, String content) async {
    return Get.bottomSheet<dynamic>(StatefulBuilder(
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 298,
              decoration: const BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.all(Radius.circular(6)),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 15),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  SvgPicture.asset('assets/images/InfoError.svg'),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    tittle,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFFF3B30),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    content,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      decoration: TextDecoration.none,
                      color: Color(0xFF747475),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      check == true
                          ? Get.offAndToNamed(Routes.login)
                          : Get.back();
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFFF4AD22),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      width: 284,
                      height: 42,
                      child: const Center(
                        child: Text(
                          'Ok',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            )
          ],
        );
      },
    ), isDismissible: false);
  }

  Future<dynamic> showErrorNetwork(String tittle, String content) async {
    return Get.bottomSheet<dynamic>(StatefulBuilder(
      builder: (context, state) {
        FocusManager.instance.primaryFocus?.unfocus();
        // closeLoadingDialog();
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 260,
              decoration: const BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.all(Radius.circular(6)),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 15),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  SvgPicture.asset(ImageAsset.iconIndicator),
                  const SizedBox(
                    height: 24,
                  ),
                  SvgPicture.asset('assets/images/InfoError.svg'),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    tittle,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFFF3B30),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    content,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      decoration: TextDecoration.none,
                      color: Color(0xFF747475),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFFF4AD22),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      width: 284,
                      height: 42,
                      child: const Center(
                        child: Text(
                          'Ok',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            )
          ],
        );
      },
    ), isDismissible: false);
  }
}
