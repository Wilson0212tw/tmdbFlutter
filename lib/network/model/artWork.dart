import 'package:json_annotation/json_annotation.dart';

part 'artWork.g.dart';

@JsonSerializable()
class ArtWork {
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;
  @JsonKey(name: 'poster_path')
  String? posterPath;
  double? popularity;
  int? id;
  @JsonKey(name: 'vote_average')
  double? voteAverage;
  String? overview;
  @JsonKey(name: 'original_language')
  String? originalLanguage;
  @JsonKey(name: 'vote_count')
  int? voteCount;
  @JsonKey(name: 'genre_ids')
  List<int>? genreIds;

  String? get launchDate => '';
  String? get title => '';

  ArtWork({
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.overview,
    this.popularity,
    this.posterPath,
    this.voteAverage,
    this.voteCount,
  });

  factory ArtWork.fromJson(Map<String, dynamic> json) =>
      _$ArtWorkFromJson(json);

  Map<String, dynamic> toJson() => _$ArtWorkToJson(this);
}
