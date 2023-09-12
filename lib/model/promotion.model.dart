import 'package:json_annotation/json_annotation.dart';
part 'promotion.model.g.dart';

@JsonSerializable()
class Promotion {
  String? message;
  String? traceId;
  Data? data;

  Promotion({this.message, this.traceId, this.data});

  Promotion.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    traceId = json['traceId'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['traceId'] = traceId;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

@JsonSerializable()
class Data {
  List<Content>? content;
  int? page;
  int? size;
  String? sort;
  int? totalElements;
  int? totalPages;
  int? numberOfElements;

  Data(
      {this.content,
        this.page,
        this.size,
        this.sort,
        this.totalElements,
        this.totalPages,
        this.numberOfElements});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['content'] != null) {
      content = <Content>[];
      json['content'].forEach((v) {
        content!.add(Content.fromJson(v));
      });
    }
    page = json['page'];
    size = json['size'];
    sort = json['sort'];
    totalElements = json['totalElements'];
    totalPages = json['totalPages'];
    numberOfElements = json['numberOfElements'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (content != null) {
      data['content'] = content!.map((v) => v.toJson()).toList();
    }
    data['page'] = page;
    data['size'] = size;
    data['sort'] = sort;
    data['totalElements'] = totalElements;
    data['totalPages'] = totalPages;
    data['numberOfElements'] = numberOfElements;
    return data;
  }
}

@JsonSerializable()
class Content {
  int? campaignId;
  String? name;
  String? thumbnailImg;
  String? bannerImage;
  bool? isValidUser;
  String? startDate;
  String? endDate;

  Content(
      {this.campaignId,
        this.name,
        this.thumbnailImg,
        this.bannerImage,
        this.isValidUser,
        this.startDate,
        this.endDate});

  Content.fromJson(Map<String, dynamic> json) {
    campaignId = json['campaign_id'];
    name = json['name'];
    thumbnailImg = json['thumbnail_img'];
    bannerImage = json['banner_image'];
    isValidUser = json['is_valid_user'];
    startDate = json['start_date'];
    endDate = json['end_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['campaign_id'] = campaignId;
    data['name'] = name;
    data['thumbnail_img'] = thumbnailImg;
    data['banner_image'] = bannerImage;
    data['is_valid_user'] = isValidUser;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    return data;
  }
}

