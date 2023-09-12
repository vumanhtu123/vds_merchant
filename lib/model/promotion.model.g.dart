// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promotion.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Promotion _$PromotionFromJson(Map<String, dynamic> json) => Promotion(
      message: json['message'] as String?,
      traceId: json['traceId'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PromotionToJson(Promotion instance) => <String, dynamic>{
      'message': instance.message,
      'traceId': instance.traceId,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      content: (json['content'] as List<dynamic>?)
          ?.map((e) => Content.fromJson(e as Map<String, dynamic>))
          .toList(),
      page: json['page'] as int?,
      size: json['size'] as int?,
      sort: json['sort'] as String?,
      totalElements: json['totalElements'] as int?,
      totalPages: json['totalPages'] as int?,
      numberOfElements: json['numberOfElements'] as int?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'content': instance.content,
      'page': instance.page,
      'size': instance.size,
      'sort': instance.sort,
      'totalElements': instance.totalElements,
      'totalPages': instance.totalPages,
      'numberOfElements': instance.numberOfElements,
    };

Content _$ContentFromJson(Map<String, dynamic> json) => Content(
      campaignId: json['campaignId'] as int?,
      name: json['name'] as String?,
      thumbnailImg: json['thumbnailImg'] as String?,
      bannerImage: json['bannerImage'] as String?,
      isValidUser: json['isValidUser'] as bool?,
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
    );

Map<String, dynamic> _$ContentToJson(Content instance) => <String, dynamic>{
      'campaignId': instance.campaignId,
      'name': instance.name,
      'thumbnailImg': instance.thumbnailImg,
      'bannerImage': instance.bannerImage,
      'isValidUser': instance.isValidUser,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
    };
