// // To parse this JSON data, do
// //
// //     final pastCoresModel = pastCoresModelFromJson(jsonString);
//
// import 'dart:convert';
//
// class PastCoresModel {
//   String? coreSerial;
//   dynamic block;
//   Status? status;
//   DateTime? originalLaunch;
//   int? originalLaunchUnix;
//   List<Mission>? missions;
//   int? reuseCount;
//   int? rtlsAttempts;
//   int? rtlsLandings;
//   int? asdsAttempts;
//   int? asdsLandings;
//   bool? waterLanding;
//   String? details;
//
//   PastCoresModel({
//     this.coreSerial,
//     this.block,
//     this.status,
//     this.originalLaunch,
//     this.originalLaunchUnix,
//     this.missions,
//     this.reuseCount,
//     this.rtlsAttempts,
//     this.rtlsLandings,
//     this.asdsAttempts,
//     this.asdsLandings,
//     this.waterLanding,
//     this.details,
//   });
//
//   PastCoresModel copyWith({
//     String? coreSerial,
//     dynamic block,
//     Status? status,
//     DateTime? originalLaunch,
//     int? originalLaunchUnix,
//     List<Mission>? missions,
//     int? reuseCount,
//     int? rtlsAttempts,
//     int? rtlsLandings,
//     int? asdsAttempts,
//     int? asdsLandings,
//     bool? waterLanding,
//     String? details,
//   }) =>
//       PastCoresModel(
//         coreSerial: coreSerial ?? this.coreSerial,
//         block: block ?? this.block,
//         status: status ?? this.status,
//         originalLaunch: originalLaunch ?? this.originalLaunch,
//         originalLaunchUnix: originalLaunchUnix ?? this.originalLaunchUnix,
//         missions: missions ?? this.missions,
//         reuseCount: reuseCount ?? this.reuseCount,
//         rtlsAttempts: rtlsAttempts ?? this.rtlsAttempts,
//         rtlsLandings: rtlsLandings ?? this.rtlsLandings,
//         asdsAttempts: asdsAttempts ?? this.asdsAttempts,
//         asdsLandings: asdsLandings ?? this.asdsLandings,
//         waterLanding: waterLanding ?? this.waterLanding,
//         details: details ?? this.details,
//       );
//
//   factory PastCoresModel.fromRawJson(String str) => PastCoresModel.fromJson(json.decode(str));
//
//   String toRawJson() => json.encode(toJson());
//
//   factory PastCoresModel.fromJson(Map<String, dynamic> json) => PastCoresModel(
//     coreSerial: json["core_serial"],
//     block: json["block"],
//     status: statusValues.map[json["status"]]!,
//     originalLaunch: json["original_launch"] == null ? null : DateTime.parse(json["original_launch"]),
//     originalLaunchUnix: json["original_launch_unix"],
//     missions: json["missions"] == null ? [] : List<Mission>.from(json["missions"]!.map((x) => Mission.fromJson(x))),
//     reuseCount: json["reuse_count"],
//     rtlsAttempts: json["rtls_attempts"],
//     rtlsLandings: json["rtls_landings"],
//     asdsAttempts: json["asds_attempts"],
//     asdsLandings: json["asds_landings"],
//     waterLanding: json["water_landing"],
//     details: json["details"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "core_serial": coreSerial,
//     "block": block,
//     "status": statusValues.reverse[status],
//     "original_launch": originalLaunch?.toIso8601String(),
//     "original_launch_unix": originalLaunchUnix,
//     "missions": missions == null ? [] : List<dynamic>.from(missions!.map((x) => x.toJson())),
//     "reuse_count": reuseCount,
//     "rtls_attempts": rtlsAttempts,
//     "rtls_landings": rtlsLandings,
//     "asds_attempts": asdsAttempts,
//     "asds_landings": asdsLandings,
//     "water_landing": waterLanding,
//     "details": details,
//   };
// }
//
// class Mission {
//   String? name;
//   int? flight;
//
//   Mission({
//     this.name,
//     this.flight,
//   });
//
//   // Mission copyWith({
//   //   String? name,
//   //   int? flight,
//   // }) =>
//   //     Mission(
//   //       name: name ?? this.name,
//   //       flight: flight ?? this.flight,
//   //     );
//   //
//   // factory Mission.fromRawJson(String str) => Mission.fromJson(json.decode(str));
//   //
//   // String toRawJson() => json.encode(toJson());
//
//   factory Mission.fromJson(Map<String, dynamic> json) => Mission(
//     name: json["name"],
//     flight: json["flight"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "name": name,
//     "flight": flight,
//   };
// }
//
// enum Status {
//   ACTIVE,
//   INACTIVE,
//   LOST,
//   UNKNOWN
// }
//
// final statusValues = EnumValues({
//   "active": Status.ACTIVE,
//   "inactive": Status.INACTIVE,
//   "lost": Status.LOST,
//   "unknown": Status.UNKNOWN
// });
//
// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;
//
//   EnumValues(this.map);
//
//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }


import 'dart:convert';

class PastCoresModel {
  String? coreSerial;
  int? block;
  String? status;
  DateTime? originalLaunch;
  int? originalLaunchUnix;
  List<Mission>? missions;
  int? reuseCount;
  int? rtlsAttempts;
  int? rtlsLandings;
  int? asdsAttempts;
  int? asdsLandings;
  bool? waterLanding;
  String? details;

  PastCoresModel({
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

  factory PastCoresModel.fromRawJson(String str) => PastCoresModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PastCoresModel.fromJson(Map<String, dynamic> json) => PastCoresModel(
    coreSerial: json["core_serial"],
    block: json["block"],
    status: json["status"],
    originalLaunch: json["original_launch"] == null ? null : DateTime.parse(json["original_launch"]),
    originalLaunchUnix: json["original_launch_unix"],
    missions: json["missions"] == null ? null : List<Mission>.from(json["missions"].map((x) => Mission.fromJson(x))),
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
    "original_launch": originalLaunch?.toIso8601String(),
    "original_launch_unix": originalLaunchUnix,
    "missions": missions == null ? null : List<dynamic>.from(missions!.map((x) => x.toJson())),
    "reuse_count": reuseCount,
    "rtls_attempts": rtlsAttempts,
    "rtls_landings": rtlsLandings,
    "asds_attempts": asdsAttempts,
    "asds_landings": asdsLandings,
    "water_landing": waterLanding,
    "details": details,
  };
}

class Mission {
  String? name;
  int? flight;

  Mission({
    this.name,
    this.flight,
  });

  factory Mission.fromJson(Map<String, dynamic> json) => Mission(
    name: json["name"],
    flight: json["flight"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "flight": flight,
  };
}

// Usage:
// final response = await dio.get('https://api.spacexdata.com/v3/cores/past');
// final List<dynamic> jsonResponse = response.data;
// List<PastCoresModel> pastCapsulesData = [];
// for (var launchData in jsonResponse) {
//   pastCapsulesData.add(PastCoresModel.fromJson(launchData));
// }