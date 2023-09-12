import 'package:json_annotation/json_annotation.dart';
part 'customer.model.g.dart';

@JsonSerializable()
class CustomerModel {
  final String? id;
  final String? name;

  CustomerModel({
    this.id,
    this.name,
  });

  factory CustomerModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerModelFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerModelToJson(this);
}
