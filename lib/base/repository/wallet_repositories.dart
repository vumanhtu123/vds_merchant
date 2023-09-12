import 'package:vds/base/base_model.dart';
import 'package:vds/base/networking/api_service.dart';
import 'package:vds/base/request/merchant_balance_request.dart';
import 'package:vds/base/request/merchant_pin_verify_request.dart';
import 'package:vds/base/request/merchant_wallet_policy_request.dart';
import 'package:vds/base/request/merchant_withdraw_fee_request.dart';
import 'package:vds/base/request/merchant_withdrawal_bank_request.dart';
import 'package:vds/base/request/merchant_withdrawal_ho_request.dart';
import 'package:vds/model/merchant_balance_response.dart';
import 'package:vds/model/merchant_withdrawal_fee_response.dart';
import 'package:vds/model/wallet_policy_response.dart';

import '../../model/info.revoke.success.model.dart';

class WalletRepositories {

  Future<MerchantBalanceResponse> merchantBalance(MerchantBalanceRequest request) async {
    final map = await apiService.getM(request.toApi(), request.toMap());
    return MerchantBalanceResponse.fromJson(map);
  }

  Future<MerchantWithdrawalFeeResponse> merchantWithdrawFee(MerchantWithdrawFeeRequest request) async {
    final map = await apiService.postM(request.toApi(), request.toMap());
    return MerchantWithdrawalFeeResponse.fromJson(map);
  }

  Future<BaseModel> merchantPINVerify(MerchantPINVerifyRequest request) async {
    final map = await apiService.postM(request.toApi(), request.toMap());
    return BaseModel.fromJson(map);
  }

  Future<BankInfoSuccess> merchantWithdrawalHO(MerchantWithdrawalHORequest request) async {
    final map = await apiService.postM(request.toApi(), request.toMap());
    return BankInfoSuccess.fromJson(map);
  }

  Future<BankInfoSuccess> merchantWithdrawalBank(MerchantWithdrawalBankRequest request) async {
    final map = await apiService.postM(request.toApi(), request.toMap());
    return BankInfoSuccess.fromJson(map);
  }

  Future<WalletPolicyResponse> merchantWalletPolicy(MerchantWalletPolicyRequest request) async {
    final map = await apiService.getM(request.toApi(), request.toMap());
    return WalletPolicyResponse.fromJson(map);
  }
}