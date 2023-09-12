import 'package:get/get.dart';
import 'package:vds/base/base_controller.dart';
import 'package:vds/base/request/merchant_detail_request.dart';
import 'package:vds/common/enums.dart';
import 'package:vds/model/info.staff.model.dart';
import 'package:vds/model/merchant_detail_response.dart';

import '../../../../base/request/StaffDetailRequest.dart';

class InfoMerchantBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InfoMerchantController>(() => InfoMerchantController());
  }
}

class InfoMerchantController extends BaseController {

  Rx<Datas?> merInfo = Datas().obs;
  Rx<Data?> staffInfo = Data().obs;
  Rx<MerAppState> appState = MerAppState.loading.obs;
  String? messageError;

  @override
  void onInit() {
    getInfoMerchant();
    super.onInit();
  }

  void getInfoMerchant() {
    appState.value = MerAppState.loading;
    merchantDetail(MerchantDetailRequest()).then((value) {
      if(value.message == "Success") {
        appState.value = MerAppState.success;
      } else {
        messageError = value.message;
        // messageError = 'Network Error';
        appState.value = MerAppState.failed;
      }
      merInfo.value = value.data;
    }).catchError((error) {
      // messageError = error.toString();
      messageError = 'Network Error';
      appState.value = MerAppState.failed;
    }).whenComplete(() {});
  }
  void getInfoStaff() {
    appState.value = MerAppState.loading;
    staffDetail(StaffDetailRequest()).then((value) {
      if(value.message == "Success") {
        appState.value = MerAppState.success;
      } else {
        messageError = value.message;
        // messageError = 'Network Error';
        appState.value = MerAppState.failed;
      }
      staffInfo.value = value.data;
    }).catchError((error) {
      // messageError = error.toString();
      messageError = 'Network Error';
      appState.value = MerAppState.failed;
    }).whenComplete(() {});
  }
}
