// To parse this JSON data, do
//
//     final upcomingCoreModel = upcomingCoreModelFromJson(jsonString);

import 'dart:convert';

class UpcomingCoreModel {
  String? coreSerial;
  int? block;
  String? status;
  dynamic originalLaunch;
  dynamic originalLaunchUnix;
  List<dynamic>? missions;
  int? reuseCount;
  int? rtlsAttempts;
  int? rtlsLandings;
  int? asdsAttempts;
  int? asdsLandings;
  bool? waterLanding;
  String? details;

  UpcomingCoreModel({
    this.coreSerial,
    this.block,
    this.status,
    this.originalLaunch,
    this.originalLaunchUnix,
    this.missions,
    this.reuseCount,
    this.rtlsAttempts,
    this.rtlsLandings,
    this.asdsAttempts,
    this.asdsLandings,
    this.waterLanding,
    this.details,
  });

  UpcomingCoreModel copyWith({
    String? coreSerial,
    int? block,
    String? status,
    dynamic originalLaunch,
    dynamic originalLaunchUnix,
    List<dynamic>? missions,
    int? reuseCount,
    int? rtlsAttempts,
    int? rtlsLandings,
    int? asdsAttempts,
    int? asdsLandings,
    bool? waterLanding,
    String? details,
  }) =>
      UpcomingCoreModel(
        coreSerial: coreSerial ?? this.coreSerial,
        block: block ?? this.block,
        status: status ?? this.status,
        originalLaunch: originalLaunch ?? this.originalLaunch,
        originalLaunchUnix: originalLaunchUnix ?? this.originalLaunchUnix,
        missions: missions ?? this.missions,
        reuseCount: reuseCount ?? this.reuseCount,
        rtlsAttempts: rtlsAttempts ?? this.rtlsAttempts,
        rtlsLandings: rtlsLandings ?? this.rtlsLandings,
        asdsAttempts: asdsAttempts ?? this.asdsAttempts,
        asdsLandings: asdsLandings ?? this.asdsLandings,
        waterLanding: waterLanding ?? this.waterLanding,
        details: details ?? this.details,
      );

  factory UpcomingCoreModel.fromRawJson(String str) => UpcomingCoreModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UpcomingCoreModel.fromJson(Map<String, dynamic> json) => UpcomingCoreModel(
    coreSerial: json["core_serial"],
    block: json["block"],
    status: json["status"],
    originalLaunch: json["original_launch"],
    originalLaunchUnix: json["original_launch_unix"],
    missions: json["missions"] == null ? [] : List<dynamic>.from(json["missions"]!.map((x) => x)),
    reuseCount: json["reuse_count"],
    rtlsAttempts: json["rtls_attempts"],
    rtlsLandings: json["rtls_landings"],
    asdsAttempts: json["asds_attempts"],
    asdsLandings: json["asds_landings"],
    waterLanding: json["water_landing"],
    details: json["details"],
  );

  Map<String, dynamic> toJson() => {
    "core_serial": coreSerial,
    "block": block,
    "status": status,
    "original_launch": originalLaunch,
    "original_launch_unix": originalLaunchUnix,
    "missions": missions == null ? [] : List<dynamic>.from(missions!.map((x) => x)),
    "reuse_count": reuseCount,
    "rtls_attempts": rtlsAttempts,
    "rtls_landings": rtlsLandings,
    "asds_attempts": asdsAttempts,
    "asds_landings": asdsLandings,
    "water_landing": waterLanding,
    "details": details,
  };
}
