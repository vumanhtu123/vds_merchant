import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:vds/base/base_controller.dart';
import 'package:vds/helper/convert.dart';
import 'package:vds/model/details.promotion.model.dart';
import '../../widget/my.scroll.controller.dart';

class DetailsPromotionController extends BaseController {
  final Rx<Data> detailsPromotion = Data().obs;
  MyScrollController? scrollController;
  int? idOrder;

  @override
  void onInit() {
    idOrder = Get.arguments is int ? Get.arguments : 0;
    scrollController = MyScrollController(_loadMore);
    merchantDetailsPromo();
    super.onInit();
  }

  void _loadMore() async {}

  merchantDetailsPromo() async {
    await merchantDetailsPromotion(idOrder ?? 0).then((value) async {
      detailsPromotion.value = value.data!;
    }).catchError((error) {
      debugPrint('$error');
    }).whenComplete(() {});
  }

  List<Forms> getForms() {
    return detailsPromotion.value.forms ?? [];
  }

  String convertStartDate() {
    return Convert.stringToDatePromotion(
      detailsPromotion.value.startDate ?? "",
    );
  }

  String convertEndDate() {
    return Convert.stringToDatePromotion(
      detailsPromotion.value.endDate ?? "",
    );
  }
}
