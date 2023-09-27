// To parse this JSON data, do
//
//     final mediaLibrariesModel = mediaLibrariesModelFromJson(jsonString);

import 'dart:convert';

import 'package:advedro/core/data/models/response_base.dart';
import 'package:advedro/core/data/types/json.dart';

MediaGroupsModel mediaLibrariesModelFromJson(String str) => MediaGroupsModel.fromJson(json.decode(str));

class _K {
  static const String items = "items";
  static const String offset = "offset";
  static const String total = "total";

  static const String id = "id";
  static const String name = "name";
  static const String status = "status";
  static const String creatives = "creatives";

  static const String active = "active";
  static const String inactive = "inactive";
}

class MediaGroupsModel extends ResponseBase {
  final List<GroupItem> items;
  final int offset;
  final int total;

  MediaGroupsModel({
    this.items = const [],
    this.offset = 0,
    this.total = 0,
  });

  factory MediaGroupsModel.fromRawJson(String str) => MediaGroupsModel.fromJson(json.decode(str));

  factory MediaGroupsModel.fromJson(Json json) => MediaGroupsModel(
        items: List<GroupItem>.from(json[_K.items].map((x) => GroupItem.fromJson(x))),
        offset: json.getInt(_K.offset),
        total: json.getInt(_K.total),
      );

  @override
  Json toJson() => {
        _K.items: List<dynamic>.from(items.map((x) => x.toJson())),
        _K.offset: offset,
        _K.total: total,
      };
}

class GroupItem extends ResponseBase {
  final int id;
  final String name;
  final Status status;
  final int creatives;

  GroupItem({
    required this.id,
    required this.name,
    required this.status,
    required this.creatives,
  });

  factory GroupItem.empty() => GroupItem(id: 0, name: "", status: Status.active, creatives: 0);

  factory GroupItem.fromRawJson(String str) => GroupItem.fromJson(json.decode(str));

  factory GroupItem.fromJson(Json json) => GroupItem(
        id: json.getInt(_K.id),
        name: json.getString(_K.name),
        status: statusValues.map[json[_K.status]]!,
        creatives: json.getInt(_K.creatives),
      );

  @override
  Json toJson() => {
        _K.id: id,
        _K.name: name,
        _K.status: statusValues.reverse[status],
        _K.creatives: creatives,
      };
}

enum Status { active, inactive }

final statusValues = EnumValues({
  _K.active: Status.active,
  _K.inactive: Status.inactive,
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
