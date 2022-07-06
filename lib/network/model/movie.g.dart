// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
      adult: json['adult'] as bool?,
      originalTitle: json['original_title'] as String?,
      title_: json['title'] as String?,
      releaseDate: json['release_date'] as String?,
      video: json['video'] as bool?,
      backdropPath: json['backdrop_path'] as String?,
      genreIds:
          (json['genre_ids'] as List<dynamic>?)?.map((e) => e as int).toList(),
      id: json['id'] as int?,
      originalLanguage: json['original_language'] as String?,
      overview: json['overview'] as String?,
      popularity: (json['popularity'] as num?)?.toDouble(),
      posterPath: json['poster_path'] as String?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      voteCount: json['vote_count'] as int?,
    );

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'backdrop_path': instance.backdropPath,
      'poster_path': instance.posterPath,
      'popularity': instance.popularity,
      'id': instance.id,
      'vote_average': instance.voteAverage,
      'overview': instance.overview,
      'original_language': instance.originalLanguage,
      'vote_count': instance.voteCount,
      'genre_ids': instance.genreIds,
      'adult': instance.adult,
      'original_title': instance.originalTitle,
      'title': instance.title_,
      'release_date': instance.releaseDate,
      'video': instance.video,
    };
