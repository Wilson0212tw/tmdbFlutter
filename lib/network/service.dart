import 'package:chopper/chopper.dart';
import 'package:gi_tg/constant.dart';
import 'package:gi_tg/network/custom_headers_interceptor.dart';
import 'package:gi_tg/network/model/index.dart';

import 'package:gi_tg/network/model_converter.dart';
part 'service.chopper.dart';

@ChopperApi()
abstract class Service extends ChopperService {
  @Get(path: 'movie/popular')
  Future<Response<PopularResultM>> getMoviePopulars([@Query() int page = 1]);

  @Get(path: 'tv/popular')
  Future<Response<PopularResultT>> getTVShowPopulars([@Query() int page = 1]);

  @Get(path: 'movie/now_playing')
  Future<Response<PopularResultM>> getMovieLatest([@Query() int page = 1]);

  static Service create() {
    final client = ChopperClient(
      baseUrl: baseUrl,
      interceptors: [CustomHeadersInterceptor(), HttpLoggingInterceptor()],
      converter: ModelConverter({
        PopularResultM: (json) => PopularResultM.fromJson(json),
        PopularResultT: (json) => PopularResultT.fromJson(json)
      }),
      errorConverter: const JsonConverter(),
      services: [
        _$Service(),
      ],
    );
    return _$Service(client);
  }
}
