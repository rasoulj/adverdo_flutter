import 'dart:convert';

CampaignBidModel campaignBidModelFromJson(String str) => CampaignBidModel.fromJson(json.decode(str));

String campaignBidModelToJson(CampaignBidModel data) => json.encode(data.toJson());

class CampaignBidModel {
  final String? result;

  CampaignBidModel({
    this.result,
  });

  factory CampaignBidModel.fromJson(Map<String, dynamic> json) => CampaignBidModel(
        result: json["result"],
      );

  Map<String, dynamic> toJson() => {
        "result": result,
      };
}
