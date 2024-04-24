// To parse this JSON data, do
//
//     final oneLaunchModel = oneLaunchModelFromJson(jsonString);

import 'dart:convert';

class OneLaunchModel {
  int? flightNumber;
  String? missionName;
  List<dynamic>? missionId;
  String? launchYear;
  int? launchDateUnix;
  DateTime? launchDateUtc;
  DateTime? launchDateLocal;
  bool? isTentative;
  String? tentativeMaxPrecision;
  bool? tbd;
  int? launchWindow;
  Rocket? rocket;
  List<String>? ships;
  Telemetry? telemetry;
  LaunchSite? launchSite;
  bool? launchSuccess;
  Links? links;
  String? details;
  bool? upcoming;
  DateTime? staticFireDateUtc;
  int? staticFireDateUnix;
  Map<String, int>? timeline;
  dynamic crew;

  OneLaunchModel({
    this.flightNumber,
    this.missionName,
    this.missionId,
    this.launchYear,
    this.launchDateUnix,
    this.launchDateUtc,
    this.launchDateLocal,
    this.isTentative,
    this.tentativeMaxPrecision,
    this.tbd,
    this.launchWindow,
    this.rocket,
    this.ships,
    this.telemetry,
    this.launchSite,
    this.launchSuccess,
    this.links,
    this.details,
    this.upcoming,
    this.staticFireDateUtc,
    this.staticFireDateUnix,
    this.timeline,
    this.crew,
  });

  OneLaunchModel copyWith({
    int? flightNumber,
    String? missionName,
    List<dynamic>? missionId,
    String? launchYear,
    int? launchDateUnix,
    DateTime? launchDateUtc,
    DateTime? launchDateLocal,
    bool? isTentative,
    String? tentativeMaxPrecision,
    bool? tbd,
    int? launchWindow,
    Rocket? rocket,
    List<String>? ships,
    Telemetry? telemetry,
    LaunchSite? launchSite,
    bool? launchSuccess,
    Links? links,
    String? details,
    bool? upcoming,
    DateTime? staticFireDateUtc,
    int? staticFireDateUnix,
    Map<String, int>? timeline,
    dynamic crew,
  }) =>
      OneLaunchModel(
        flightNumber: flightNumber ?? this.flightNumber,
        missionName: missionName ?? this.missionName,
        missionId: missionId ?? this.missionId,
        launchYear: launchYear ?? this.launchYear,
        launchDateUnix: launchDateUnix ?? this.launchDateUnix,
        launchDateUtc: launchDateUtc ?? this.launchDateUtc,
        launchDateLocal: launchDateLocal ?? this.launchDateLocal,
        isTentative: isTentative ?? this.isTentative,
        tentativeMaxPrecision: tentativeMaxPrecision ?? this.tentativeMaxPrecision,
        tbd: tbd ?? this.tbd,
        launchWindow: launchWindow ?? this.launchWindow,
        rocket: rocket ?? this.rocket,
        ships: ships ?? this.ships,
        telemetry: telemetry ?? this.telemetry,
        launchSite: launchSite ?? this.launchSite,
        launchSuccess: launchSuccess ?? this.launchSuccess,
        links: links ?? this.links,
        details: details ?? this.details,
        upcoming: upcoming ?? this.upcoming,
        staticFireDateUtc: staticFireDateUtc ?? this.staticFireDateUtc,
        staticFireDateUnix: staticFireDateUnix ?? this.staticFireDateUnix,
        timeline: timeline ?? this.timeline,
        crew: crew ?? this.crew,
      );

