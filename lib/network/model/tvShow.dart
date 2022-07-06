import 'package:json_annotation/json_annotation.dart';
import 'package:gi_tg/network/model/artWork.dart';

part 'tvShow.g.dart';

@JsonSerializable()
class TVShow extends ArtWork {
  @JsonKey(name: 'first_air_date')
  final String? firstAirDate;
  final String? name;
  @JsonKey(name: 'original_name')
  final String? originalName;

  TVShow({
    this.firstAirDate,
    this.name,
    this.originalName,
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
  String? get launchDate => firstAirDate;
  @override
  String? get title => originalName;

  factory TVShow.fromJson(Map<String, dynamic> json) => _$TVShowFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TVShowToJson(this);
}
