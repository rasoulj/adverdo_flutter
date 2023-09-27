import 'dart:convert';
import '../types/json.dart';

//T createA<T extends ResponseBase>() => ;

abstract class ResponseBase {
  const ResponseBase();

  String toRawJson() => json.encode(toJson());

  Json toJson();

  ResponseBase.fromJson(Json json);

  ResponseBase.fromRawJson(String str);
}
