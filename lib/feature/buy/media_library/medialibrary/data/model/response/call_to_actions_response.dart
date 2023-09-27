// To parse this JSON data, do
//
//     final callToActionsResponse = callToActionsResponseFromJson(jsonString);

import 'dart:convert';

import 'package:advedro/core/data/models/response_base.dart';
import 'package:advedro/core/data/types/json.dart';

class _K {
  static const String id = "id";
  static const String name = "name";
}

class CallToAction extends ResponseBase {
  final int id;
  final String name;

  CallToAction({
    required this.id,
    required this.name,
  });

  factory CallToAction.fromRawJson(String str) => CallToAction.fromJson(json.decode(str));

  factory CallToAction.fromJson(Json json) => CallToAction(
        id: json.getInt(_K.id),
        name: json.getString(_K.name),
      );

  @override
  Json toJson() => {
        _K.id: id,
        _K.name: name,
      };
}

class CallToActionsResponse extends ResponseBase {
  final List<CallToAction> actions;

  CallToActionsResponse({required this.actions});

  factory CallToActionsResponse.fromRawJson(String str) {
    var actions = List<CallToAction>.from(json.decode(str).map((x) => CallToAction.fromJson(x)));
    return CallToActionsResponse(actions: actions);
  }

  @override
  Json toJson() {
    return {};
  }
}

CallToActionsResponse callToActionsResponseFromJson(String str) {
  return CallToActionsResponse.fromRawJson(str);
}
