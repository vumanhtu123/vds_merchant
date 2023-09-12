import 'package:get/get.dart';
import 'package:vds/base/base_controller.dart';
import 'package:vds/base/request/refresh_token_request.dart';
import 'package:vds/base/routes.dart';
import 'package:vds/common/storage_data.dart';

class SplashController extends BaseController {
  @override
  void onInit() {
    super.onInit();

    final reToken = StorageData.instance.getRefreshToken();
    if(reToken != null) {
      final request = RefreshTokenRequest(refreshToken: reToken);
      refreshToken(request).then((value) async {
        final accessToken = value?.data?.accessToken;
        final refreshToken = value?.data?.refreshToken;
        if(accessToken != null && refreshToken != null) {
          StorageData.instance.setAppToken(accessToken);
          StorageData.instance.setRefreshToken(refreshToken);
          await Get.offNamed(Routes.mainApp);
        } else {
          Get.offNamed(Routes.login);
        }
      }).catchError((error) async {
        Get.offNamed(Routes.login);
      });
    } else {
      Future.delayed(const Duration(milliseconds: 2000)).then((value) {
        if (StorageData.instance.getTheFirst()) {
          Get.offNamed(Routes.onboarding);
        } else {
          if (StorageData.instance.getAppToken() != null) {
            Get.offNamed(Routes.mainApp);
          } else {
            Get.offNamed(Routes.login);
          }
        }
      });
    }
  }
}
