// https://api.spacexdata.com/v3/payloads/Telkom-4

// To parse this JSON data, do
//
//     final onePayloadModel = onePayloadModelFromJson(jsonString);

import 'dart:convert';

class OnePayloadModel {
  String? payloadId;
  List<int>? noradId;
  bool? reused;
  List<String>? customers;
  String? nationality;
  String? manufacturer;
  String? payloadType;
  int? payloadMassKg;
  double? payloadMassLbs;
  String? orbit;
  OrbitParams? orbitParams;

  OnePayloadModel({
    this.payloadId,
    this.noradId,
    this.reused,
    this.customers,
    this.nationality,
    this.manufacturer,
    this.payloadType,
    this.payloadMassKg,
    this.payloadMassLbs,
    this.orbit,
    this.orbitParams,
  });

  OnePayloadModel copyWith({
    String? payloadId,
    List<int>? noradId,
    bool? reused,
    List<String>? customers,
    String? nationality,
    String? manufacturer,
    String? payloadType,
    int? payloadMassKg,
    double? payloadMassLbs,
    String? orbit,
    OrbitParams? orbitParams,
  }) =>
      OnePayloadModel(
        payloadId: payloadId ?? this.payloadId,
        noradId: noradId ?? this.noradId,
        reused: reused ?? this.reused,
        customers: customers ?? this.customers,
        nationality: nationality ?? this.nationality,
        manufacturer: manufacturer ?? this.manufacturer,
        payloadType: payloadType ?? this.payloadType,
        payloadMassKg: payloadMassKg ?? this.payloadMassKg,
        payloadMassLbs: payloadMassLbs ?? this.payloadMassLbs,
        orbit: orbit ?? this.orbit,
        orbitParams: orbitParams ?? this.orbitParams,
      );

  factory OnePayloadModel.fromRawJson(String str) => OnePayloadModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OnePayloadModel.fromJson(Map<String, dynamic> json) => OnePayloadModel(
    payloadId: json["payload_id"],
    noradId: json["norad_id"] == null ? [] : List<int>.from(json["norad_id"]!.map((x) => x)),
    reused: json["reused"],
    customers: json["customers"] == null ? [] : List<String>.from(json["customers"]!.map((x) => x)),
    nationality: json["nationality"],
    manufacturer: json["manufacturer"],
    payloadType: json["payload_type"],
    payloadMassKg: json["payload_mass_kg"],
    payloadMassLbs: json["payload_mass_lbs"]?.toDouble(),
    orbit: json["orbit"],
    orbitParams: json["orbit_params"] == null ? null : OrbitParams.fromJson(json["orbit_params"]),
  );

  Map<String, dynamic> toJson() => {
    "payload_id": payloadId,
    "norad_id": noradId == null ? [] : List<dynamic>.from(noradId!.map((x) => x)),
    "reused": reused,
    "customers": customers == null ? [] : List<dynamic>.from(customers!.map((x) => x)),
    "nationality": nationality,
    "manufacturer": manufacturer,
    "payload_type": payloadType,
    "payload_mass_kg": payloadMassKg,
    "payload_mass_lbs": payloadMassLbs,
    "orbit": orbit,
    "orbit_params": orbitParams?.toJson(),
  };
}

class OrbitParams {
  String? referenceSystem;
  String? regime;
  int? longitude;
  double? semiMajorAxisKm;
  double? eccentricity;
  double? periapsisKm;
  double? apoapsisKm;
  double? inclinationDeg;
  double? periodMin;
  int? lifespanYears;
  DateTime? epoch;
  double? meanMotion;
  double? raan;
  double? argOfPericenter;
  double? meanAnomaly;

  OrbitParams({
    this.referenceSystem,
    this.regime,
    this.longitude,
    this.semiMajorAxisKm,
    this.eccentricity,
    this.periapsisKm,
    this.apoapsisKm,
    this.inclinationDeg,
    this.periodMin,
    this.lifespanYears,
    this.epoch,
    this.meanMotion,
    this.raan,
    this.argOfPericenter,
    this.meanAnomaly,
  });

  OrbitParams copyWith({
    String? referenceSystem,
    String? regime,
    int? longitude,
    double? semiMajorAxisKm,
    double? eccentricity,
    double? periapsisKm,
    double? apoapsisKm,
    double? inclinationDeg,
    double? periodMin,
    int? lifespanYears,
    DateTime? epoch,
    double? meanMotion,
    double? raan,
    double? argOfPericenter,
    double? meanAnomaly,
  }) =>
      OrbitParams(
        referenceSystem: referenceSystem ?? this.referenceSystem,
        regime: regime ?? this.regime,
        longitude: longitude ?? this.longitude,
        semiMajorAxisKm: semiMajorAxisKm ?? this.semiMajorAxisKm,
        eccentricity: eccentricity ?? this.eccentricity,
        periapsisKm: periapsisKm ?? this.periapsisKm,
        apoapsisKm: apoapsisKm ?? this.apoapsisKm,
        inclinationDeg: inclinationDeg ?? this.inclinationDeg,
        periodMin: periodMin ?? this.periodMin,
        lifespanYears: lifespanYears ?? this.lifespanYears,
        epoch: epoch ?? this.epoch,
        meanMotion: meanMotion ?? this.meanMotion,
        raan: raan ?? this.raan,
        argOfPericenter: argOfPericenter ?? this.argOfPericenter,
        meanAnomaly: meanAnomaly ?? this.meanAnomaly,
      );

  factory OrbitParams.fromRawJson(String str) => OrbitParams.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OrbitParams.fromJson(Map<String, dynamic> json) => OrbitParams(
    referenceSystem: json["reference_system"],
    regime: json["regime"],
    longitude: json["longitude"],
    semiMajorAxisKm: json["semi_major_axis_km"]?.toDouble(),
    eccentricity: json["eccentricity"]?.toDouble(),
    periapsisKm: json["periapsis_km"]?.toDouble(),
    apoapsisKm: json["apoapsis_km"]?.toDouble(),
    inclinationDeg: json["inclination_deg"]?.toDouble(),
    periodMin: json["period_min"]?.toDouble(),
    lifespanYears: json["lifespan_years"],
    epoch: json["epoch"] == null ? null : DateTime.parse(json["epoch"]),
    meanMotion: json["mean_motion"]?.toDouble(),
    raan: json["raan"]?.toDouble(),
    argOfPericenter: json["arg_of_pericenter"]?.toDouble(),
    meanAnomaly: json["mean_anomaly"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "reference_system": referenceSystem,
    "regime": regime,
    "longitude": longitude,
    "semi_major_axis_km": semiMajorAxisKm,
    "eccentricity": eccentricity,
    "periapsis_km": periapsisKm,
    "apoapsis_km": apoapsisKm,
    "inclination_deg": inclinationDeg,
    "period_min": periodMin,
    "lifespan_years": lifespanYears,
    "epoch": epoch?.toIso8601String(),
    "mean_motion": meanMotion,
    "raan": raan,
    "arg_of_pericenter": argOfPericenter,
    "mean_anomaly": meanAnomaly,
  };
}
