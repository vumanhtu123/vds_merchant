import 'package:get/get.dart';

enum MerAppState { loading, success, failed, empty }

enum CategoryEnum {
  createOrder,
  historyOrder,
  revokeMoneyHO,
  revokeMoney,
  sale,
}

enum ForgetPassTypeEnum {
  TYPE,
  BI_CARD,
  ELECTORAL_CARD,
  PASSPORT,
}

extension ForgetPassTypeExtension on ForgetPassTypeEnum {
  String get text => _text();

  String _text() {
    switch (this) {
      // case ForgetPassTypeEnum.TYPE:
      //   return 'Type';
      case ForgetPassTypeEnum.BI_CARD:
        return 'BI Card'.tr;
      case ForgetPassTypeEnum.ELECTORAL_CARD:
        return 'Electoral Card';
      case ForgetPassTypeEnum.PASSPORT:
        return 'Passport'.tr;
      default: return "";
    }
  }
}
