// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popularResultT.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PopularResultT _$PopularResultTFromJson(Map<String, dynamic> json) =>
    PopularResultT(
      page: json['page'] as int?,
      results: (json['results'] as List<dynamic>)
          .map((e) => TVShow.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: json['total_pages'] as int?,
      totalResults: json['total_results'] as int?,
    );

Map<String, dynamic> _$PopularResultTToJson(PopularResultT instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };
