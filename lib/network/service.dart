import 'package:chopper/chopper.dart';
import 'package:gi_tg/constant.dart';
import 'package:gi_tg/network/custom_headers_interceptor.dart';
import 'package:gi_tg/network/model/moviePopular.dart';
import 'package:gi_tg/network/model_converter.dart';
part 'service.chopper.dart';

@ChopperApi()
abstract class Service extends ChopperService {
  @Get(path: 'movie/popular')
  Future<Response<MoviePopular>> getPopularMovies([@Query() int page = 1]);

  static Service create() {
    final client = ChopperClient(
      baseUrl: baseUrl,
      interceptors: [CustomHeadersInterceptor(), HttpLoggingInterceptor()],
      converter: ModelConverter(),
      errorConverter: const JsonConverter(),
      services: [
        _$Service(),
      ],
    );
    return _$Service(client);
  }
}
