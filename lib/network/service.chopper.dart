// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$Service extends Service {
  _$Service([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = Service;

  @override
  Future<Response<PopularResultM>> getMoviePopulars(
      [int page = 1, String region = "ZH"]) {
    final $url = 'movie/popular';
    final $params = <String, dynamic>{'page': page, 'region': region};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<PopularResultM, PopularResultM>($request);
  }

  @override
  Future<Response<PopularResultT>> getTVShowPopulars(
      [int page = 1, String region = "ZH"]) {
    final $url = 'tv/popular';
    final $params = <String, dynamic>{'page': page, 'region': region};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<PopularResultT, PopularResultT>($request);
  }

  @override
  Future<Response<PopularResultM>> getMovieLatest(
      [int page = 1, String region = "ZH"]) {
    final $url = 'movie/now_playing';
    final $params = <String, dynamic>{'page': page, 'region': region};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<PopularResultM, PopularResultM>($request);
  }
}
