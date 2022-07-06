import 'package:gi_tg/network/model/artWork.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable()
class Movie extends ArtWork {
  final bool? adult;
  @JsonKey(name: 'original_title')
  final String? originalTitle;
  @JsonKey(name: 'title')
  final String? title_;
  @JsonKey(name: 'release_date')
  final String? releaseDate;
  final bool? video;

  Movie({
    this.adult,
    this.originalTitle,
    this.title_,
    this.releaseDate,
    this.video,
    super.backdropPath,
    super.genreIds,
    super.id,
    super.originalLanguage,
    super.overview,
    super.popularity,
    super.posterPath,
    super.voteAverage,
    super.voteCount,
  });

  @override
  String? get launchDate => releaseDate;
  @override
  String? get title => title_;

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$MovieToJson(this);
}
