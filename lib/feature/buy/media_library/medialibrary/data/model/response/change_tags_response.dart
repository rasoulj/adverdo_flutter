// To parse this JSON data, do
//
//     final changeTagsResponse = changeTagsResponseFromJson(jsonString);

import 'dart:convert';

import 'package:advedro/core/data/models/response_base.dart';
import 'package:advedro/core/data/types/json.dart';

ChangeTagsResponse changeTagsResponseFromJson(String str) => ChangeTagsResponse.fromJson(json.decode(str));

class _K {
  static const String result = "result";
}

class ChangeTagsResponse extends ResponseBase {
  final String result;

  ChangeTagsResponse({
    required this.result,
  });

  factory ChangeTagsResponse.fromRawJson(String str) => ChangeTagsResponse.fromJson(json.decode(str));

  factory ChangeTagsResponse.fromJson(Json json) => ChangeTagsResponse(
        result: json.getString(_K.result),
      );

  @override
  Json toJson() => {
        _K.result: result,
      };
}
