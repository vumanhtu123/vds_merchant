import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vds/app/refresh_token/refresh_token_page.dart';
import 'package:vds/base/base_model.dart';
import 'package:vds/common/mer_utils.dart';
import 'package:vds/common/storage_data.dart';

import '../../common/api_const.dart';

class ApiService extends GetConnect {

  ApiService() {
    httpClient.baseUrl = ApiConst.mainUrl;
    httpClient.defaultContentType = "application/json";
    httpClient.timeout = const Duration(minutes: 1);
  }

  Future<Map<String, dynamic>> getMer(String url,
      {bool hasHeaders = true}) async {
    Map<String, String> mapHeaders = {};
    if (hasHeaders) {
      mapHeaders["authorization"] = "Bearer ${StorageData.instance.getAppToken()}";
    }
    mapHeaders["imei"] = await MerUtils.getDeviceId();
    Response response = await get(url, headers: mapHeaders);
    _apiDebug(
      url: "GET:${httpClient.baseUrl}$url",
      headers: mapHeaders,
      formData: null,
      response: response,
    );
    return _apiMap(response);
  }

  Future<Map<String, dynamic>> getM(String url, Map<String, dynamic> params,
      {bool hasHeaders = true}) async {
    Map<String, String> mapHeaders = {};
    if (hasHeaders) {
      mapHeaders["authorization"] =
          "Bearer ${StorageData.instance.getAppToken()}";
    }
    mapHeaders["imei"] = await MerUtils.getDeviceId();
    Response response = await get(url, query: params, headers: mapHeaders);
    _apiDebug(
      url: "GET: ${httpClient.baseUrl}$url",
      headers: mapHeaders,
      formData: null,
      params: params,
      response: response,
    );
    return _apiMap(response);
  }

  Future<Map<String, dynamic>> postM(String url, Map<String, dynamic> params,
      {bool hasHeaders = true, FormData? formData, String? appToken}) async {
    Map<String, String> mapHeaders = {};
    final token = appToken ?? StorageData.instance.getAppToken();
    if (hasHeaders && token != null) {
      mapHeaders["authorization"] = "Bearer $token";
    }
    mapHeaders["imei"] = await MerUtils.getDeviceId();
    Response response =
        await post(url, formData ?? params, headers: mapHeaders);
    _apiDebug(
      url: "POST: ${httpClient.baseUrl}$url",
      headers: mapHeaders,
      formData: formData,
      params: params,
      response: response,
    );
    return _apiMap(response);
  }

  Future<Map<String, dynamic>> putM(String url, Map<String, dynamic> params,
      {bool hasHeaders = true, FormData? formData}) async {
    Map<String, String> mapHeaders = {};
    if (hasHeaders) {
      mapHeaders["authorization"] =
          "Bearer ${StorageData.instance.getAppToken()}";
    }
    mapHeaders["imei"] = await MerUtils.getDeviceId();
    Response response = await put(url, formData ?? params, headers: mapHeaders);
    _apiDebug(
      url: "PUT: ${httpClient.baseUrl}$url",
      headers: mapHeaders,
      formData: formData,
      params: params,
      response: response,
    );
    return _apiMap(response);
  }

  Future<Map<String, dynamic>> delM(String url,
      {bool hasHeaders = true}) async {
    Map<String, String> mapHeaders = {};
    if (hasHeaders) {
      mapHeaders["authorization"] =
          "Bearer ${StorageData.instance.getAppToken()}";
    }
    mapHeaders["imei"] = await MerUtils.getDeviceId();
    Response response = await delete(url, headers: mapHeaders);
    _apiDebug(
      url: "DEL: ${httpClient.baseUrl}$url",
      headers: mapHeaders,
      formData: null,
      params: {},
      response: response,
    );
    return _apiMap(response);
  }

  Map<String, dynamic> _apiMap(Response response) {
    if (response.statusCode == 401) {
      final token = StorageData.instance.getAppToken();
      if (token != null) {
        final refreshToken = StorageData.instance.getRefreshToken();
        StorageData.instance.setAppToken(null);
        Get.offAll(() => const RefreshTokenPage(),
            arguments: {'token': refreshToken});
      }
    }
    try {
      if (response.body == null) {
        return BaseModel.toMap(response.statusCode, errorHttp(response));
      }
      Map<String, dynamic> map = Map.from(response.body);
      map["status"] = response.statusCode;
      return map;
    } catch (error) {
      return BaseModel.toMap(response.statusCode, response.statusText);
    }
  }

