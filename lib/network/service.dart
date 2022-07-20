import 'package:chopper/chopper.dart';
import 'package:gi_tg/constant.dart';
import 'package:gi_tg/network/custom_headers_interceptor.dart';
import 'package:gi_tg/network/model/index.dart';

import 'package:gi_tg/network/model_converter.dart';
part 'service.chopper.dart';

@ChopperApi()
abstract class Service extends ChopperService {
  @Get(path: 'movie/popular')
  Future<Response<PopularResultM>> getMoviePopulars(
      [@Query() int page = 1,
      @Query() String region = "TW",
      @Query() String language = "zh-TW"]);

  @Get(path: 'tv/popular')
  Future<Response<PopularResultT>> getTVShowPopulars(
      [@Query() int page = 1,
      @Query() String region = "TW",
      @Query() String language = "zh-TW"]);

  @Get(path: '/trending/{mediaType}/{timeWindow}')
  Future<Response<PopularResultM>> getMovieLatest(
      [@Query() int page = 1,
      @Query() String region = "TW",
      @Query() String language = "zh-TW",
      @Path() String mediaType = 'all',
      @Path() String timeWindow = 'day']);

  static Service create() {
    final client = ChopperClient(
      baseUrl: baseUrl,
      interceptors: [CustomHeadersInterceptor(), HttpLoggingInterceptor()],
      converter: ModelConverter({
        PopularResultM: PopularResultM.fromJson,
        PopularResultT: PopularResultT.fromJson
      }),
      errorConverter: const JsonConverter(),
      services: [
        _$Service(),
      ],
    );
    return _$Service(client);
  }
}
