import 'package:barcode/barcode.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'transition.model.g.dart';

@JsonSerializable()
class TransitionModel {
  String? message;
  Data? data;

  TransitionModel({this.message, this.data});

  TransitionModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (this.data != null) {
      // data['data'] = this.data!.toJson();
    }
    return data;
  }
}

@JsonSerializable()
class Data {
  List<Content>? content;
  // Pageable? pageable;
  bool? last;
  int? totalPages;
  int? totalElements;
  int? size;
  // Sort? sort;
  int? number;
  bool? first;
  int? numberOfElements;
  bool? empty;

  Data(
      {this.content,
      // this.pageable,
      this.last,
      this.totalPages,
      this.totalElements,
      this.size,
      // this.sort,
      this.number,
      this.first,
      this.numberOfElements,
      this.empty});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['content'] != null) {
      content = <Content>[];
      json['content'].forEach((v) {
        content!.add(Content.fromJson(v));
      });
    }
    // pageable =
    //     json['pageable'] != null ? Pageable.fromJson(json['pageable']) : null;
    // last = json['last'];
    // totalPages = json['totalPages'];
    // totalElements = json['totalElements'];
    // size = json['size'];
    // sort = json['sort'] != null ? Sort.fromJson(json['sort']) : null;
    // number = json['number'];
    // first = json['first'];
    // numberOfElements = json['numberOfElements'];
    // empty = json['empty'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   if (content != null) {
  //     data['content'] = content!.map((v) => v.toJson()).toList();
  //   }
  //   if (pageable != null) {
  //     data['pageable'] = pageable!.toJson();
  //   }
  //   data['last'] = last;
  //   data['totalPages'] = totalPages;
  //   data['totalElements'] = totalElements;
  //   data['size'] = size;
  //   if (sort != null) {
  //     data['sort'] = sort!.toJson();
  //   }
  //   data['number'] = number;
  //   data['first'] = first;
  //   data['numberOfElements'] = numberOfElements;
  //   data['empty'] = empty;
  //   return data;
  }
// }

class Content {
  String? transactionUUID;
  String? transactionCode;
  String? orderUUID;
  num? price;
  String? currency;
  String? customerName;
  String? customerPhone;
  String? createdDate;
  String? status;
  Staff? staff;

  Content(
      {this.transactionUUID,
      this.transactionCode,
      this.orderUUID,
      this.price,
      this.customerName,
      this.customerPhone,
      this.createdDate,
      this.status,
      this.staff,
      this.currency});

  String get priceText => _priceText();

  String _priceText() {
    if (price == null) return '';
    var formatter = NumberFormat('###,###,000');
    return '${formatter.format(price).replaceAll(',', '.')} USD';
  }

  StatusTransition? get statusTransition => StatusTransition.values
      .firstWhereOrNull((element) => element.name == status);

  bool isTransitionSuccess() => status == StatusTransition.SUCCESS.text;

  Content.fromJson(Map<String, dynamic> json) {
    transactionUUID = json['transactionUUID'];
    transactionCode = json['transactionCode'];
    price = json['price'];
    customerName = json['customerName'];
    customerPhone = json['customerPhone'];
    createdDate = json['createdDate'];
    status = json['status'];
    currency = json['currency'];
    orderUUID = json['orderUUID'];
    staff = json['staff'] != null ? Staff.fromJson(json['staff']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['transactionUUID'] = transactionUUID;
    data['transactionCode'] = transactionCode;
    data['price'] = price;
    data['customerName'] = customerName;
    data['customerPhone'] = customerPhone;
    data['createdDate'] = createdDate;
    data['orderUUID'] = orderUUID;
    data['status'] = status;
    data['currency'] = currency;
    if (staff != null) {
      data['staff'] = staff!.toJson();
    }
    return data;
  }
}

enum StatusTransition { SUCCESS, FAILED }

extension StatusTransitionExtension on StatusTransition {
  String get text => _text();

  String _text() {
    switch (this) {
      case StatusTransition.SUCCESS:
        return 'Thành công'.tr;
      case StatusTransition.FAILED:
        return 'Không thành công'.tr;
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
    }
  }
}

class Staff {
  String? staffUUID;
  String? staffName;
  String? qrCode;

  Staff({this.staffUUID, this.staffName, this.qrCode});

  Staff.fromJson(Map<String, dynamic> json) {
    staffUUID = json['staffUUID'];
    staffName = json['staffName'];
    qrCode = json['qrCode'];
  }

  String get barcodeString =>
      Barcode.qrCode().toSvg(qrCode ?? '', width: 240, height: 240);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['staffUUID'] = staffUUID;
    data['staffName'] = staffName;
    data['qrCode'] = qrCode;
    return data;
  }
}

// class Pageable {
//   Sort? sort;
//   int? offset;
//   int? pageNumber;
//   int? pageSize;
//   bool? unpaged;
//   bool? paged;
//
//   Pageable(
//       {this.sort,
//       this.offset,
//       this.pageNumber,
//       this.pageSize,
//       this.unpaged,
//       this.paged});
//
//   Pageable.fromJson(Map<String, dynamic> json) {
//     sort = json['sort'] != null ? Sort.fromJson(json['sort']) : null;
//     offset = json['offset'];
//     pageNumber = json['pageNumber'];
//     pageSize = json['pageSize'];
//     unpaged = json['unpaged'];
//     paged = json['paged'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (sort != null) {
//       data['sort'] = sort!.toJson();
//     }
//     data['offset'] = offset;
//     data['pageNumber'] = pageNumber;
//     data['pageSize'] = pageSize;
//     data['unpaged'] = unpaged;
//     data['paged'] = paged;
//     return data;
//   }
// }
//
// class Sort {
//   bool? empty;
//   bool? sorted;
//   bool? unsorted;
//
//   Sort({this.empty, this.sorted, this.unsorted});
//
//   Sort.fromJson(Map<String, dynamic> json) {
//     empty = json['empty'];
//     sorted = json['sorted'];
//     unsorted = json['unsorted'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['empty'] = empty;
//     data['sorted'] = sorted;
//     data['unsorted'] = unsorted;
//     return data;
//   }
// }
