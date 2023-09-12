import 'package:get/get.dart';
import 'package:vds/base/base_controller.dart';
import 'package:vds/base/request/refresh_token_request.dart';
import 'package:vds/base/routes.dart';
import 'package:vds/common/storage_data.dart';

class RefreshTokenController extends BaseController {


  @override
  void onInit() {
    super.onInit();
    String? token = StorageData.instance.getRefreshToken();
    if(token != null) {
      final request = RefreshTokenRequest(refreshToken: token);
      refreshToken(request).then((value) async {
        final accessToken = value?.data?.accessToken;
        final refreshToken = value?.data?.refreshToken;
        if(accessToken != null && refreshToken != null) {
          StorageData.instance.setAppToken(accessToken);
          StorageData.instance.setRefreshToken(refreshToken);
          await Get.offNamed(Routes.mainApp);
        } else {
          await showErrorDialog(message: value?.errorCodes?.firstWhereOrNull((e) => e.message != null)?.message ?? "");
          await Get.offNamed(Routes.login);
        }
      }).catchError((error) async {
        await showErrorDialog(message: error.toString());
        await Get.offNamed(Routes.login);
      });
    }
  }
}
