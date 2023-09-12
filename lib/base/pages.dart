import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vds/app/account/changepass/change.pass.controller.dart';
import 'package:vds/app/account/changepass/change.pass.page.dart';
import 'package:vds/app/account/changepass/change.pass.staff.controller.dart';
import 'package:vds/app/account/changepass/change.pass.staff.page.dart';
import 'package:vds/app/account/info/infostaff/staff.info.controller.dart';
import 'package:vds/app/account/info/infostaff/staff.info.page.dart';
import 'package:vds/app/account/qraccount/qr.account.controller.dart';
import 'package:vds/app/account/qraccount/qr.account.page.dart';
import 'package:vds/app/account/qraccount/qr.staff.controller.dart';
import 'package:vds/app/account/qraccount/qr.staff.page.dart';
import 'package:vds/app/account/resetpin/reset.pin.controller.dart';
import 'package:vds/app/account/resetpin/reset.pin.page.dart';
import 'package:vds/app/account/resetpin/reset_pin_otp_controller.dart';
import 'package:vds/app/account/resetpin/reset_pin_otp_page.dart';
import 'package:vds/app/detail_promotion/details.promotion.binding.dart';
import 'package:vds/app/details_transactions/details.payment.controller.dart';
import 'package:vds/app/forgot_pass/merchant/new_password/new.pass.forgot.controller.dart';
import 'package:vds/app/forgot_pass/merchant/new_password/new.pass.forgot.page.dart';
import 'package:vds/app/forgot_pass/staff/new_password/staff.new.pass.forgot.controller.dart';
import 'package:vds/app/forgot_pass/staff/new_password/staff.new.pass.forgot.page.dart';
import 'package:vds/app/forgot_pass/staff/staff.forgot.pass.controller.dart';
import 'package:vds/app/forgot_pass/staff/staff.forgot.pass.page.dart';
import 'package:vds/app/forgot_pin/changepinwhenforgot/new.pin.forgot.controller.dart';
import 'package:vds/app/forgot_pin/changepinwhenforgot/new.pin.forgot.page.dart';
import 'package:vds/app/forgot_pass/merchant/forgot.pass.controller.dart';
import 'package:vds/app/forgot_pass/merchant/forgot.pass.page.dart';
import 'package:vds/app/login/login.controller.dart';
import 'package:vds/app/mainapp/main.app.controller.dart';
import 'package:vds/app/newpin/new.pin.controller.dart';
import 'package:vds/app/newpin/new.pin.page.dart';
import 'package:vds/app/newpin/newpinreset/new.pin.reset.controller.dart';
import 'package:vds/app/newpin/newpinreset/new.pin.reset.page.dart';
import 'package:vds/app/login/login.page.dart';
import 'package:vds/app/mainapp/main.app.dart';
import 'package:vds/app/order_create/create.order.controller.dart';
import 'package:vds/app/order_create/create.order.page.dart';
import 'package:vds/app/order_create_QR/create.order.qr.controller.dart';
import 'package:vds/app/order_create_QR/create.order.qr.page.dart';
import 'package:vds/app/order_create_success/create.order.success.controller.dart';
import 'package:vds/app/order_create_success/create.order.success.page.dart';
import 'package:vds/app/order_history/order.history.controller.dart';
import 'package:vds/app/order_history/order.history.page.dart';
import 'package:vds/app/order_history/staff.order.history.page.dart';
import 'package:vds/app/promotion/promotion.page.dart';
import 'package:vds/app/revoke_money/accept/revoke.money.accept.controller.dart';
import 'package:vds/app/revoke_money/accept/revoke.money.accept.page.dart';
import 'package:vds/app/revoke_money/revoke.money.controller.dart';
import 'package:vds/app/revoke_money/revoke.money.page.dart';
import 'package:vds/app/revoke_money/success/revoke.money.success.controller.dart';
import 'package:vds/app/revoke_money/success/revoke.money.success.page.dart';
import 'package:vds/app/revoke_money_ho/accept/revoke.money.ho.accept.controller.dart';
import 'package:vds/app/revoke_money_ho/accept/revoke.money.ho.accept.page.dart';
import 'package:vds/app/revoke_money_ho/revoke.money.ho.controller.dart';
import 'package:vds/app/revoke_money_ho/revoke.money.ho.page.dart';
import 'package:vds/app/revoke_money_ho/success/revoke.money.ho.success.controller.dart';
import 'package:vds/app/revoke_money_ho/success/revoke.money.ho.success.page.dart';
import 'package:vds/app/splash/splash_page.dart';
import 'package:vds/app/welcomepage/onboarding/onboarding.controller.dart';
import 'package:vds/app/welcomepage/onboarding/onboarding.page.dart';
import '../app/account/info/infomerchant/info.merchant.controller.dart';
import '../app/account/info/infomerchant/info.merchant.page.dart';
import '../app/detail_promotion/details.promotion.page.dart';
import '../app/details_transactions/details.payment.page.dart';
import '../app/promotion/promotion.binding.dart';
import 'routes.dart';