  String errorHttp(Response response) {
    if(response.status.connectionError) {
      return 'Network Error';
    }
    return response.statusText ?? '';
  }

  _apiDebug({
    required String url,
    required Map<String, String> headers,
    required FormData? formData,
    Map<String, dynamic>? params,
    required Response response,
  }) {
    debugPrint("-----------------------------------");
    debugPrint(url);
    debugPrint('Headers: ${headers.toString()}');
    debugPrint('Params: ${formData ?? params.toString()}');
    debugPrint("${response.statusCode}, ${response.statusText}");
    log(response.body.toString());
    debugPrint("-----------------------------------");
  }
}

final apiService = ApiService();

class ApiUAAService extends GetConnect {
  ApiUAAService() {
    httpClient.baseUrl = ApiConst.mainUAAUrl;
    httpClient.defaultContentType = "application/json";
    httpClient.timeout = const Duration(minutes: 1);
  }

  Future<Map<String, dynamic>> getM(String url, Map<String, dynamic> params,
      {bool hasHeaders = true}) async {
    Map<String, String> mapHeaders = {};
    if (hasHeaders) {
      mapHeaders["authorization"] = "Basic dGVzdDp0ZXN0";
    }
    mapHeaders["imei"] = await MerUtils.getDeviceId();
    Response response = await get(url, query: params, headers: mapHeaders);
    _apiDebug(
      url: "GET: ${ApiConst.mainUAAUrl}$url",
      headers: mapHeaders,
      formData: null,
      params: params,
      response: response,
    );
    return _apiMap(response);
  }

  Future<Map<String, dynamic>> postM(String url, Map<String, dynamic> params,
      {bool hasHeaders = true, FormData? formData, String? appToken}) async {
    Map<String, String> mapHeaders = {};
    if (hasHeaders) {
      mapHeaders["X-Connector"] = "fcm-test-app";
      mapHeaders["authorization"] = (appToken != null)
          ? "Bearer $appToken" : "Basic dGVzdDp0ZXN0";
    }
    mapHeaders["imei"] = await MerUtils.getDeviceId();
    Response response =
        await post(url, formData ?? params, headers: mapHeaders);
    _apiDebug(
      url: "POST: ${ApiConst.mainUAAUrl}$url",
      headers: mapHeaders,
      formData: formData,
      params: params,
      response: response,
    );
    return _apiMap(response);
  }

  Future<Map<String, dynamic>> putM(String url, Map<String, dynamic> params,
      {bool hasHeaders = true, FormData? formData, String? appToken}) async {
    Map<String, String> mapHeaders = {};
    if (hasHeaders) {
      mapHeaders["authorization"] = (appToken != null)
          ? "Bearer $appToken" : "Basic dGVzdDp0ZXN0";
    }
    mapHeaders["imei"] = await MerUtils.getDeviceId();
    Response response =
    await post(url, formData ?? params, headers: mapHeaders);
    _apiDebug(
      url: "PUT: ${ApiConst.mainUAAUrl}$url",
      headers: mapHeaders,
      formData: formData,
      params: params,
      response: response,
    );
    return _apiMap(response);
  }

  Map<String, dynamic> _apiMap(Response response) {
    if(response.statusCode == 401) {
      final token = StorageData.instance.getAppToken();
      if(token != null) {
        final refreshToken = StorageData.instance.getRefreshToken();
        StorageData.instance.setAppToken(null);
        Get.offAll(() => const RefreshTokenPage(), arguments: {'token': refreshToken});
      }
    }
    try {
      if (response.body == null) {
        return BaseModel.toMap(response.statusCode, errorHttp(response));
      }
      Map<String, dynamic> map = Map.from(response.body);
      map["status"] = response.statusCode;
      return map;
    } catch (error) {
      return BaseModel.toMap(response.statusCode, response.statusText);
    }
  }

  String errorHttp(Response response) {
    if(response.status.connectionError) {
      return 'Network Error';
    }
    return response.statusText ?? '';
  }