  factory OneLaunchModel.fromRawJson(String str) => OneLaunchModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OneLaunchModel.fromJson(Map<String, dynamic> json) => OneLaunchModel(
    flightNumber: json["flight_number"],
    missionName: json["mission_name"],
    missionId: json["mission_id"] == null ? [] : List<dynamic>.from(json["mission_id"]!.map((x) => x)),
    launchYear: json["launch_year"],
    launchDateUnix: json["launch_date_unix"],
    launchDateUtc: json["launch_date_utc"] == null ? null : DateTime.parse(json["launch_date_utc"]),
    launchDateLocal: json["launch_date_local"] == null ? null : DateTime.parse(json["launch_date_local"]),
    isTentative: json["is_tentative"],
    tentativeMaxPrecision: json["tentative_max_precision"],
    tbd: json["tbd"],
    launchWindow: json["launch_window"],
    rocket: json["rocket"] == null ? null : Rocket.fromJson(json["rocket"]),
    ships: json["ships"] == null ? [] : List<String>.from(json["ships"]!.map((x) => x)),
    telemetry: json["telemetry"] == null ? null : Telemetry.fromJson(json["telemetry"]),
    launchSite: json["launch_site"] == null ? null : LaunchSite.fromJson(json["launch_site"]),
    launchSuccess: json["launch_success"],
    links: json["links"] == null ? null : Links.fromJson(json["links"]),
    details: json["details"],
    upcoming: json["upcoming"],
    staticFireDateUtc: json["static_fire_date_utc"] == null ? null : DateTime.parse(json["static_fire_date_utc"]),
    staticFireDateUnix: json["static_fire_date_unix"],
    timeline: Map.from(json["timeline"]!).map((k, v) => MapEntry<String, int>(k, v)),
    crew: json["crew"],
  );

  Map<String, dynamic> toJson() => {
    "flight_number": flightNumber,
    "mission_name": missionName,
    "mission_id": missionId == null ? [] : List<dynamic>.from(missionId!.map((x) => x)),
    "launch_year": launchYear,
    "launch_date_unix": launchDateUnix,
    "launch_date_utc": launchDateUtc?.toIso8601String(),
    "launch_date_local": launchDateLocal?.toIso8601String(),
    "is_tentative": isTentative,
    "tentative_max_precision": tentativeMaxPrecision,
    "tbd": tbd,
    "launch_window": launchWindow,
    "rocket": rocket?.toJson(),
    "ships": ships == null ? [] : List<dynamic>.from(ships!.map((x) => x)),
    "telemetry": telemetry?.toJson(),
    "launch_site": launchSite?.toJson(),
    "launch_success": launchSuccess,
    "links": links?.toJson(),
    "details": details,
    "upcoming": upcoming,
    "static_fire_date_utc": staticFireDateUtc?.toIso8601String(),
    "static_fire_date_unix": staticFireDateUnix,
    "timeline": Map.from(timeline!).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "crew": crew,
  };
}

class LaunchSite {
  String? siteId;
  String? siteName;
  String? siteNameLong;

  LaunchSite({
    this.siteId,
    this.siteName,
    this.siteNameLong,
  });

  LaunchSite copyWith({
    String? siteId,
    String? siteName,
    String? siteNameLong,
  }) =>
      LaunchSite(
        siteId: siteId ?? this.siteId,
        siteName: siteName ?? this.siteName,
        siteNameLong: siteNameLong ?? this.siteNameLong,
      );

  factory LaunchSite.fromRawJson(String str) => LaunchSite.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LaunchSite.fromJson(Map<String, dynamic> json) => LaunchSite(
    siteId: json["site_id"],
    siteName: json["site_name"],
    siteNameLong: json["site_name_long"],
  );

  Map<String, dynamic> toJson() => {
    "site_id": siteId,
    "site_name": siteName,
    "site_name_long": siteNameLong,
  };
}

class Links {
  String? missionPatch;
  String? missionPatchSmall;
  String? redditCampaign;
  String? redditLaunch;
  dynamic redditRecovery;
  String? redditMedia;
  String? presskit;
  String? articleLink;
  String? wikipedia;
  String? videoLink;
  String? youtubeId;
  List<String>? flickrImages;

  Links({
    this.missionPatch,
    this.missionPatchSmall,
    this.redditCampaign,
    this.redditLaunch,
    this.redditRecovery,
    this.redditMedia,
    this.presskit,
    this.articleLink,
    this.wikipedia,
    this.videoLink,
    this.youtubeId,
    this.flickrImages,
  });

  Links copyWith({
    String? missionPatch,
    String? missionPatchSmall,
    String? redditCampaign,
    String? redditLaunch,
    dynamic redditRecovery,
    String? redditMedia,
    String? presskit,
    String? articleLink,
    String? wikipedia,
    String? videoLink,
    String? youtubeId,
    List<String>? flickrImages,
  }) =>
      Links(
        missionPatch: missionPatch ?? this.missionPatch,
        missionPatchSmall: missionPatchSmall ?? this.missionPatchSmall,
        redditCampaign: redditCampaign ?? this.redditCampaign,
        redditLaunch: redditLaunch ?? this.redditLaunch,
        redditRecovery: redditRecovery ?? this.redditRecovery,
        redditMedia: redditMedia ?? this.redditMedia,
        presskit: presskit ?? this.presskit,
        articleLink: articleLink ?? this.articleLink,
        wikipedia: wikipedia ?? this.wikipedia,
        videoLink: videoLink ?? this.videoLink,
        youtubeId: youtubeId ?? this.youtubeId,
        flickrImages: flickrImages ?? this.flickrImages,
      );

