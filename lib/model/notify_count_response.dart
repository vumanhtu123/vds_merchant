import 'package:json_annotation/json_annotation.dart';

import 'error_code.dart';
part 'notify_count_response.g.dart';

@JsonSerializable()
class NotifyCountResponse {

  String? message;
  String? traceId;
  NotifyCountData? data;
  List<ErrorCode>? errorCodes;

  NotifyCountResponse({this.message, this.traceId, this.data, this.errorCodes});

  factory NotifyCountResponse.fromJson(Map<String, dynamic> json) =>
      _$NotifyCountResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NotifyCountResponseToJson(this);
}

@JsonSerializable()
class NotifyCountData {

  int? count;

  NotifyCountData({this.count});

  factory NotifyCountData.fromJson(Map<String, dynamic> json) =>
      _$NotifyCountDataFromJson(json);

  Map<String, dynamic> toJson() => _$NotifyCountDataToJson(this);
}