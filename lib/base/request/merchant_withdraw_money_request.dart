import 'package:vds/common/api_const.dart';

class MerchantTransactionsMoneyRequest {

  String? createdFrom;
  String? createdTo;
  int? size;
  int page;

  MerchantTransactionsMoneyRequest({
    this.createdFrom,
    this.createdTo,
    this.size,
    required this.page
  });

  Map<String, dynamic> toMap() {
    return {
      "created-at-from": createdFrom,
      "created-at-to": createdTo,
      "size": (size ?? ApiConst.size).toString(),
      "page": page.toString(),
    };
  }

  String toApi() => ApiConst.merchantTransactionsWithdraw;
}