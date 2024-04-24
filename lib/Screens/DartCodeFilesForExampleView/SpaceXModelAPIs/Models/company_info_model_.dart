// To parse this JSON data, do
//
//     final companyInfoModel = companyInfoModelFromJson(jsonString);

import 'dart:convert';

class CompanyInfoModel {
  String? name;
  String? founder;
  int? founded;
  int? employees;
  int? vehicles;
  int? launchSites;
  int? testSites;
  String? ceo;
  String? cto;
  String? coo;
  String? ctoPropulsion;
  int? valuation;
  Headquarters? headquarters;
  Links? links;
  String? summary;

  CompanyInfoModel({
    this.name,
    this.founder,
    this.founded,
    this.employees,
    this.vehicles,
    this.launchSites,
    this.testSites,
    this.ceo,
    this.cto,
    this.coo,
    this.ctoPropulsion,
    this.valuation,
    this.headquarters,
    this.links,
    this.summary,
  });

  CompanyInfoModel copyWith({
    String? name,
    String? founder,
    int? founded,
    int? employees,
    int? vehicles,
    int? launchSites,
    int? testSites,
    String? ceo,
    String? cto,
    String? coo,
    String? ctoPropulsion,
    int? valuation,
    Headquarters? headquarters,
    Links? links,
    String? summary,
  }) =>
      CompanyInfoModel(
        name: name ?? this.name,
        founder: founder ?? this.founder,
        founded: founded ?? this.founded,
        employees: employees ?? this.employees,
        vehicles: vehicles ?? this.vehicles,
        launchSites: launchSites ?? this.launchSites,
        testSites: testSites ?? this.testSites,
        ceo: ceo ?? this.ceo,
        cto: cto ?? this.cto,
        coo: coo ?? this.coo,
        ctoPropulsion: ctoPropulsion ?? this.ctoPropulsion,
        valuation: valuation ?? this.valuation,
        headquarters: headquarters ?? this.headquarters,
        links: links ?? this.links,
        summary: summary ?? this.summary,
      );

  factory CompanyInfoModel.fromRawJson(String str) => CompanyInfoModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CompanyInfoModel.fromJson(Map<String, dynamic> json) => CompanyInfoModel(
    name: json["name"],
    founder: json["founder"],
    founded: json["founded"],
    employees: json["employees"],
    vehicles: json["vehicles"],
    launchSites: json["launch_sites"],
    testSites: json["test_sites"],
    ceo: json["ceo"],
    cto: json["cto"],
    coo: json["coo"],
    ctoPropulsion: json["cto_propulsion"],
    valuation: json["valuation"],
    headquarters: json["headquarters"] == null ? null : Headquarters.fromJson(json["headquarters"]),
    links: json["links"] == null ? null : Links.fromJson(json["links"]),
    summary: json["summary"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "founder": founder,
    "founded": founded,
    "employees": employees,
    "vehicles": vehicles,
    "launch_sites": launchSites,
    "test_sites": testSites,
    "ceo": ceo,
    "cto": cto,
    "coo": coo,
    "cto_propulsion": ctoPropulsion,
    "valuation": valuation,
    "headquarters": headquarters?.toJson(),
    "links": links?.toJson(),
    "summary": summary,
  };
}

class Headquarters {
  String? address;
  String? city;
  String? state;

  Headquarters({
    this.address,
    this.city,
    this.state,
  });

  Headquarters copyWith({
    String? address,
    String? city,
    String? state,
  }) =>
      Headquarters(
        address: address ?? this.address,
        city: city ?? this.city,
        state: state ?? this.state,
      );

  factory Headquarters.fromRawJson(String str) => Headquarters.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Headquarters.fromJson(Map<String, dynamic> json) => Headquarters(
    address: json["address"],
    city: json["city"],
    state: json["state"],
  );

  Map<String, dynamic> toJson() => {
    "address": address,
    "city": city,
    "state": state,
  };
}

class Links {
  String? website;
  String? flickr;
  String? twitter;
  String? elonTwitter;

  Links({
    this.website,
    this.flickr,
    this.twitter,
    this.elonTwitter,
  });

  Links copyWith({
    String? website,
    String? flickr,
    String? twitter,
    String? elonTwitter,
  }) =>
      Links(
        website: website ?? this.website,
        flickr: flickr ?? this.flickr,
        twitter: twitter ?? this.twitter,
        elonTwitter: elonTwitter ?? this.elonTwitter,
      );

  factory Links.fromRawJson(String str) => Links.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    website: json["website"],
    flickr: json["flickr"],
    twitter: json["twitter"],
    elonTwitter: json["elon_twitter"],
  );

  Map<String, dynamic> toJson() => {
    "website": website,
    "flickr": flickr,
    "twitter": twitter,
    "elon_twitter": elonTwitter,
  };
}
