// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'withdraw.money.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WithdrawModel _$WithdrawModelFromJson(Map<String, dynamic> json) =>
    WithdrawModel(
      message: json['message'] as String?,
      traceId: json['traceId'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WithdrawModelToJson(WithdrawModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'traceId': instance.traceId,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      content: (json['content'] as List<dynamic>?)
          ?.map((e) => Contents.fromJson(e as Map<String, dynamic>))
          .toList(),
      pageable: json['pageable'] == null
          ? null
          : Pageable.fromJson(json['pageable'] as Map<String, dynamic>),
      last: json['last'] as bool?,
      totalElements: json['totalElements'] as int?,
      totalPages: json['totalPages'] as int?,
      first: json['first'] as bool?,
      sort: json['sort'] == null
          ? null
          : Sort.fromJson(json['sort'] as Map<String, dynamic>),
      size: json['size'] as int?,
      number: json['number'] as int?,
      numberOfElements: json['numberOfElements'] as int?,
      empty: json['empty'] as bool?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'content': instance.content,
      'pageable': instance.pageable,
      'last': instance.last,
      'totalElements': instance.totalElements,
      'totalPages': instance.totalPages,
      'first': instance.first,
      'sort': instance.sort,
      'size': instance.size,
      'number': instance.number,
      'numberOfElements': instance.numberOfElements,
      'empty': instance.empty,
    };

Contents _$ContentsFromJson(Map<String, dynamic> json) => Contents(
      transactionId: json['transactionId'] as String?,
      status: json['status'] as String?,
      dateTime: json['dateTime'] as String?,
      amount: json['amount'] as num?,
      type: json['type'] as String?,
      currency: json['currency'] as String?,
    );

Map<String, dynamic> _$ContentsToJson(Contents instance) => <String, dynamic>{
      'transactionId': instance.transactionId,
      'status': instance.status,
      'dateTime': instance.dateTime,
      'amount': instance.amount,
      'type': instance.type,
      'currency': instance.currency,
    };

Pageable _$PageableFromJson(Map<String, dynamic> json) => Pageable(
      sort: json['sort'] == null
          ? null
          : Sort.fromJson(json['sort'] as Map<String, dynamic>),
      pageNumber: json['pageNumber'] as int?,
      pageSize: json['pageSize'] as int?,
      offset: json['offset'] as int?,
      paged: json['paged'] as bool?,
      unpaged: json['unpaged'] as bool?,
    );

Map<String, dynamic> _$PageableToJson(Pageable instance) => <String, dynamic>{
      'sort': instance.sort,
      'pageNumber': instance.pageNumber,
      'pageSize': instance.pageSize,
      'offset': instance.offset,
      'paged': instance.paged,
      'unpaged': instance.unpaged,
    };

Sort _$SortFromJson(Map<String, dynamic> json) => Sort(
      sorted: json['sorted'] as bool?,
      empty: json['empty'] as bool?,
      unsorted: json['unsorted'] as bool?,
    );

Map<String, dynamic> _$SortToJson(Sort instance) => <String, dynamic>{
      'sorted': instance.sorted,
      'empty': instance.empty,
      'unsorted': instance.unsorted,
    };
