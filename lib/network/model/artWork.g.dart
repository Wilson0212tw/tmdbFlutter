// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artWork.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArtWork _$ArtWorkFromJson(Map<String, dynamic> json) => ArtWork(
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

Map<String, dynamic> _$ArtWorkToJson(ArtWork instance) => <String, dynamic>{
      'backdrop_path': instance.backdropPath,
      'poster_path': instance.posterPath,
      'popularity': instance.popularity,
      'id': instance.id,
      'vote_average': instance.voteAverage,
      'overview': instance.overview,
      'original_language': instance.originalLanguage,
      'vote_count': instance.voteCount,
      'genre_ids': instance.genreIds,
    };
