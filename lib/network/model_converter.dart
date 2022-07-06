import 'dart:convert';
import 'package:chopper/chopper.dart';

class ModelConverter implements Converter {
  final Map<Type, Function> typeToJsonFactoryMap;

  ModelConverter(this.typeToJsonFactoryMap);

  @override
  Request convertRequest(Request request) {
    final req = applyHeader(
      request,
      contentTypeKey,
      jsonHeaders,
      override: false,
    );

    return _encodeJson(req);
  }

  Request _encodeJson(Request request) {
    var contentType = request.headers[contentTypeKey];
    if (contentType != null && contentType.contains(jsonHeaders)) {
      return request.copyWith(body: json.encode(request.body));
    }
    return request;
  }

  T fromJsonData<T, InnerType>(String jsonData, Function jsonParser) {
    var jsonMap = json.decode(jsonData);

    if (jsonMap is List) {
      return jsonMap
          .map((item) => jsonParser(item as Map<String, dynamic>) as InnerType)
          .toList() as T;
    }

    return jsonParser(jsonMap);
  }

  Response<BodyType> _decodeJson<BodyType, InnerType>(Response response) {
    var contentType = response.headers[contentTypeKey];
    var body = response.body;
    if (contentType != null && contentType.contains(jsonHeaders)) {
      body = utf8.decode(response.bodyBytes);
    }
    try {
      // var mapData = json.decode(body);
      // var popular = PopularResult.fromJson(mapData);
      return response.copyWith<BodyType>(
          body: fromJsonData<BodyType, InnerType>(
              response.body, typeToJsonFactoryMap[InnerType]!));
    } catch (e) {
      chopperLogger.warning(e);
      return response.copyWith<BodyType>(body: body);
    }
  }

  @override
  Response<BodyType> convertResponse<BodyType, InnerType>(Response response) {
    return _decodeJson<BodyType, InnerType>(response);
  }
}
