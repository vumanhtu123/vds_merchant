import 'package:vds/base/base_model.dart';
import 'package:vds/base/networking/api_service.dart';
import 'package:vds/base/request/login_request.dart';
import 'package:vds/base/request/refresh_token_request.dart';
import 'package:vds/base/request/register_device_token_request.dart';
import 'package:vds/base/request/unregister_device_token_request.dart';
import 'package:vds/common/storage_data.dart';
import 'package:vds/model/login_response.dart';

class AuthRepositories {
  Future<LoginResponse?> login(LoginRequest request) async {
    final map = await apiUALogin.postM(request.toApi(), request.toMap());
    return LoginResponse.fromJson(map);
  }

  Future<LoginResponse?> refreshToken(RefreshTokenRequest request) async {
    final map = await apiUAAService.postM(request.toApi(), request.toMap());
    return LoginResponse.fromJson(map);
  }

  Future<BaseModel?> registerDeviceToken(RegisterDeviceTokenRequest request) async {
    final map = await apiUAAService.postM(request.toApi(), request.toMap(),
      appToken: StorageData.instance.getAppToken()
    );
    return BaseModel.fromJson(map);
  }

  Future<BaseModel?> unregisterDeviceToken(UnregisterDeviceTokenRequest request) async {
    final map = await apiUAAService.postM(request.toApi(), request.toMap(),
        appToken: StorageData.instance.getAppToken());
    return BaseModel.fromJson(map);
  }
}