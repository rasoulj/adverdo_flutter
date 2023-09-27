// To parse this JSON data, do
//
//     final mediaLibrariesModel = mediaLibrariesModelFromJson(jsonString);

// To parse this JSON data, do
//
//     final mediaLibraryModel = mediaLibraryModelFromJson(jsonString);

import 'dart:convert';

import 'package:advedro/core/data/models/response_base.dart';
import 'package:advedro/core/data/types/json.dart';

MediaLibraryModel mediaLibraryModelFromJson(String str) => MediaLibraryModel.fromJson(json.decode(str));

class _K {
  static const String id = "id";
  static const String name = "name";
  static const String status = "status";
  static const String creatives = "creatives";
  static const String createdAt = "created_at";
  static const String updatedAt = "updated_at";
  static const String deleted = "deleted";

  static const String type = "type";
  static const String state = "state";
  static const String tags = "tags";
  static const String icon = "icon";
  static const String image = "image";
}

class MediaLibraryModel extends ResponseBase {
  final String id;
  final String name;
  final String status;
  final List<Creative> creatives;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool deleted;

  MediaLibraryModel({
    required this.id,
    required this.name,
    required this.status,
    required this.creatives,
    required this.createdAt,
    required this.updatedAt,
    required this.deleted,
  });

  factory MediaLibraryModel.empty() => MediaLibraryModel(
      id: "0",
      name: "",
      status: "",
      creatives: [
        Creative.empty(),
      ],
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      deleted: false);

  factory MediaLibraryModel.fromRawJson(String str) => MediaLibraryModel.fromJson(json.decode(str));

  factory MediaLibraryModel.fromJson(Json json) => MediaLibraryModel(
        id: json.getString(_K.id),
        name: json.getString(_K.name),
        status: json.getString(_K.status),
        creatives: List<Creative>.from(json[_K.creatives].map((x) => Creative.fromJson(x))),
        createdAt: json.getDateTime(_K.createdAt) ?? DateTime.now(),
        updatedAt: json.getDateTime(_K.updatedAt) ?? DateTime.now(),
        deleted: json.getBool(_K.deleted),
      );

  @override
  Json toJson() => {
        _K.id: id,
        _K.name: name,
        _K.status: status,
        _K.creatives: List<dynamic>.from(creatives.map((x) => x.toJson())),
        _K.createdAt: createdAt.toStringAdv(),
        _K.updatedAt: updatedAt.toStringAdv(),
        _K.deleted: deleted,
      };
}

class Creative extends ResponseBase {
  final String id;
  final String type;
  final String state;
  final List<String> tags;
  final String icon;
  final String image;

  Creative({
    required this.id,
    required this.type,
    required this.state,
    required this.tags,
    required this.icon,
    required this.image,
  });

  factory Creative.fromRawJson(String str) => Creative.fromJson(json.decode(str));

  factory Creative.fromJson(Json json) => Creative(
        id: json.getString(_K.id),
        type: json.getString(_K.type),
        state: json.getString(_K.state),
        tags: List<String>.from(json[_K.tags].map((x) => x)),
        icon: json.getString(_K.icon),
        image: json.getString(_K.image),
      );

  @override
  Json toJson() => {
        _K.id: id,
        _K.type: type,
        _K.state: state,
        _K.tags: List<dynamic>.from(tags.map((x) => x)),
        _K.icon: icon,
        _K.image: image,
      };

  factory Creative.empty() => Creative(id: "0", type: "", state: "", tags: [], icon: "", image: "");
}
