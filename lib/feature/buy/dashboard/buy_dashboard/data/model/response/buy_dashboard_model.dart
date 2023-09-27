// To parse this JSON data, do
//

import 'dart:convert';

import 'package:advedro/core/data/models/response_base.dart';
import 'package:advedro/core/data/types/json.dart';

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

class BuyDashboardModel extends ResponseBase {
  final List<MediaLibraryItem> items;
  final String offset;
  final int total;

  BuyDashboardModel({
    this.items = const [],
    this.offset = "",
    this.total = 0,
  });

  factory BuyDashboardModel.fromRawJson(String str) => BuyDashboardModel.fromJson(json.decode(str));

  factory BuyDashboardModel.fromJson(Json json) => BuyDashboardModel(
        items: List<MediaLibraryItem>.from(json[_K.items].map((x) => MediaLibraryItem.fromJson(x))),
        offset: json.getString(_K.offset),
        total: json.getInt(_K.total),
      );

  @override
  Json toJson() => {
        _K.items: List<dynamic>.from(items.map((x) => x.toJson())),
        _K.offset: offset,
        _K.total: total,
      };
}

class MediaLibraryItem extends ResponseBase {
  final String id;
  final String name;
  final Status status;
  final int creatives;

  MediaLibraryItem({
    required this.id,
    required this.name,
    required this.status,
    required this.creatives,
  });

  factory MediaLibraryItem.empty() => MediaLibraryItem(id: "0", name: "", status: Status.active, creatives: 0);

  factory MediaLibraryItem.fromRawJson(String str) => MediaLibraryItem.fromJson(json.decode(str));

  factory MediaLibraryItem.fromJson(Json json) => MediaLibraryItem(
        id: json.getString(_K.id),
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

enum Status {
  active,
  inactive,
}

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
