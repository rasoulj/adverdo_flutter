// To parse this JSON data, do
//
//     final campaignModel = campaignModelFromJson(jsonString);

import 'dart:convert';

CampaignModel campaignModelFromJson(String str) => CampaignModel.fromJson(json.decode(str));

String campaignModelToJson(CampaignModel data) => json.encode(data.toJson());

class CampaignModel {
  final List<Item>? items;
  final int? offset;
  final int? total;

  CampaignModel({
    this.items,
    this.offset,
    this.total,
  });

  factory CampaignModel.fromJson(Map<String, dynamic> json) => CampaignModel(
        items: json["items"] == null ? [] : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
        offset: json["offset"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
        "offset": offset,
        "total": total,
      };
}

class Item {
  final List<String>? allowedActions;
  final dynamic bid;
  final int? id;
  final String? name;
  final String? status;
  final String? destinationUrl;

  Item({
    this.allowedActions,
    this.bid,
    this.id,
    this.name,
    this.status,
    this.destinationUrl,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        allowedActions: json["allowedActions"] == null ? [] : List<String>.from(json["allowedActions"]!.map((x) => x)),
        bid: json["bid"],
        id: json["id"],
        name: json["name"],
        status: json["status"],
        destinationUrl: json["destination_url"],
      );

  Map<String, dynamic> toJson() => {
        "allowedActions": allowedActions == null ? [] : List<dynamic>.from(allowedActions!.map((x) => x)),
        "bid": bid,
        "id": id,
        "name": name,
        "status": status,
        "destination_url": destinationUrl,
      };
}
