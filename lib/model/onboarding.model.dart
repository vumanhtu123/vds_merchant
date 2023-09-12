import 'package:json_annotation/json_annotation.dart';

part 'onboarding.model.g.dart';

@JsonSerializable()
class OnboardingModel {
  final String? title;
  final String? description;
  final String? image;

  OnboardingModel({this.title, this.description, this.image});

  factory OnboardingModel.fromJson(Map<String, dynamic> json) =>
      _$OnboardingModelFromJson(json);

  Map<String, dynamic> toJson() => _$OnboardingModelToJson(this);
}
