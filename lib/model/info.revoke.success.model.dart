import 'package:json_annotation/json_annotation.dart';

part 'info.revoke.success.model.g.dart';

@JsonSerializable()
class BankInfoSuccess {
  String? message;
  String? traceId;
  Data? data;

  BankInfoSuccess({this.message, this.traceId, this.data});

  BankInfoSuccess.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    traceId = json['traceId'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['traceId'] = traceId;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

@JsonSerializable()
class Data {
  int? transactionId;
  String? requestDate;
  double? value;
  String? currency;

  Data({this.transactionId, this.requestDate, this.value, this.currency});

  Data.fromJson(Map<String, dynamic> json) {
    transactionId = json['transactionId'];
    requestDate = json['requestDate'];
    value = json['value'];
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['transactionId'] = transactionId;
    data['requestDate'] = requestDate;
    data['value'] = value;
    data['currency'] = currency;
    return data;
  }
}

