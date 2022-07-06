import 'package:gi_tg/network/model/index.dart';
import 'package:json_annotation/json_annotation.dart';

part 'popularResultT.g.dart';

@JsonSerializable()
class PopularResultT {
  PopularResultT({
    this.page,
    required this.results,
    this.totalPages,
    this.totalResults,
  });

  int? page;

  List<TVShow> results;
  @JsonKey(name: 'total_pages')
  int? totalPages;
  @JsonKey(name: 'total_results')
  int? totalResults;

  factory PopularResultT.fromJson(Map<String, dynamic> json) =>
      _$PopularResultTFromJson(json);

  Map<String, dynamic> toJson() => _$PopularResultTToJson(this);
}