  _apiDebug({
    required String url,
    required Map<String, String> headers,
    required FormData? formData,
    Map<String, dynamic>? params,
    required Response response,
  }) {
    debugPrint("-----------------------------------");
    debugPrint(url);
    debugPrint('Headers: ${headers.toString()}');
    debugPrint('Params: ${formData ?? params}');
    debugPrint("${response.statusCode}, ${response.statusText}");
    log(response.body.toString());
    debugPrint("-----------------------------------");
  }
}

final apiUAAService = ApiUAAService();

class ApiUALoginService extends GetConnect {
  ApiUALoginService() {
    httpClient.baseUrl = ApiConst.mainUA;
    httpClient.defaultContentType = "application/json";
    httpClient.timeout = const Duration(minutes: 1);
  }

  Future<Map<String, dynamic>> getM(String url, Map<String, dynamic> params,
      {bool hasHeaders = true}) async {
    Map<String, String> mapHeaders = {};
    if (hasHeaders) {
      mapHeaders["authorization"] = "Basic dGVzdDp0ZXN0";
    }
    mapHeaders["imei"] = await MerUtils.getDeviceId();
    Response response = await get(url, query: params, headers: mapHeaders);
    _apiDebug(
      url: "GET: ${ApiConst.mainUA}$url",
      headers: mapHeaders,
      formData: null,
      params: params,
      response: response,
    );
    return _apiMap(response);
  }

  Future<Map<String, dynamic>> postM(String url, Map<String, dynamic> params,
      {bool hasHeaders = true, FormData? formData, String? appToken}) async {
    Map<String, String> mapHeaders = {};
    if (hasHeaders) {
      mapHeaders["X-Connector"] = "fcm-test-app";
      mapHeaders["authorization"] =
          (appToken != null) ? "Bearer $appToken" : "Basic dGVzdDp0ZXN0";
    }
    mapHeaders["imei"] = await MerUtils.getDeviceId();
    Response response =
        await post(url, formData ?? params, headers: mapHeaders);
    _apiDebug(
      url: "POST: ${ApiConst.mainUA}$url",
      headers: mapHeaders,
      formData: formData,
      params: params,
      response: response,
    );
    return _apiMap(response);
  }

  _apiDebug({
    required String url,
    required Map<String, String> headers,
    required FormData? formData,
    Map<String, dynamic>? params,
    required Response response,
  }) {
    debugPrint("-----------------------------------");
    debugPrint(url);
    debugPrint('Headers: ${headers.toString()}');
    debugPrint('Params: ${formData ?? params}');
    debugPrint("${response.statusCode}, ${response.statusText}");
    log(response.body.toString());
    debugPrint("-----------------------------------");
  }

  Map<String, dynamic> _apiMap(Response response) {
    if (response.statusCode == 401) {
      final token = StorageData.instance.getAppToken();
      if (token != null) {
        final refreshToken = StorageData.instance.getRefreshToken();
        StorageData.instance.setAppToken(null);
        Get.offAll(() => const RefreshTokenPage(),
            arguments: {'token': refreshToken});
      }
    }
    try {
      if (response.body == null) {
        return BaseModel.toMap(response.statusCode, errorHttp(response));
      }
      Map<String, dynamic> map = Map.from(response.body);
      map["status"] = response.statusCode;
      return map;
    } catch (error) {
      return BaseModel.toMap(response.statusCode, errorHttp(response));
    }
  }

  String errorHttp(Response response) {
    if(response.status.connectionError) {
      return 'Network Error';
    }
    return response.statusText ?? '';
  }

  Future<Map<String, dynamic>> putM(String url, Map<String, dynamic> params,
      {bool hasHeaders = true, FormData? formData, String? appToken}) async {
    Map<String, String> mapHeaders = {};
    if (hasHeaders) {
      mapHeaders["authorization"] =
          (appToken != null) ? "Bearer $appToken" : "Basic dGVzdDp0ZXN0";
    }
    mapHeaders["imei"] = await MerUtils.getDeviceId();
    Response response =
        await post(url, formData ?? params, headers: mapHeaders);
    _apiDebug(
      url: "PUT: ${ApiConst.mainUA}$url",
      headers: mapHeaders,
      formData: formData,
      params: params,
      response: response,
    );
    return _apiMap(response);
  }
}

final apiUALogin = ApiUALoginService();