  factory Links.fromRawJson(String str) => Links.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    missionPatch: json["mission_patch"],
    missionPatchSmall: json["mission_patch_small"],
    redditCampaign: json["reddit_campaign"],
    redditLaunch: json["reddit_launch"],
    redditRecovery: json["reddit_recovery"],
    redditMedia: json["reddit_media"],
    presskit: json["presskit"],
    articleLink: json["article_link"],
    wikipedia: json["wikipedia"],
    videoLink: json["video_link"],
    youtubeId: json["youtube_id"],
    flickrImages: json["flickr_images"] == null ? [] : List<String>.from(json["flickr_images"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "mission_patch": missionPatch,
    "mission_patch_small": missionPatchSmall,
    "reddit_campaign": redditCampaign,
    "reddit_launch": redditLaunch,
    "reddit_recovery": redditRecovery,
    "reddit_media": redditMedia,
    "presskit": presskit,
    "article_link": articleLink,
    "wikipedia": wikipedia,
    "video_link": videoLink,
    "youtube_id": youtubeId,
    "flickr_images": flickrImages == null ? [] : List<dynamic>.from(flickrImages!.map((x) => x)),
  };
}

class Rocket {
  String? rocketId;
  String? rocketName;
  String? rocketType;
  FirstStage? firstStage;
  SecondStage? secondStage;
  Fairings? fairings;

  Rocket({
    this.rocketId,
    this.rocketName,
    this.rocketType,
    this.firstStage,
    this.secondStage,
    this.fairings,
  });

  Rocket copyWith({
    String? rocketId,
    String? rocketName,
    String? rocketType,
    FirstStage? firstStage,
    SecondStage? secondStage,
    Fairings? fairings,
  }) =>
      Rocket(
        rocketId: rocketId ?? this.rocketId,
        rocketName: rocketName ?? this.rocketName,
        rocketType: rocketType ?? this.rocketType,
        firstStage: firstStage ?? this.firstStage,
        secondStage: secondStage ?? this.secondStage,
        fairings: fairings ?? this.fairings,
      );

  factory Rocket.fromRawJson(String str) => Rocket.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Rocket.fromJson(Map<String, dynamic> json) => Rocket(
    rocketId: json["rocket_id"],
    rocketName: json["rocket_name"],
    rocketType: json["rocket_type"],
    firstStage: json["first_stage"] == null ? null : FirstStage.fromJson(json["first_stage"]),
    secondStage: json["second_stage"] == null ? null : SecondStage.fromJson(json["second_stage"]),
    fairings: json["fairings"] == null ? null : Fairings.fromJson(json["fairings"]),
  );

  Map<String, dynamic> toJson() => {
    "rocket_id": rocketId,
    "rocket_name": rocketName,
    "rocket_type": rocketType,
    "first_stage": firstStage?.toJson(),
    "second_stage": secondStage?.toJson(),
    "fairings": fairings?.toJson(),
  };
}

class Fairings {
  bool? reused;
  bool? recoveryAttempt;
  bool? recovered;
  dynamic ship;

  Fairings({
    this.reused,
    this.recoveryAttempt,
    this.recovered,
    this.ship,
  });

  Fairings copyWith({
    bool? reused,
    bool? recoveryAttempt,
    bool? recovered,
    dynamic ship,
  }) =>
      Fairings(
        reused: reused ?? this.reused,
        recoveryAttempt: recoveryAttempt ?? this.recoveryAttempt,
        recovered: recovered ?? this.recovered,
        ship: ship ?? this.ship,
      );

  factory Fairings.fromRawJson(String str) => Fairings.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Fairings.fromJson(Map<String, dynamic> json) => Fairings(
    reused: json["reused"],
    recoveryAttempt: json["recovery_attempt"],
    recovered: json["recovered"],
    ship: json["ship"],
  );

