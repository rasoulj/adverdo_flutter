// To parse this JSON data, do
//
//     final changeTagsResponse = changeTagsResponseFromJson(jsonString);

import 'dart:convert';

import 'package:advedro/core/data/models/response_base.dart';
import 'package:advedro/core/data/types/json.dart';

DeleteResponse deleteResponseFromJson(String str) => DeleteResponse.fromJson(json.decode(str));

class _K {
  static const String result = "result";
}

class DeleteResponse extends ResponseBase {
  final String result;

  const DeleteResponse({
    required this.result,
  });

  @override
  factory DeleteResponse.fromRawJson(String str) => DeleteResponse.fromJson(json.decode(str));

  @override
  factory DeleteResponse.fromJson(Json json) => DeleteResponse(
        result: json.getString(_K.result),
      );

  @override
  Json toJson() => {
        _K.result: result,
      };
}
