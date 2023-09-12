// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details.promotion.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PromotionDetails _$PromotionDetailsFromJson(Map<String, dynamic> json) =>
    PromotionDetails(
      message: json['message'] as String?,
      traceId: json['traceId'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PromotionDetailsToJson(PromotionDetails instance) =>
    <String, dynamic>{
      'message': instance.message,
      'traceId': instance.traceId,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as int?,
      thumbnailImage: json['thumbnailImage'] as String?,
      bannerImage: json['bannerImage'] as String?,
      title: json['title'] as String?,
      content: json['content'] as String?,
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
      forms: (json['forms'] as List<dynamic>?)
          ?.map((e) => Forms.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'thumbnailImage': instance.thumbnailImage,
      'bannerImage': instance.bannerImage,
      'title': instance.title,
      'content': instance.content,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'forms': instance.forms,
    };

Forms _$FormsFromJson(Map<String, dynamic> json) => Forms(
      promotionBy: json['promotionBy'] as String?,
      promotionType: json['promotionType'] as String?,
      conditions: (json['conditions'] as List<dynamic>?)
          ?.map((e) => Conditions.fromJson(e as Map<String, dynamic>?))
          .toList(),
    );

Map<String, dynamic> _$FormsToJson(Forms instance) => <String, dynamic>{
      'promotionBy': instance.promotionBy,
      'promotionType': instance.promotionType,
      'conditions': instance.conditions,
    };

Conditions _$ConditionsFromJson(Map<String, dynamic> json) => Conditions(
      id: json['id'] as int?,
      totalBillFrom: (json['totalBillFrom'] as num?)?.toDouble(),
      totalBillTo: (json['totalBillTo'] as num?)?.toDouble(),
      currencyAlias: json['currencyAlias'] as String?,
      currencyData: json['currencyData'] == null
          ? null
          : CurrencyData.fromJson(
              json['currencyData'] as Map<String, dynamic>?),
      isPercentDiscount: json['isPercentDiscount'] as bool?,
      isLimitAmountDiscountMax: json['isLimitAmountDiscountMax'] as bool?,
      amountLimitDiscount: (json['amountLimitDiscount'] as num?)?.toDouble(),
      serviceAlias: json['serviceAlias'] as String?,
      serviceData: json['serviceData'] as String?,
      amountDiscount: (json['amountDiscount'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ConditionsToJson(Conditions instance) =>
    <String, dynamic>{
      'id': instance.id,
      'totalBillFrom': instance.totalBillFrom,
      'totalBillTo': instance.totalBillTo,
      'currencyAlias': instance.currencyAlias,
      'currencyData': instance.currencyData,
      'isPercentDiscount': instance.isPercentDiscount,
      'isLimitAmountDiscountMax': instance.isLimitAmountDiscountMax,
      'amountLimitDiscount': instance.amountLimitDiscount,
      'serviceAlias': instance.serviceAlias,
      'serviceData': instance.serviceData,
      'amountDiscount': instance.amountDiscount,
    };

CurrencyData _$CurrencyDataFromJson(Map<String, dynamic> json) => CurrencyData(
      symbol: json['symbol'] as String?,
      fullName: json['fullName'] as String?,
      currencyMin: json['currencyMin'] as String?,
      name: json['name'] as String?,
      alias: json['alias'] as String?,
      rounding: json['rounding'] as int?,
      id: json['id'] as int?,
      position: json['position'] as String?,
      isMainCurrency: json['isMainCurrency'] as bool?,
      decimalPlaces: json['decimalPlaces'] as int?,
    );

Map<String, dynamic> _$CurrencyDataToJson(CurrencyData instance) =>
    <String, dynamic>{
      'symbol': instance.symbol,
      'fullName': instance.fullName,
      'currencyMin': instance.currencyMin,
      'name': instance.name,
      'alias': instance.alias,
      'rounding': instance.rounding,
      'id': instance.id,
      'position': instance.position,
      'isMainCurrency': instance.isMainCurrency,
      'decimalPlaces': instance.decimalPlaces,
    };
