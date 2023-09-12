import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class CurrentModel {
  String? message;
  String? traceId;
  Datum? data;

  CurrentModel({this.message, this.traceId, this.data});

  CurrentModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    traceId = json['traceId'];
    data = json['data'] != null ? Datum.fromJson(json['data']) : null;
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
class Datum {
  int? merchantId;
  String? merchantUUID;
  String? merchantName;
  String? merchantCode;

  Datum(
      {this.merchantId,
      this.merchantUUID,
      this.merchantName,
      this.merchantCode});

  Datum.fromJson(Map<String, dynamic> json) {
    merchantId = json['merchantId'];
    merchantUUID = json['merchantUUID'];
    merchantName = json['merchantName'];
    merchantCode = json['merchantCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['merchantId'] = merchantId;
    data['merchantUUID'] = merchantUUID;
    data['merchantName'] = merchantName;
    data['merchantCode'] = merchantCode;
    return data;
  }
}
