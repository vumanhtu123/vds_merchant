import 'package:vds/common/api_const.dart';

class InvoiceRequest {

  String id;

  InvoiceRequest({required this.id});

  Map<String, dynamic> toMap() {
    return {};
  }

  String toApi() => ApiConst.invoice(id);
}