  Map<String, dynamic> toJson() => {
    "reused": reused,
    "recovery_attempt": recoveryAttempt,
    "recovered": recovered,
    "ship": ship,
  };
}

class FirstStage {
  List<Core>? cores;

  FirstStage({
    this.cores,
  });

  FirstStage copyWith({
    List<Core>? cores,
  }) =>
      FirstStage(
        cores: cores ?? this.cores,
      );

  factory FirstStage.fromRawJson(String str) => FirstStage.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FirstStage.fromJson(Map<String, dynamic> json) => FirstStage(
    cores: json["cores"] == null ? [] : List<Core>.from(json["cores"]!.map((x) => Core.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "cores": cores == null ? [] : List<dynamic>.from(cores!.map((x) => x.toJson())),
  };
}

class Core {
  String? coreSerial;
  int? flight;
  int? block;
  bool? gridfins;
  bool? legs;
  bool? reused;
  bool? landSuccess;
  bool? landingIntent;
  String? landingType;
  String? landingVehicle;

  Core({
    this.coreSerial,
    this.flight,
    this.block,
    this.gridfins,
    this.legs,
    this.reused,
    this.landSuccess,
    this.landingIntent,
    this.landingType,
    this.landingVehicle,
  });

  Core copyWith({
    String? coreSerial,
    int? flight,
    int? block,
    bool? gridfins,
    bool? legs,
    bool? reused,
    bool? landSuccess,
    bool? landingIntent,
    String? landingType,
    String? landingVehicle,
  }) =>
      Core(
        coreSerial: coreSerial ?? this.coreSerial,
        flight: flight ?? this.flight,
        block: block ?? this.block,
        gridfins: gridfins ?? this.gridfins,
        legs: legs ?? this.legs,
        reused: reused ?? this.reused,
        landSuccess: landSuccess ?? this.landSuccess,
        landingIntent: landingIntent ?? this.landingIntent,
        landingType: landingType ?? this.landingType,
        landingVehicle: landingVehicle ?? this.landingVehicle,
      );

  factory Core.fromRawJson(String str) => Core.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Core.fromJson(Map<String, dynamic> json) => Core(
    coreSerial: json["core_serial"],
    flight: json["flight"],
    block: json["block"],
    gridfins: json["gridfins"],
    legs: json["legs"],
    reused: json["reused"],
    landSuccess: json["land_success"],
    landingIntent: json["landing_intent"],
    landingType: json["landing_type"],
    landingVehicle: json["landing_vehicle"],
  );

  Map<String, dynamic> toJson() => {
    "core_serial": coreSerial,
    "flight": flight,
    "block": block,
    "gridfins": gridfins,
    "legs": legs,
    "reused": reused,
    "land_success": landSuccess,
    "landing_intent": landingIntent,
    "landing_type": landingType,
    "landing_vehicle": landingVehicle,
  };
}

class SecondStage {
  int? block;
  List<Payload>? payloads;

  SecondStage({
    this.block,
    this.payloads,
  });

  SecondStage copyWith({
    int? block,
    List<Payload>? payloads,
  }) =>
      SecondStage(
        block: block ?? this.block,
        payloads: payloads ?? this.payloads,
      );

  factory SecondStage.fromRawJson(String str) => SecondStage.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SecondStage.fromJson(Map<String, dynamic> json) => SecondStage(
    block: json["block"],
    payloads: json["payloads"] == null ? [] : List<Payload>.from(json["payloads"]!.map((x) => Payload.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "block": block,
    "payloads": payloads == null ? [] : List<dynamic>.from(payloads!.map((x) => x.toJson())),
  };
}

class Payload {
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

  Payload({
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

  Payload copyWith({
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
      Payload(
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

  factory Payload.fromRawJson(String str) => Payload.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
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

class Telemetry {
  dynamic flightClub;

  Telemetry({
    this.flightClub,
  });

  Telemetry copyWith({
    dynamic flightClub,
  }) =>
      Telemetry(
        flightClub: flightClub ?? this.flightClub,
      );

  factory Telemetry.fromRawJson(String str) => Telemetry.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Telemetry.fromJson(Map<String, dynamic> json) => Telemetry(
    flightClub: json["flight_club"],
  );

  Map<String, dynamic> toJson() => {
    "flight_club": flightClub,
  };
}
