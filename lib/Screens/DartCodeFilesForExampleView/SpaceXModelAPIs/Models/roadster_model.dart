// To parse this JSON data, do
//
//     final roadsterModel = roadsterModelFromJson(jsonString);

import 'dart:convert';

class RoadsterModel {
  String? name;
  DateTime? launchDateUtc;
  int? launchDateUnix;
  int? launchMassKg;
  int? launchMassLbs;
  int? noradId;
  double? epochJd;
  String? orbitType;
  double? apoapsisAu;
  double? periapsisAu;
  double? semiMajorAxisAu;
  double? eccentricity;
  double? inclination;
  double? longitude;
  double? periapsisArg;
  double? periodDays;
  double? speedKph;
  double? speedMph;
  double? earthDistanceKm;
  double? earthDistanceMi;
  double? marsDistanceKm;
  double? marsDistanceMi;
  List<String>? flickrImages;
  String? wikipedia;
  String? video;
  String? details;

  RoadsterModel({
    this.name,
    this.launchDateUtc,
    this.launchDateUnix,
    this.launchMassKg,
    this.launchMassLbs,
    this.noradId,
    this.epochJd,
    this.orbitType,
    this.apoapsisAu,
    this.periapsisAu,
    this.semiMajorAxisAu,
    this.eccentricity,
    this.inclination,
    this.longitude,
    this.periapsisArg,
    this.periodDays,
    this.speedKph,
    this.speedMph,
    this.earthDistanceKm,
    this.earthDistanceMi,
    this.marsDistanceKm,
    this.marsDistanceMi,
    this.flickrImages,
    this.wikipedia,
    this.video,
    this.details,
  });

  RoadsterModel copyWith({
    String? name,
    DateTime? launchDateUtc,
    int? launchDateUnix,
    int? launchMassKg,
    int? launchMassLbs,
    int? noradId,
    double? epochJd,
    String? orbitType,
    double? apoapsisAu,
    double? periapsisAu,
    double? semiMajorAxisAu,
    double? eccentricity,
    double? inclination,
    double? longitude,
    double? periapsisArg,
    double? periodDays,
    double? speedKph,
    double? speedMph,
    double? earthDistanceKm,
    double? earthDistanceMi,
    double? marsDistanceKm,
    double? marsDistanceMi,
    List<String>? flickrImages,
    String? wikipedia,
    String? video,
    String? details,
  }) =>
      RoadsterModel(
        name: name ?? this.name,
        launchDateUtc: launchDateUtc ?? this.launchDateUtc,
        launchDateUnix: launchDateUnix ?? this.launchDateUnix,
        launchMassKg: launchMassKg ?? this.launchMassKg,
        launchMassLbs: launchMassLbs ?? this.launchMassLbs,
        noradId: noradId ?? this.noradId,
        epochJd: epochJd ?? this.epochJd,
        orbitType: orbitType ?? this.orbitType,
        apoapsisAu: apoapsisAu ?? this.apoapsisAu,
        periapsisAu: periapsisAu ?? this.periapsisAu,
        semiMajorAxisAu: semiMajorAxisAu ?? this.semiMajorAxisAu,
        eccentricity: eccentricity ?? this.eccentricity,
        inclination: inclination ?? this.inclination,
        longitude: longitude ?? this.longitude,
        periapsisArg: periapsisArg ?? this.periapsisArg,
        periodDays: periodDays ?? this.periodDays,
        speedKph: speedKph ?? this.speedKph,
        speedMph: speedMph ?? this.speedMph,
        earthDistanceKm: earthDistanceKm ?? this.earthDistanceKm,
        earthDistanceMi: earthDistanceMi ?? this.earthDistanceMi,
        marsDistanceKm: marsDistanceKm ?? this.marsDistanceKm,
        marsDistanceMi: marsDistanceMi ?? this.marsDistanceMi,
        flickrImages: flickrImages ?? this.flickrImages,
        wikipedia: wikipedia ?? this.wikipedia,
        video: video ?? this.video,
        details: details ?? this.details,
      );

  factory RoadsterModel.fromRawJson(String str) => RoadsterModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RoadsterModel.fromJson(Map<String, dynamic> json) => RoadsterModel(
    name: json["name"],
    launchDateUtc: json["launch_date_utc"] == null ? null : DateTime.parse(json["launch_date_utc"]),
    launchDateUnix: json["launch_date_unix"],
    launchMassKg: json["launch_mass_kg"],
    launchMassLbs: json["launch_mass_lbs"],
    noradId: json["norad_id"],
    epochJd: json["epoch_jd"]?.toDouble(),
    orbitType: json["orbit_type"],
    apoapsisAu: json["apoapsis_au"]?.toDouble(),
    periapsisAu: json["periapsis_au"]?.toDouble(),
    semiMajorAxisAu: json["semi_major_axis_au"]?.toDouble(),
    eccentricity: json["eccentricity"]?.toDouble(),
    inclination: json["inclination"]?.toDouble(),
    longitude: json["longitude"]?.toDouble(),
    periapsisArg: json["periapsis_arg"]?.toDouble(),
    periodDays: json["period_days"]?.toDouble(),
    speedKph: json["speed_kph"]?.toDouble(),
    speedMph: json["speed_mph"]?.toDouble(),
    earthDistanceKm: json["earth_distance_km"]?.toDouble(),
    earthDistanceMi: json["earth_distance_mi"]?.toDouble(),
    marsDistanceKm: json["mars_distance_km"]?.toDouble(),
    marsDistanceMi: json["mars_distance_mi"]?.toDouble(),
    flickrImages: json["flickr_images"] == null ? [] : List<String>.from(json["flickr_images"]!.map((x) => x)),
    wikipedia: json["wikipedia"],
    video: json["video"],
    details: json["details"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "launch_date_utc": launchDateUtc?.toIso8601String(),
    "launch_date_unix": launchDateUnix,
    "launch_mass_kg": launchMassKg,
    "launch_mass_lbs": launchMassLbs,
    "norad_id": noradId,
    "epoch_jd": epochJd,
    "orbit_type": orbitType,
    "apoapsis_au": apoapsisAu,
    "periapsis_au": periapsisAu,
    "semi_major_axis_au": semiMajorAxisAu,
    "eccentricity": eccentricity,
    "inclination": inclination,
    "longitude": longitude,
    "periapsis_arg": periapsisArg,
    "period_days": periodDays,
    "speed_kph": speedKph,
    "speed_mph": speedMph,
    "earth_distance_km": earthDistanceKm,
    "earth_distance_mi": earthDistanceMi,
    "mars_distance_km": marsDistanceKm,
    "mars_distance_mi": marsDistanceMi,
    "flickr_images": flickrImages == null ? [] : List<dynamic>.from(flickrImages!.map((x) => x)),
    "wikipedia": wikipedia,
    "video": video,
    "details": details,
  };
}
