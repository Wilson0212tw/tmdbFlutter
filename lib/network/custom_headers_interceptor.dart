import 'dart:async';
import 'package:chopper/chopper.dart';

class CustomHeadersInterceptor implements RequestInterceptor {
  static const String AUTH_HEADER = "Authorization";

  static const String BEARER = "Bearer ";

  static const String V4_AUTH_HEADER =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyZDNiYTE3MzlkZGQwMmRmMzlmZDEyMTc5MGY0NWI3MSIsInN1YiI6IjVlNzhiZDE5MzU3YzAwMDAxOTUxZThjNiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.0V-IgGf27WaeW-aMsSOMmUbDX6zSkQcswN_XrFppZJI";

  @override
  FutureOr<Request> onRequest(Request request) async =>
      request.copyWith(headers: {AUTH_HEADER: BEARER + V4_AUTH_HEADER});
}
