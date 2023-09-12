import 'package:vds/common/api_const.dart';

class MerchantBalanceRequest {

  MerchantBalanceRequest();

  Map<String, dynamic> toMap() {
    return {};
  }

  String toApi() => ApiConst.merchantAccountBalance;
}