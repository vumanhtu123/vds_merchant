import 'package:vds/common/api_const.dart';

class CreateOrderRequest {
  String? phoneNumber;
  String? orderCode;
  String? contents;
  int? promotionId;
  int? discount;
  String? originalPrice;

  CreateOrderRequest({
    this.phoneNumber,
    this.orderCode,
    this.contents,
    this.promotionId,
    this.discount,
    this.originalPrice,
  });

  Map<String, dynamic> toMap() {
    return {
      "phoneNumber": phoneNumber,
      "orderCode": orderCode,
      "contents": contents,
      "promotionId": promotionId,
      "discount": discount,
      "originalPrice": originalPrice,
    };
  }

  String toApi() => ApiConst.merchantOrder;
}
