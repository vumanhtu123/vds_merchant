// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OnboardingModel _$OnboardingModelFromJson(Map<String, dynamic> json) =>
    OnboardingModel(
      title: json['title'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$OnboardingModelToJson(OnboardingModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'image': instance.image,
    };