List<GetPage> getPages = [
  GetPage(
    name: Routes.initial,
    page: () => Container(),
  ),
  GetPage(
    name: Routes.splash,
    page: () => const SplashPage(),
  ),
  GetPage(
    name: Routes.mainApp,
    page: () => const MainAppPage(),
    binding: MainAppBinding(),
  ),
  GetPage(
    name: Routes.merchantResetPinOTP,
    page: () => const MerchantResetPinOTPPage(),
    binding: MerchantResetPinOTPBinding(),
  ),
  GetPage(
    name: Routes.login,
    page: () => const LoginPage(),
    binding: LoginBinding(),
  ),
  GetPage(
    name: Routes.merchantResetPin,
    page: () => const MerchantResetPinPage(),
    binding: MerchantResetPinBinding(),
  ),
  GetPage(
    name: Routes.onboarding,
    page: () => const OnBoardingPage(),
    binding: OnBoardingBinding(),
  ),
  GetPage(
    name: Routes.merchantForgotPassword,
    page: () => const ForgotPasswordPage(),
    binding: ForgotPasswordBinding(),
  ),
  GetPage(
    name: Routes.staffForgotPassword,
    page: () => const StaffForgotPasswordPage(),
    binding: StaffForgotPasswordBinding(),
  ),
  GetPage(
    name: Routes.newPinWhenFogot,
    page: () => const NewPinWhenForgotPage(),
    binding: NewPinWhenForgotBinding(),
  ),
  GetPage(
    name: Routes.staffNewPassWhenForgot,
    page: () => const StaffNewPassWhenForgotPage(),
    binding: StaffNewPassWhenForgotBinding(),
  ),
  GetPage(
    name: Routes.setupNewPin,
    page: () => const SetupNewPinPage(),
    binding: SetupNewPinBinding(),
  ),
  GetPage(
    name: Routes.newPinReset,
    page: () => const NewPinResetPage(),
    binding: NewPinResetBinding(),
  ),
  GetPage(
    name: Routes.infoMerchant,
    page: () => const InfoMerchantPage(),
    binding: InfoMerchantBinding(),
  ),
  GetPage(
    name: Routes.infoStaff,
    page: () => const InfoStaffPage(),
    binding: InfoStaffBinding(),
  ),
  GetPage(
    name: Routes.changePass,
    page: () => const ChangePassPage(),
    binding: ChangePassBinding(),
  ),
  GetPage(
    name: Routes.changePassStaff,
    page: () => const ChangePassStaffPage(),
    binding: ChangePassStaffBinding(),
  ),
  GetPage(
    name: Routes.qrAccount,
    page: () => const QrAccountPage(),
    binding: QrAccountBinding(),
  ),
  GetPage(
    name: Routes.qrStaff,
    page: () => const QrAccountStaffPage(),
    binding: QrAccountStaffBinding(),
  ),
  GetPage(
    name: Routes.creatOrder,
    page: () => const CreateOrderPage(),
    binding: CreateOrderBinding(),
  ),
  GetPage(
    name: Routes.newPassWhenForgot,
    page: () => const NewPassWhenForgotPage(),
    binding: NewPassWhenForgotBinding(),
  ),
  GetPage(
    name: Routes.creatOrderQR,
    page: () => const CreateOrderQRPage(),
    binding: CreateOrderQRBinding(),
  ),
  GetPage(
    name: Routes.orderSuccess,
    page: () => const CreateOrderSuccessPage(),
    binding: CreateOrderSuccessBinding(),
  ),
  GetPage(
    name: Routes.historyOrder,
    page: () => const OrderHistoryPage(),
    binding: OrderHistoryBinding(),
  ),
  GetPage(
    name: Routes.staffHistoryOrder,
    page: () => const StaffOrderHistoryPage(),
    binding: OrderHistoryBinding(),
  ),
  GetPage(
    name: Routes.sale,
    page: () => const PromotionPage(),
    binding: PromotionBinding(),
  ),
  GetPage(
    name: Routes.revokeMoneyHO,
    page: () => const RevokeMoneyHOPage(),
    binding: RevokeMoneyHOBinding(),
  ),
  GetPage(
    name: Routes.acceptRevokeHO,
    page: () => const RevokeMoneyHOAcceptPage(),
    binding: RevokeMoneyHOAcceptBinding(),
  ),
  GetPage(
    name: Routes.successRevokeHO,
    page: () => const RevokeMoneyHOSuccessPage(),
    binding: RevokeMoneyHOSuccessBinding(),
  ),
  GetPage(
    name: Routes.revokeMoney,
    page: () => const RevokeMoneyPage(),
    binding: RevokeMoneyBinding(),
  ),
  GetPage(
    name: Routes.acceptRevoke,
    page: () => const RevokeMoneyAcceptPage(),
    binding: RevokeMoneyAcceptBinding(),
  ),
  GetPage(
    name: Routes.successRevoke,
    page: () => const RevokeMoneySuccessPage(),
    binding: RevokeMoneySuccessBinding(),
  ),
  GetPage(
    name: Routes.detailsPromotion,
    page: () => const DetailsPromotionPage(),
    binding: DetailsPromotionBinding(),
  ),
  GetPage(
    name: Routes.detailsPayment,
    page: () => const DetailsPaymentPage(),
    binding: DetailsPaymentBinding(),
  ),
];
