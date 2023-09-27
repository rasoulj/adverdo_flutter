// To parse this JSON data, do
//
//     final createAdResponse = createAdResponseFromJson(jsonString);

import 'dart:convert';

import 'package:advedro/core/data/models/response_base.dart';
import 'package:advedro/core/data/types/json.dart';

CreateAdResponse createAdResponseFromJson(String str) => CreateAdResponse.fromJson(json.decode(str));

class _K {
  static const String result = "result";
  static const String id = "id";
}

class CreateAdResponse extends ResponseBase {
  final String result;
  final String id;

  CreateAdResponse({
    required this.result,
    required this.id,
  });

  factory CreateAdResponse.fromRawJson(String str) => CreateAdResponse.fromJson(json.decode(str));

  factory CreateAdResponse.fromJson(Json json) => CreateAdResponse(
        result: json.getString(_K.result),
        id: json.getString(_K.id),
      );

  @override
  Json toJson() => {
        _K.result: result,
        _K.id: id,
      };
}
