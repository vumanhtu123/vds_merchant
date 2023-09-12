import 'package:vds/common/api_const.dart';

class MerchantWalletPolicyRequest {
  final String type;

  MerchantWalletPolicyRequest({required this.type});

  Map<String, dynamic> toMap() {
    //HO or BANK
    return {"type": type};
  }

  String toApi() => ApiConst.merchantWalletPolicy;
}
