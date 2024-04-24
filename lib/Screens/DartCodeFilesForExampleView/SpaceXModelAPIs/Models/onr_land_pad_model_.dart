// To parse this JSON data, do
//
//     final oneLandPadModel = oneLandPadModelFromJson(jsonString);

import 'dart:convert';

class OneLandPadModel {
  String? id;
  String? fullName;
  String? status;
  Location? location;
  String? landingType;
  int? attemptedLandings;
  int? successfulLandings;
  String? wikipedia;
  String? details;

  OneLandPadModel({
    this.id,
    this.fullName,
    this.status,
    this.location,
    this.landingType,
    this.attemptedLandings,
    this.successfulLandings,
    this.wikipedia,
    this.details,
  });

  OneLandPadModel copyWith({
    String? id,
    String? fullName,
    String? status,
    Location? location,
    String? landingType,
    int? attemptedLandings,
    int? successfulLandings,
    String? wikipedia,
    String? details,
  }) =>
      OneLandPadModel(
        id: id ?? this.id,
        fullName: fullName ?? this.fullName,
        status: status ?? this.status,
        location: location ?? this.location,
        landingType: landingType ?? this.landingType,
        attemptedLandings: attemptedLandings ?? this.attemptedLandings,
        successfulLandings: successfulLandings ?? this.successfulLandings,
        wikipedia: wikipedia ?? this.wikipedia,
        details: details ?? this.details,
      );

  factory OneLandPadModel.fromRawJson(String str) => OneLandPadModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OneLandPadModel.fromJson(Map<String, dynamic> json) => OneLandPadModel(
    id: json["id"],
    fullName: json["full_name"],
    status: json["status"],
    location: json["location"] == null ? null : Location.fromJson(json["location"]),
    landingType: json["landing_type"],
    attemptedLandings: json["attempted_landings"],
    successfulLandings: json["successful_landings"],
    wikipedia: json["wikipedia"],
    details: json["details"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "full_name": fullName,
    "status": status,
    "location": location?.toJson(),
    "landing_type": landingType,
    "attempted_landings": attemptedLandings,
    "successful_landings": successfulLandings,
    "wikipedia": wikipedia,
    "details": details,
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
