import 'package:gi_tg/network/model/movieItem.dart';
import 'package:json_annotation/json_annotation.dart';

part 'moviePopular.g.dart';

@JsonSerializable()
class MoviePopular {
  MoviePopular({
    this.page,
    required this.results,
    this.totalPages,
    this.totalResults,
  });

  int? page;

  List<MovieItem> results;
  @JsonKey(name: 'total_pages')
  int? totalPages;
  @JsonKey(name: 'total_results')
  int? totalResults;

  factory MoviePopular.fromJson(Map<String, dynamic> json) =>
      _$MoviePopularFromJson(json);

  Map<String, dynamic> toJson() => _$MoviePopularToJson(this);
}
