// https://api.spacexdata.com/v3/ships/AMERICANCHAMPION

// To parse this JSON data, do
//
//     final oneShipModel = oneShipModelFromJson(jsonString);

import 'dart:convert';

class OneShipModel {
  String? shipId;
  String? shipName;
  dynamic shipModel;
  String? shipType;
  List<String>? roles;
  bool? active;
  int? imo;
  int? mmsi;
  int? abs;
  int? oneShipModelClass;
  int? weightLbs;
  int? weightKg;
  int? yearBuilt;
  String? homePort;
  String? status;
  dynamic speedKn;
  dynamic courseDeg;
  Position? position;
  dynamic successfulLandings;
  dynamic attemptedLandings;
  List<Mission>? missions;
  String? url;
  String? image;

  OneShipModel({
    this.shipId,
    this.shipName,
    this.shipModel,
    this.shipType,
    this.roles,
    this.active,
    this.imo,
    this.mmsi,
    this.abs,
    this.oneShipModelClass,
    this.weightLbs,
    this.weightKg,
    this.yearBuilt,
    this.homePort,
    this.status,
    this.speedKn,
    this.courseDeg,
    this.position,
    this.successfulLandings,
    this.attemptedLandings,
    this.missions,
    this.url,
    this.image,
  });

  OneShipModel copyWith({
    String? shipId,
    String? shipName,
    dynamic shipModel,
    String? shipType,
    List<String>? roles,
    bool? active,
    int? imo,
    int? mmsi,
    int? abs,
    int? oneShipModelClass,
    int? weightLbs,
    int? weightKg,
    int? yearBuilt,
    String? homePort,
    String? status,
    dynamic speedKn,
    dynamic courseDeg,
    Position? position,
    dynamic successfulLandings,
    dynamic attemptedLandings,
    List<Mission>? missions,
    String? url,
    String? image,
  }) =>
      OneShipModel(
        shipId: shipId ?? this.shipId,
        shipName: shipName ?? this.shipName,
        shipModel: shipModel ?? this.shipModel,
        shipType: shipType ?? this.shipType,
        roles: roles ?? this.roles,
        active: active ?? this.active,
        imo: imo ?? this.imo,
        mmsi: mmsi ?? this.mmsi,
        abs: abs ?? this.abs,
        oneShipModelClass: oneShipModelClass ?? this.oneShipModelClass,
        weightLbs: weightLbs ?? this.weightLbs,
        weightKg: weightKg ?? this.weightKg,
        yearBuilt: yearBuilt ?? this.yearBuilt,
        homePort: homePort ?? this.homePort,
        status: status ?? this.status,
        speedKn: speedKn ?? this.speedKn,
        courseDeg: courseDeg ?? this.courseDeg,
        position: position ?? this.position,
        successfulLandings: successfulLandings ?? this.successfulLandings,
        attemptedLandings: attemptedLandings ?? this.attemptedLandings,
        missions: missions ?? this.missions,
        url: url ?? this.url,
        image: image ?? this.image,
      );

  factory OneShipModel.fromRawJson(String str) => OneShipModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OneShipModel.fromJson(Map<String, dynamic> json) => OneShipModel(
    shipId: json["ship_id"],
    shipName: json["ship_name"],
    shipModel: json["ship_model"],
    shipType: json["ship_type"],
    roles: json["roles"] == null ? [] : List<String>.from(json["roles"]!.map((x) => x)),
    active: json["active"],
    imo: json["imo"],
    mmsi: json["mmsi"],
    abs: json["abs"],
    oneShipModelClass: json["class"],
    weightLbs: json["weight_lbs"],
    weightKg: json["weight_kg"],
    yearBuilt: json["year_built"],
    homePort: json["home_port"],
    status: json["status"],
    speedKn: json["speed_kn"],
    courseDeg: json["course_deg"],
    position: json["position"] == null ? null : Position.fromJson(json["position"]),
    successfulLandings: json["successful_landings"],
    attemptedLandings: json["attempted_landings"],
    missions: json["missions"] == null ? [] : List<Mission>.from(json["missions"]!.map((x) => Mission.fromJson(x))),
    url: json["url"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "ship_id": shipId,
    "ship_name": shipName,
    "ship_model": shipModel,
    "ship_type": shipType,
    "roles": roles == null ? [] : List<dynamic>.from(roles!.map((x) => x)),
    "active": active,
    "imo": imo,
    "mmsi": mmsi,
    "abs": abs,
    "class": oneShipModelClass,
    "weight_lbs": weightLbs,
    "weight_kg": weightKg,
    "year_built": yearBuilt,
    "home_port": homePort,
    "status": status,
    "speed_kn": speedKn,
    "course_deg": courseDeg,
    "position": position?.toJson(),
    "successful_landings": successfulLandings,
    "attempted_landings": attemptedLandings,
    "missions": missions == null ? [] : List<dynamic>.from(missions!.map((x) => x.toJson())),
    "url": url,
    "image": image,
  };
}

class Mission {
  String? name;
  int? flight;

  Mission({
    this.name,
    this.flight,
  });

  Mission copyWith({
    String? name,
    int? flight,
  }) =>
      Mission(
        name: name ?? this.name,
        flight: flight ?? this.flight,
      );

  factory Mission.fromRawJson(String str) => Mission.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Mission.fromJson(Map<String, dynamic> json) => Mission(
    name: json["name"],
    flight: json["flight"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "flight": flight,
  };
}

class Position {
  dynamic latitude;
  dynamic longitude;

  Position({
    this.latitude,
    this.longitude,
  });

  Position copyWith({
    dynamic latitude,
    dynamic longitude,
  }) =>
      Position(
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
      );

  factory Position.fromRawJson(String str) => Position.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Position.fromJson(Map<String, dynamic> json) => Position(
    latitude: json["latitude"],
    longitude: json["longitude"],
  );

  Map<String, dynamic> toJson() => {
    "latitude": latitude,
    "longitude": longitude,
  };
}
