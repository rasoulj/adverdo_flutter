import 'dart:convert';

CreateCampaignModel createCampaignModelFromJson(String str) => CreateCampaignModel.fromJson(json.decode(str));

String createCampaignModelToJson(CreateCampaignModel data) => json.encode(data.toJson());

class CreateCampaignModel {
  final String? result;
  final String? id;

  CreateCampaignModel({
    this.result,
    this.id,
  });

  factory CreateCampaignModel.fromJson(Map<String, dynamic> json) => CreateCampaignModel(
        result: json["result"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "result": result,
        "id": id,
      };
}
