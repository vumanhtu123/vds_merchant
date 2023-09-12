import 'package:vds/common/api_const.dart';

class PromotionRequest {
  int? size;
  int page;
  int merchantId;

  PromotionRequest(
      {this.size, required this.page, required this.merchantId});

  Map<String, dynamic> toMap() {
    return {
      "size": (size ?? ApiConst.size).toString(),
      "page": page.toString(),
      "merchant_id": merchantId.toString()
    };
  }

  String toApi() => ApiConst.campaignPromotion();
}
