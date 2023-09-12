// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transition.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransitionModel _$TransitionModelFromJson(Map<String, dynamic> json) =>
    TransitionModel(
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TransitionModelToJson(TransitionModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      content: (json['content'] as List<dynamic>?)
          ?.map((e) => Content.fromJson(e as Map<String, dynamic>))
          .toList(),
      last: json['last'] as bool?,
      totalPages: json['totalPages'] as int?,
      totalElements: json['totalElements'] as int?,
      size: json['size'] as int?,
      number: json['number'] as int?,
      first: json['first'] as bool?,
      numberOfElements: json['numberOfElements'] as int?,
      empty: json['empty'] as bool?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'content': instance.content,
      'last': instance.last,
      'totalPages': instance.totalPages,
      'totalElements': instance.totalElements,
      'size': instance.size,
      'number': instance.number,
      'first': instance.first,
      'numberOfElements': instance.numberOfElements,
      'empty': instance.empty,
    };
