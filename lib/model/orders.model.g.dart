// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrdersModel _$OrdersModelFromJson(Map<String, dynamic> json) => OrdersModel(
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrdersModelToJson(OrdersModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      content: (json['content'] as List<dynamic>?)
          ?.map((e) => Content.fromJson(e as Map<String, dynamic>))
          .toList(),
      pageable: json['pageable'] == null
          ? null
          : Pageable.fromJson(json['pageable'] as Map<String, dynamic>),
      last: json['last'] as bool?,
      totalPages: json['totalPages'] as int?,
      totalElements: json['totalElements'] as int?,
      sort: json['sort'] == null
          ? null
          : Sort.fromJson(json['sort'] as Map<String, dynamic>),
      first: json['first'] as bool?,
      size: json['size'] as int?,
      number: json['number'] as int?,
      numberOfElements: json['numberOfElements'] as int?,
      empty: json['empty'] as bool?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'content': instance.content,
      'pageable': instance.pageable,
      'last': instance.last,
      'totalPages': instance.totalPages,
      'totalElements': instance.totalElements,
      'sort': instance.sort,
      'first': instance.first,
      'size': instance.size,
      'number': instance.number,
      'numberOfElements': instance.numberOfElements,
      'empty': instance.empty,
    };

Content _$ContentFromJson(Map<String, dynamic> json) => Content(
      orderUUID: json['orderUUID'] as String?,
      orderCode: json['orderCode'] as String?,
      originalPrice: json['originalPrice'] as num?,
      discountedPrice: json['discountedPrice'] as num?,
      customerName: json['customerName'] as String?,
      customerPhone: json['customerPhone'] as String?,
      status: json['status'] as String?,
      createdAt: json['createdAt'] as String?,
      currency: json['currency'] as String?,
      staff: json['staff'] == null
          ? null
          : Staff.fromJson(json['staff'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ContentToJson(Content instance) => <String, dynamic>{
      'orderUUID': instance.orderUUID,
      'orderCode': instance.orderCode,
      'originalPrice': instance.originalPrice,
      'discountedPrice': instance.discountedPrice,
      'customerName': instance.customerName,
      'customerPhone': instance.customerPhone,
      'status': instance.status,
      'createdAt': instance.createdAt,
      'currency': instance.currency,
      'staff': instance.staff,
    };

Staff _$StaffFromJson(Map<String, dynamic> json) => Staff(
      staffUUID: json['staffUUID'] as String?,
      staffName: json['staffName'] as String?,
      qrCode: json['qrCode'] as String?,
    );

Map<String, dynamic> _$StaffToJson(Staff instance) => <String, dynamic>{
      'staffUUID': instance.staffUUID,
      'staffName': instance.staffName,
      'qrCode': instance.qrCode,
    };

Pageable _$PageableFromJson(Map<String, dynamic> json) => Pageable(
      sort: json['sort'] == null
          ? null
          : Sort.fromJson(json['sort'] as Map<String, dynamic>),
      offset: json['offset'] as int?,
      pageNumber: json['pageNumber'] as int?,
      pageSize: json['pageSize'] as int?,
      paged: json['paged'] as bool?,
      unpaged: json['unpaged'] as bool?,
    );

Map<String, dynamic> _$PageableToJson(Pageable instance) => <String, dynamic>{
      'sort': instance.sort,
      'offset': instance.offset,
      'pageNumber': instance.pageNumber,
      'pageSize': instance.pageSize,
      'paged': instance.paged,
      'unpaged': instance.unpaged,
    };

Sort _$SortFromJson(Map<String, dynamic> json) => Sort(
      empty: json['empty'] as bool?,
      unsorted: json['unsorted'] as bool?,
      sorted: json['sorted'] as bool?,
    );

Map<String, dynamic> _$SortToJson(Sort instance) => <String, dynamic>{
      'empty': instance.empty,
      'unsorted': instance.unsorted,
      'sorted': instance.sorted,
    };
