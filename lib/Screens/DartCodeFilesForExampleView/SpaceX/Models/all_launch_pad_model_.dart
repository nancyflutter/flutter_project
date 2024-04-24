// To parse this JSON data, do
//
//     final allLaunchPadModel = allLaunchPadModelFromJson(jsonString);

import 'dart:convert';

class AllLaunchPadModel {
  int? id;
  String? name;
  String? status;
  Location? location;
  List<String>? vehiclesLaunched;
  int? attemptedLaunches;
  int? successfulLaunches;
  String? wikipedia;
  String? details;
  String? siteId;
  String? siteNameLong;

  AllLaunchPadModel({
    this.id,
    this.name,
    this.status,
    this.location,
    this.vehiclesLaunched,
    this.attemptedLaunches,
    this.successfulLaunches,
    this.wikipedia,
    this.details,
    this.siteId,
    this.siteNameLong,
  });

  AllLaunchPadModel copyWith({
    int? id,
    String? name,
    String? status,
    Location? location,
    List<String>? vehiclesLaunched,
    int? attemptedLaunches,
    int? successfulLaunches,
    String? wikipedia,
    String? details,
    String? siteId,
    String? siteNameLong,
  }) =>
      AllLaunchPadModel(
        id: id ?? this.id,
        name: name ?? this.name,
        status: status ?? this.status,
        location: location ?? this.location,
        vehiclesLaunched: vehiclesLaunched ?? this.vehiclesLaunched,
        attemptedLaunches: attemptedLaunches ?? this.attemptedLaunches,
        successfulLaunches: successfulLaunches ?? this.successfulLaunches,
        wikipedia: wikipedia ?? this.wikipedia,
        details: details ?? this.details,
        siteId: siteId ?? this.siteId,
        siteNameLong: siteNameLong ?? this.siteNameLong,
      );

  factory AllLaunchPadModel.fromRawJson(String str) => AllLaunchPadModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AllLaunchPadModel.fromJson(Map<String, dynamic> json) => AllLaunchPadModel(
    id: json["id"],
    name: json["name"],
    status: json["status"],
    location: json["location"] == null ? null : Location.fromJson(json["location"]),
    vehiclesLaunched: json["vehicles_launched"] == null ? [] : List<String>.from(json["vehicles_launched"]!.map((x) => x)),
    attemptedLaunches: json["attempted_launches"],
    successfulLaunches: json["successful_launches"],
    wikipedia: json["wikipedia"],
    details: json["details"],
    siteId: json["site_id"],
    siteNameLong: json["site_name_long"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "status": status,
    "location": location?.toJson(),
    "vehicles_launched": vehiclesLaunched == null ? [] : List<dynamic>.from(vehiclesLaunched!.map((x) => x)),
    "attempted_launches": attemptedLaunches,
    "successful_launches": successfulLaunches,
    "wikipedia": wikipedia,
    "details": details,
    "site_id": siteId,
    "site_name_long": siteNameLong,
  };
}

class Location {
  String? name;
  String? region;
  double? latitude;
  double? longitude;

  Location({
    this.name,
    this.region,
    this.latitude,
    this.longitude,
  });

  Location copyWith({
    String? name,
    String? region,
    double? latitude,
    double? longitude,
  }) =>
      Location(
        name: name ?? this.name,
        region: region ?? this.region,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
      );

  factory Location.fromRawJson(String str) => Location.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    name: json["name"],
    region: json["region"],
    latitude: json["latitude"]?.toDouble(),
    longitude: json["longitude"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "region": region,
    "latitude": latitude,
    "longitude": longitude,
  };
}
