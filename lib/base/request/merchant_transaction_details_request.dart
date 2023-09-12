import 'package:vds/common/api_const.dart';

class TransactionDetailsRequest {
  String id;

  TransactionDetailsRequest({required this.id});

  Map<String, dynamic> toMap() {
    return {};
  }

  String toApi() => ApiConst.merchantTransactionsDetails(id);
}
