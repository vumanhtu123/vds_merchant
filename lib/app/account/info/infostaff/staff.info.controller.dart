import 'package:get/get.dart';
import 'package:vds/base/base_controller.dart';
import 'package:vds/common/enums.dart';
import 'package:vds/model/info.staff.model.dart';
import '../../../../base/request/StaffDetailRequest.dart';

class InfoStaffBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InfoStaffController>(() => InfoStaffController());
  }
}

class InfoStaffController extends BaseController {

  Rx<Data?> staffInfo = Data().obs;
  Rx<MerAppState> appState = MerAppState.loading.obs;
  String? messageError;

  @override
  void onInit() {
    getInfoStaff();
    super.onInit();
  }

  void getInfoStaff() {
    appState.value = MerAppState.loading;
    staffDetail(StaffDetailRequest()).then((value) {
      if(value.message == "Success") {
        appState.value = MerAppState.success;
      } else {
        messageError = value.message;
        appState.value = MerAppState.failed;
      }
      staffInfo.value = value.data;
    }).catchError((error) {
      messageError = error.toString();
      appState.value = MerAppState.failed;
    }).whenComplete(() {});
  }
}
