import 'dart:convert';

// To parse this JSON data, do
//
//     final pastCapsulesModel = pastCapsulesModelFromJson(jsonString);


class PastCapsulesModel {
  String? capsuleSerial;
  CapsuleId? capsuleId;
  String? status;
  DateTime? originalLaunch;
  int? originalLaunchUnix;
  List<Mission>? missions;
  int? landings;
  Type? type;
  String? details;
  int? reuseCount;

  PastCapsulesModel({
    this.capsuleSerial,
    this.capsuleId,
    this.status,
    this.originalLaunch,
    this.originalLaunchUnix,
    this.missions,
    this.landings,
    this.type,
    this.details,
    this.reuseCount,
  });

  PastCapsulesModel copyWith({
    String? capsuleSerial,
    CapsuleId? capsuleId,
    String? status,
    DateTime? originalLaunch,
    int? originalLaunchUnix,
    List<Mission>? missions,
    int? landings,
    Type? type,
    String? details,
    int? reuseCount,
  }) =>
      PastCapsulesModel(
        capsuleSerial: capsuleSerial ?? this.capsuleSerial,
        capsuleId: capsuleId ?? this.capsuleId,
        status: status ?? this.status,
        originalLaunch: originalLaunch ?? this.originalLaunch,
        originalLaunchUnix: originalLaunchUnix ?? this.originalLaunchUnix,
        missions: missions ?? this.missions,
        landings: landings ?? this.landings,
        type: type ?? this.type,
        details: details ?? this.details,
        reuseCount: reuseCount ?? this.reuseCount,
      );

  factory PastCapsulesModel.fromRawJson(String str) => PastCapsulesModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PastCapsulesModel.fromJson(Map<String, dynamic> json) => PastCapsulesModel(
    capsuleSerial: json["capsule_serial"],
    capsuleId: capsuleIdValues.map[json["capsule_id"]]!,
    status: json["status"],
    originalLaunch: json["original_launch"] == null ? null : DateTime.parse(json["original_launch"]),
    originalLaunchUnix: json["original_launch_unix"],
    missions: json["missions"] == null ? [] : List<Mission>.from(json["missions"]!.map((x) => Mission.fromJson(x))),
    landings: json["landings"],
    type: typeValues.map[json["type"]]!,
    details: json["details"],
    reuseCount: json["reuse_count"],
  );

  Map<String, dynamic> toJson() => {
    "capsule_serial": capsuleSerial,
    "capsule_id": capsuleIdValues.reverse[capsuleId],
    "status": status,
    "original_launch": originalLaunch?.toIso8601String(),
    "original_launch_unix": originalLaunchUnix,
    "missions": missions == null ? [] : List<dynamic>.from(missions!.map((x) => x.toJson())),
    "landings": landings,
    "type": typeValues.reverse[type],
    "details": details,
    "reuse_count": reuseCount,
  };
}

enum CapsuleId {
  DRAGON1,
  DRAGON2
}

final capsuleIdValues = EnumValues({
  "dragon1": CapsuleId.DRAGON1,
  "dragon2": CapsuleId.DRAGON2
});

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

enum Type {
  DRAGON_10,
  DRAGON_11,
  DRAGON_20
}

final typeValues = EnumValues({
  "Dragon 1.0": Type.DRAGON_10,
  "Dragon 1.1": Type.DRAGON_11,
  "Dragon 2.0": Type.DRAGON_20
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
