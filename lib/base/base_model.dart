import 'package:get/get.dart';
import 'package:vds/model/error_code.dart';

class BaseModel {
  int? status;
  String? message;
  int? code;
  String? errorDescription;
  int? errorCode;

  BaseModel.fromJson(Map<String, dynamic>? data) {
    status = data?["status"];
    message = data?["message"];
    code = data?["code"];
    final errorCodes = data?["errorCodes"];
    final errorCodeList = (errorCodes is List)
        ? errorCodes.map((e) => ErrorCode.fromJson(e)).toList()
        : null;
    errorDescription =
        errorCodeList?.firstWhereOrNull((e) => e.message != null)?.message ??
            (message ?? "");

    final errorCoder = (errorCodes is List)
        ? errorCodes.map((e) => ErrorCode.fromJson(e)).toList()
        : null;
    errorCode = (errorCoder
            ?.firstWhereOrNull((element) => element.code != null)
            ?.code ??
        (code ?? 0));
  }

  static Map<String, dynamic> toMap(int? status, String? message) {
    Map<String, dynamic> map = {};
    map["status"] = status ?? 0;
    map["message"] = message ?? "Connection error";
    return map;
  }

  bool isSuccess() => message == "Success";
}
