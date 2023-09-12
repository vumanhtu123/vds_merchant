import 'package:vds/common/api_const.dart';

class MerchantTransactionsRequest {

  String? createdFrom;
  String? createdTo;
  int? size;
  int page;

  MerchantTransactionsRequest({
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

  String toApi() => ApiConst.merchantTransactions;
}