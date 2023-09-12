import 'dart:ui';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'withdraw.money.model.g.dart';

@JsonSerializable()
class WithdrawModel {
  String? message;
  String? traceId;
  Data? data;

  WithdrawModel({this.message, this.traceId, this.data});

  WithdrawModel.fromJson(Map<String, dynamic> json) {
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
  List<Contents>? content;
  Pageable? pageable;
  bool? last;
  int? totalElements;
  int? totalPages;
  bool? first;
  Sort? sort;
  int? size;
  int? number;
  int? numberOfElements;
  bool? empty;

  Data(
      {this.content,
      this.pageable,
      this.last,
      this.totalElements,
      this.totalPages,
      this.first,
      this.sort,
      this.size,
      this.number,
      this.numberOfElements,
      this.empty});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['content'] != null) {
      content = <Contents>[];
      json['content'].forEach((v) {
        content!.add(Contents.fromJson(v));
      });
    }
    pageable =
        json['pageable'] != null ? Pageable.fromJson(json['pageable']) : null;
    last = json['last'];
    totalElements = json['totalElements'];
    totalPages = json['totalPages'];
    first = json['first'];
    sort = json['sort'] != null ? Sort.fromJson(json['sort']) : null;
    size = json['size'];
    number = json['number'];
    numberOfElements = json['numberOfElements'];
    empty = json['empty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (content != null) {
      data['content'] = content!.map((v) => v.toJson()).toList();
    }
    if (pageable != null) {
      data['pageable'] = pageable!.toJson();
    }
    data['last'] = last;
    data['totalElements'] = totalElements;
    data['totalPages'] = totalPages;
    data['first'] = first;
    if (sort != null) {
      data['sort'] = sort!.toJson();
    }
    data['size'] = size;
    data['number'] = number;
    data['numberOfElements'] = numberOfElements;
    data['empty'] = empty;
    return data;
  }
}

@JsonSerializable()
class Contents {
  String? transactionId;
  String? status;
  String? dateTime;
  num? amount;
  String? type;
  String? currency;

  Contents(
      {this.transactionId,
      this.status,
      this.dateTime,
      this.amount,
      this.type,
      this.currency});

  String get priceText => _priceText();

  String _priceText() {
    if (amount == null) return '';
    var formatter = NumberFormat('###,###,000');
    return formatter.format(amount).replaceAll(',', '.');
  }

  StatusTransition? get statusTransition => StatusTransition.values
      .firstWhereOrNull((element) => element.name == status);

  bool isTransitionSuccess() => status == StatusTransition.SUCCESS.text;

  Contents.fromJson(Map<String, dynamic> json) {
    transactionId = json['transactionId'];
    status = json['status'];
    dateTime = json['dateTime'];
    amount = json['amount'];
    type = json['type'];
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['transactionId'] = transactionId;
    data['status'] = status;
    data['dateTime'] = dateTime;
    data['amount'] = amount;
    data['type'] = type;
    data['currency'] = currency;
    return data;
  }
}

@JsonSerializable()
class Pageable {
  Sort? sort;
  int? pageNumber;
  int? pageSize;
  int? offset;
  bool? paged;
  bool? unpaged;

  Pageable(
      {this.sort,
      this.pageNumber,
      this.pageSize,
      this.offset,
      this.paged,
      this.unpaged});

  Pageable.fromJson(Map<String, dynamic> json) {
    sort = json['sort'] != null ? Sort.fromJson(json['sort']) : null;
    pageNumber = json['pageNumber'];
    pageSize = json['pageSize'];
    offset = json['offset'];
    paged = json['paged'];
    unpaged = json['unpaged'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (sort != null) {
      data['sort'] = sort!.toJson();
    }
    data['pageNumber'] = pageNumber;
    data['pageSize'] = pageSize;
    data['offset'] = offset;
    data['paged'] = paged;
    data['unpaged'] = unpaged;
    return data;
  }
}

@JsonSerializable()
class Sort {
  bool? sorted;
  bool? empty;
  bool? unsorted;

  Sort({this.sorted, this.empty, this.unsorted});

  Sort.fromJson(Map<String, dynamic> json) {
    sorted = json['sorted'];
    empty = json['empty'];
    unsorted = json['unsorted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sorted'] = sorted;
    data['empty'] = empty;
    data['unsorted'] = unsorted;
    return data;
  }
}

enum StatusTransition {
  PENDING_REVIEW,
  PENDING_APPROVE,
  APPROVED,
  REJECTED,
  SUCCESS,
  FAILED
}

extension StatusTransitionExtension on StatusTransition {
  String get text => _text();

  String _text() {
    switch (this) {
      case StatusTransition.SUCCESS:
        return 'Thành công'.tr;
      case StatusTransition.FAILED:
        return 'Không thành công'.tr;
      case StatusTransition.PENDING_REVIEW:
        return 'Pending review'.tr;
      case StatusTransition.PENDING_APPROVE:
        return 'Pending approve'.tr;
      case StatusTransition.APPROVED:
        return 'Approve'.tr;
      case StatusTransition.REJECTED:
        return 'Rejected'.tr;
      default:
        return 'Không thành công'.tr;
    }
  }

  Color get color => _color();

  Color _color() {
    switch (this) {
      case StatusTransition.SUCCESS:
        return const Color(0xFF00A400);
      case StatusTransition.FAILED:
        return const Color(0xFFFF3B30);
      case StatusTransition.PENDING_REVIEW:
        return const Color(0xFFF89E19);
      case StatusTransition.REJECTED:
        return const Color(0xFFFF3B30);
      case StatusTransition.APPROVED:
        return const Color(0xFF00CC6A);
      case StatusTransition.PENDING_APPROVE:
        return const Color(0xFFF89E19);
    }
  }
}
