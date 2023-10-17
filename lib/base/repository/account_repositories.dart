import 'package:vds/base/base_model.dart';
import 'package:vds/base/networking/api_service.dart';
import 'package:vds/base/request/forgot_password_request.dart';
import 'package:vds/base/request/logout.request.dart';
import 'package:vds/base/request/merchant_change_pass_request.dart';
import 'package:vds/base/request/merchant_change_pin_request.dart';
import 'package:vds/base/request/merchant_check_pin_request.dart';
import 'package:vds/base/request/merchant_detail_request.dart';
import 'package:vds/base/request/merchant_submit_new_pass_request.dart';
import 'package:vds/base/request/staff.change.request.dart';
import 'package:vds/model/check_pin_response.dart';
import 'package:vds/model/info.staff.model.dart';
import 'package:vds/model/merchant_detail_response.dart';

import '../../model/current.model.dart';
import '../../model/otp.model.dart';
import '../request/StaffDetailRequest.dart';
import '../request/current_request.dart';
import '../request/merchant_get_otp_request.dart';
import '../request/merchant_reset_pin_request.dart';

class AccountRepositories {
  Future<MerchantDetailResponse> merchantDetail(
      MerchantDetailRequest request) async {
    final map = await apiService.getM(request.toApi(), request.toMap());
    return MerchantDetailResponse.fromJson(map);
  }

  //thông tin staff
  Future<InfoStaff> staffDetail(StaffDetailRequest request) async {
    final map = await apiService.getM(request.toApi(), request.toMap());
    return InfoStaff.fromJson(map);
  }

  Future<BaseModel> merchantChangePass(
      MerchantChangePassRequest request) async {
    final map = await apiService.putM(request.toApi(), request.toMap());
    return BaseModel.fromJson(map);
  }

  Future<BaseModel> staffChangePass(StaffChangePassRequest request) async {
    final map = await apiService.putM(request.toApi(), request.toMap());
    return BaseModel.fromJson(map);
  }

  Future<BaseModel> merchantChangePIN(MerchantChangePINRequest request) async {
    final map = await apiService.putM(request.toApi(), request.toMap());
    return BaseModel.fromJson(map);
  }

  Future<BaseModel> merchantGetOTP(MerchantGetOTPRequest request,
      {String? appToken}) async {
    final map = await apiService.postM(request.toApi(), request.toMap(),
        appToken: appToken);
    return BaseModel.fromJson(map);
  }

  Future<CheckPinResponse> merchantCheckPIN(
      MerchantCheckPINRequest request, String? appToken) async {
    final map = await apiService.postM(request.toApi(), request.toMap(),
        appToken: appToken);
    return CheckPinResponse.fromJson(map);
  }

  Future<BaseModel> merchantRegisterPIN(MerchantResetPINRequest request,
      {String? appToken}) async {
    final map = await apiService.postM(request.toApi(), request.toMap(),
        appToken: appToken);
    return BaseModel.fromJson(map);
  }

  Future<BaseModel?> merchantForgotPassword(
      MerchantForgotPasswordRequest request) async {
    final map = await apiService.postM(request.toApi(), request.toMap());
    return BaseModel.fromJson(map);
  }

  Future<BaseModel?> merchantSubmitNewPass(
      MerchantSubmitNewPassRequest request) async {
    final map = await apiUALogin.postM(request.toApi(), request.toMap());
    return BaseModel.fromJson(map);
  }

  Future<BaseModel?> staffForgotPassword(
      StaffForgotPasswordRequest request) async {
    final map = await apiService.postM(request.toApi(), request.toMap());
    return BaseModel.fromJson(map);
  }

  Future<ResponseOtpModel> merchantGetOTPBank(MerchantGetOTPRequest request,
      {String? appToken}) async {
    final map = await apiService.postM(request.toApi(), request.toMap(),
        appToken: appToken);
    return ResponseOtpModel.fromJson(map);
  }

  Future<CurrentModel> currentMerchant(CurrentMerchantRequest request) async {
    final map = await apiService.getM(request.toApi(), request.toMap());
    return CurrentModel.fromJson(map);
  }

  Future<BaseModel> logOut(LogoutRequest request, String appToken) async {
    final map = await apiUALogin.getM(request.toApi(), request.toMap(),
        appToken: appToken);
    return BaseModel.fromJson(map);
  }
}
