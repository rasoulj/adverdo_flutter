import 'dart:convert';

TargetCampaignModel targetCampaignModelFromJson(String str) => TargetCampaignModel.fromJson(json.decode(str));

String targetCampaignModelToJson(TargetCampaignModel data) => json.encode(data.toJson());

class TargetCampaignModel {
  final List<Browser>? geo;
  final List<Browser>? lang;
  final List<Browser>? os;
  final List<Browser>? browser;
  final List<Isp>? isp;
  final List<Browser>? device;
  final List<Browser>? proxy;

  TargetCampaignModel({
    this.geo,
    this.lang,
    this.os,
    this.browser,
    this.isp,
    this.device,
    this.proxy,
  });

  factory TargetCampaignModel.fromJson(Map<String, dynamic> json) => TargetCampaignModel(
        geo: json["geo"] == null ? [] : List<Browser>.from(json["geo"]!.map((x) => Browser.fromJson(x))),
        lang: json["lang"] == null ? [] : List<Browser>.from(json["lang"]!.map((x) => Browser.fromJson(x))),
        os: json["os"] == null ? [] : List<Browser>.from(json["os"]!.map((x) => Browser.fromJson(x))),
        browser: json["browser"] == null ? [] : List<Browser>.from(json["browser"]!.map((x) => Browser.fromJson(x))),
        isp: json["isp"] == null ? [] : List<Isp>.from(json["isp"]!.map((x) => Isp.fromJson(x))),
        device: json["device"] == null ? [] : List<Browser>.from(json["device"]!.map((x) => Browser.fromJson(x))),
        proxy: json["proxy"] == null ? [] : List<Browser>.from(json["proxy"]!.map((x) => Browser.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "geo": geo == null ? [] : List<dynamic>.from(geo!.map((x) => x.toJson())),
        "lang": lang == null ? [] : List<dynamic>.from(lang!.map((x) => x.toJson())),
        "os": os == null ? [] : List<dynamic>.from(os!.map((x) => x.toJson())),
        "browser": browser == null ? [] : List<dynamic>.from(browser!.map((x) => x.toJson())),
        "isp": isp == null ? [] : List<dynamic>.from(isp!.map((x) => x.toJson())),
        "device": device == null ? [] : List<dynamic>.from(device!.map((x) => x.toJson())),
        "proxy": proxy == null ? [] : List<dynamic>.from(proxy!.map((x) => x.toJson())),
      };
}

class Browser {
  final String? id;
  final String? name;

  Browser({
    this.id,
    this.name,
  });

  factory Browser.fromJson(Map<String, dynamic> json) => Browser(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class Isp {
  final String? id;
  final String? name;
  final String? country;

  Isp({
    this.id,
    this.name,
    this.country,
  });

  factory Isp.fromJson(Map<String, dynamic> json) => Isp(
        id: json["id"],
        name: json["name"],
        country: json["country"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "country": country,
      };
}
