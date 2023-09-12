import 'package:vds/common/api_const.dart';

class CurrentMerchantRequest {
  CurrentMerchantRequest();

  Map<String, dynamic> toMap() {
    return {};
  }

  String toApi() => ApiConst.idMerchant;
}
