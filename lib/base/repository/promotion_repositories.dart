import 'package:vds/common/api_const.dart';
import 'package:vds/model/details.promotion.model.dart';
import 'package:vds/model/promotion.model.dart';

import '../networking/api_service.dart';
import '../request/promotion_request.dart';

class PromotionRepositories {
  Future<Promotion> merchantPromotion(PromotionRequest request) async {
    final map = await apiService.getM(request.toApi(), request.toMap());
    return Promotion.fromJson(map);
  }

  Future<PromotionDetails> merchantDetailsPromotion(int id) async {
    final map = await apiService.getMer(ApiConst.detailCampaignPromotion + id.toString());
    return PromotionDetails.fromJson(map);
  }

  // Future<Forms> merchantDetailsCon(int id) async {
  //   final map = await apiPromotion.getMer(ApiConst.detailCampaignPromotion + id.toString());
  //   return Forms.fromJson(map);
  // }
  //
  // Future<Forms> merchantDetailForms(int id) async {
  //   final map = await apiPromotion.getMer(ApiConst.detailCampaignPromotion + id.toString());
  //   return Forms.fromJson(map);
  // }
}
