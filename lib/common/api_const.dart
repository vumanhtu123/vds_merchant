class ApiConst {
  // static String mainUrl = "http://125.234.172.12:8382/gateway/services/";
  static String mainUrl = "https://mosanapitest.telemor.tl:8080/gateway/services/";
  static String mainUAAUrl = "https://mosanapitest.telemor.tl:8080/gateway/";
  static String mainUA = "https://mosanapitest.telemor.tl:8080/gateway/";
  // static String mainUAAUrl = "http://125.234.172.12:8382/gateway/";
  // static String mainUA = "http://125.234.172.12:8382/gateway/";

  static String logins =
      "services/merchant-service/public-api/mobile/oauth/login";
  static String login = "oauth/login";
  static String registerDeviceToken =
      "services/notification-service/api/v1/notification/register";
  static String unregisterDeviceToken =
      "services/notification-service/api/v1/notification/unregister";

  static String merchantTransactions =
      "merchant-service/merchant-service/mobile/merchant/public/api/v1/transactions";
  static String merchantOrder =
      "merchant-service/merchant-service/mobile/merchant/public/api/v1/orders";
  static String merchantInfoMerchant =
      "merchant-service/merchant-service/mobile/merchant/public/api/v1/merchants/merchant";

  static String merchantTransactionsDetails(String? id) {
    return "merchant-service/merchant-service/mobile/merchant/public/api/v1/transactions/$id";
  }

  static String merchantTransactionsWithdraw =
      "merchant-service/merchant-service/mobile/merchant/public/api/v1/transactions/withdrawal";

  static String merchantDetail =
      "merchant-service/merchant-service/mobile/merchant/public/api/v1/merchants/merchant";
  static String merchantOrderDetails =
      "merchant-service/merchant-service/mobile/merchant/public/api/v1/orders/";

  static String invoice(String? id) {
    return "merchant-service/merchant-service/mobile/merchant/public/api/v1/orders/$id/invoice";
  }

  //Wallet
  static String merchantWithdrawalHO =
      "merchant-service/merchant-service/mobile/merchant/public/api/v1/wallets/withdrawal/ho";
  static String merchantWithdrawalBank =
      "merchant-service/merchant-service/mobile/merchant/public/api/v1/wallets/withdrawal/bank";
  static String merchantPinVerify =
      "merchant-service/merchant-service/mobile/merchant/public/api/v1/wallets/pin/verify";
  static String merchantOTP =
      "merchant-service/merchant-service/mobile/merchant/public/api/v1/wallets/otp";
  static String merchantWithdrawalFee =
      "merchant-service/merchant-service/mobile/merchant/public/api/v1/wallets/fee";
  static String merchantAccountBalance =
      "merchant-service/merchant-service/mobile/merchant/public/api/v1/wallets/balance";
  static String merchantWalletPolicy =
      "merchant-service/merchant-service/mobile/merchant/public/api/v1/wallets/policy";

  //Account
  static String staffChangePass =
      "merchant-service/merchant-service/mobile/merchant/"
      "public/api/v1/staffs/change-password";
  static String merchantChangePass =
      "merchant-service/merchant-service/mobile/merchant/"
      "public/api/v1/root-accounts/change-password";

  // static String merchantResetPin = "merchant-service/merchant-service/mobile/merchant/"
  //     "public/api/v1/root-accounts/reset-pin";
  static String merchantChangePin =
      "merchant-service/merchant-service/mobile/merchant/public/api/v1/root-accounts/pin";
  static String merchantForgotPassword =
      "merchant-service/public-api/mobile/merchant/v1/merchant/forgot-password";
  static String merchantCheckPin =
      "merchant-service/merchant-service/mobile/merchant/"
      "public/api/v1/merchants/check-pin";
  static String merchantSubmitNewPass =
      "services/merchant-service/public-api/mobile/merchant/v1/submit-password";
  static String merchantRegisterPin =
      "merchant-service/merchant-service/mobile/merchant/public/api/v1/merchants/register-pin";

  //Staff
  static String staffForgotPassword =
      "merchant-service/public-api/mobile/merchant/v1/staffs/forgot-password";
  static String merchantTransactionsStaff =
      "merchant-service/merchant-service/mobile/merchant/public/api/v1/staffs/transactions";
  static String infoStaff =
      "merchant-service/merchant-service/mobile/merchant/public/api/v1/staffs/staff";
  static String changePassStaff =
      "merchant-service/merchant-service/mobile/merchant/public/api/v1/staffs/change-password";

  //Promotion
  static String campaignPromotion() {
    return "promotion-service/api/v1/mobile/campaign-promotion/merchants";
  }

  static String detailCampaignPromotion =
      "promotion-service/api/v1/mobile/campaign-promotion/";
  static String idMerchant =
      "merchant-service/merchant-service/mobile/merchant/public/api/v1/merchants/current";

  //Noti
  static String notification = "notification-service/api/v1/notification/users";
  static String notifyCount =
      "notification-service/api/v1/notification/users/counters";

  static int size = 20;
}
