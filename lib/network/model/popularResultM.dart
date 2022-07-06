import 'package:gi_tg/network/model/index.dart';
import 'package:json_annotation/json_annotation.dart';

part 'popularResultM.g.dart';

@JsonSerializable()
class PopularResultM {
  PopularResultM({
    this.page,
    required this.results,
    this.totalPages,
    this.totalResults,
  });

  int? page;

  List<Movie> results;
  @JsonKey(name: 'total_pages')
  int? totalPages;
  @JsonKey(name: 'total_results')
  int? totalResults;

  factory PopularResultM.fromJson(Map<String, dynamic> json) =>
      _$PopularResultMFromJson(json);

  Map<String, dynamic> toJson() => _$PopularResultMToJson(this);
}
