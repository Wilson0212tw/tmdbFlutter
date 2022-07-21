import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:gi_tg/constant.dart';
import 'package:gi_tg/network/model/index.dart';

import 'package:retrofit/retrofit.dart';
part 'service.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('movie/popular')
  Future<PopularResultM> getMoviePopulars(
      [@Query("page") int page = 1,
      @Query("region") String region = "TW",
      @Query("language") String language = "zh-TW"]);

  @GET('tv/popular')
  Future<PopularResultT> getTVShowPopulars(
      [@Query("page") int page = 1,
      @Query("region") String region = "TW",
      @Query("language") String language = "zh-TW"]);

  @GET('/trending/{mediaType}/{timeWindow}')
  Future<PopularResultM> getMovieLatest(
      [@Query("page") int page = 1,
      @Query("region") String region = "TW",
      @Query("language") String language = "zh-TW",
      @Path() String mediaType = 'all',
      @Path() String timeWindow = 'day']);
}

const String AUTH_HEADER = "Authorization";

const String BEARER = "Bearer ";

const String V4_AUTH_HEADER =
    "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyZDNiYTE3MzlkZGQwMmRmMzlmZDEyMTc5MGY0NWI3MSIsInN1YiI6IjVlNzhiZDE5MzU3YzAwMDAxOTUxZThjNiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.0V-IgGf27WaeW-aMsSOMmUbDX6zSkQcswN_XrFppZJI";

final dio = Dio()..options.headers[AUTH_HEADER] = BEARER + V4_AUTH_HEADER;
// ..interceptors.add(JsonResponseConverter());
final client = RestClient(dio);

// class JsonResponseConverter extends Interceptor {
//   @override
//   void onResponse(Response response, ResponseInterceptorHandler handler) {
//     response.data = jsonDecode(response.data) as Map<String, dynamic>?;
//     super.onResponse(response, handler);
//   }
// }
