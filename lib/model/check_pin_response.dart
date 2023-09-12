import 'package:json_annotation/json_annotation.dart';

part 'check_pin_response.g.dart';

@JsonSerializable()
class CheckPinResponse {
  final String? message;
  final String? error;
  final CheckPinData? data;

  CheckPinResponse({this.message, this.data, this.error});

  factory CheckPinResponse.fromJson(Map<String, dynamic> json) =>
      _$CheckPinResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CheckPinResponseToJson(this);
}

@JsonSerializable()
class CheckPinData {
  final bool? isRegistered;

  CheckPinData({this.isRegistered});

  factory CheckPinData.fromJson(Map<String, dynamic> json) =>
      _$CheckPinDataFromJson(json);

  Map<String, dynamic> toJson() => _$CheckPinDataToJson(this);
}
