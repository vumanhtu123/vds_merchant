import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vds/helper/convert.dart';


@JsonSerializable()
class NotificationModel {
  String? message;
  String? traceId;
  Data? data;

  NotificationModel({this.message, this.traceId, this.data});

  NotificationModel.fromJson(Map<String, dynamic> json) {
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
  bool? last;
  int? totalPages;
  int? totalElements;
  bool? first;
  int? number;
  int? numberOfElements;
  int? size;
  bool? empty;

  Data({this.content, this.last, this.totalPages, this.totalElements, this.first, this.number, this.numberOfElements, this.size, this.empty});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['content'] != null) {
      content = <Content>[];
      json['content'].forEach((v) { content!.add(Content.fromJson(v)); });
    }
    last = json['last'];
    totalPages = json['totalPages'];
    totalElements = json['totalElements'];
    first = json['first'];
    number = json['number'];
    numberOfElements = json['numberOfElements'];
    size = json['size'];
    empty = json['empty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (content != null) {
      data['content'] = content!.map((v) => v.toJson()).toList();
    }
    data['last'] = last;
    data['totalPages'] = totalPages;
    data['totalElements'] = totalElements;
    data['first'] = first;
    data['number'] = number;
    data['numberOfElements'] = numberOfElements;
    data['size'] = size;
    data['empty'] = empty;
    return data;
  }
}

@JsonSerializable()
class Content {
  int? id;
  String? title;
  String? content;
  String? image;
  String? url;
  String? type;
  bool? isRead;
  String? createAt;
  @JsonKey(ignore: true)
  late ValueNotifier<bool> isSeenNotifier;

  Content(
      {this.id,
      this.title,
      this.content,
      this.image,
      this.url,
      this.type,
      this.createAt,
      this.isRead});

  Content.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    image = json['image'];
    url = json['url'];
    type = json['type'];
    isRead = json['isRead'];
    createAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['content'] = content;
    data['image'] = image;
    data['url'] = url;
    data['type'] = type;
    data['isRead'] = isRead;
    data['createdAt'] = createAt;
    return data;
  }

  DateTime? get createTime =>
      Convert.stringToDate(createAt ?? '', pattern: 'HH:mm:ss dd/MM/yyyy');

  String get timeString => _timeString();

  String _timeString() {
    if (createTime == null) {
      return '';
    }
    var currentTime = DateTime.now();
    var difference = currentTime.difference(createTime!);
    if (difference.inSeconds < 60) {
      return 'Vừa xong';
    }
    if (difference.inSeconds < 600) {
      return '${difference.inMinutes.toString().padLeft(2, '0')} phút trước';
    }
    if (difference.inSeconds < 60 * 60 * 24) {
      return '${difference.inHours.toString().padLeft(2, '0')} giờ trước';
    }
    return createAt ?? '';
  }
}
