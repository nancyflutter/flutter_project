// https://api.spacexdata.com/v3/launches

//------------------------------------------------------------------------------
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AllLaunchesNormal extends StatefulWidget {
  const AllLaunchesNormal({super.key});

  @override
  State<AllLaunchesNormal> createState() => _AllLaunchesNormalState();
}

class _AllLaunchesNormalState extends State<AllLaunchesNormal> {
  List<Launch> launchList = [];
  final dio = Dio();

  void getApiData() async {
    try {
      final response = await dio.get('https://api.spacexdata.com/v3/launches');
      if (kDebugMode) {
        print("ALL Launches API");
      }
      if (kDebugMode) {
        print(response);
      }

      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = response.data;
        List<Launch> launchListData = [];

        for (var launchData in jsonResponse) {
          launchListData.add(Launch.fromJson(launchData));
        }

        setState(() {
          launchList = launchListData;
        });
      } else {
        if (kDebugMode) {
          print("statusCode:--------------->> ${response.statusCode}");
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error: ------------>>> $e");
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getApiData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        body: launchList.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : ListView.separated(
                itemCount: launchList.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 15),
                itemBuilder: (context, index) {
                  final data = launchList[index];
                  return Card(
                    color: Colors.green[100],
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: Colors.green,
                      ),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                AllLaunchesDetailsScreen(data: data),
                          ),
                        );
                        setState(() {});
                      },
                      contentPadding: const EdgeInsets.all(8),
                      // tileColor: Colors.lightGreen[100],
                      leading: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text("${data.flightNumber}"),
                      ),
                      title: Text(data.missionName ?? "NA",
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Launch Year: ${data.launchYear}'),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}

class AllLaunchesDetailsScreen extends StatelessWidget {
  final Launch? data;

  const AllLaunchesDetailsScreen({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[200],
          title: Text(
            "${data?.missionName}",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green.shade900),
          ),
          automaticallyImplyLeading: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            color: Colors.green[100],
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                color: Colors.green,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView(
                children: [
                  Text(data?.details ?? "",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  Text("Upcoming: ${data?.upcoming.toString() ?? ""}"),
                  Text('Flight Number: ${data?.flightNumber ?? ""}'),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Image(
                        image: NetworkImage("${data?.links?.missionPatch}")),
                  ),
                  Text('RocketName: ${data?.rocket?.rocketName ?? "-"}'),
                  Text('RocketId: ${data?.rocket?.rocketId ?? "-"}'),
                  Text('RocketType: ${data?.rocket?.rocketType ?? ""}'),
                  Text('Recovered: ${data?.rocket?.fairings?.recovered ?? ""}'),
                  Text('Ships: ${data?.rocket?.fairings?.ships?.length ?? ""}'),
                  Text('Orbit: ${data?.rocket?.secondStage?.payloads?[0].orbit ?? "-"}'),
                  Text('Manufacturer: ${data?.rocket?.secondStage?.payloads?[0].manufacturer ?? "-"}'),
                  Text('Customers: ${data?.rocket?.secondStage?.payloads?[0].customers ?? "-"}'),
                  Text('Reused: ${data?.rocket?.secondStage?.payloads?[0].reused ?? "-"}'),
                  Text('Nationality: ${data?.rocket?.secondStage?.payloads?[0].nationality ?? "-"}'),
                  Text('OrbitParams: ${data?.rocket?.secondStage?.payloads?[0].orbitParams?.apoapsisKm ?? "-"}'),
                  Text(
                      'CoreSerial: ${data?.rocket?.firstStage?.cores?[0].coreSerial ?? ""}'),
                  Text(
                      'SecondStage block: ${data?.rocket?.secondStage?.block ?? ""}'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// --------------------------- AllLaunchesNormal -----------------------------//

// To parse this JSON data, do
//
//   final launch = launchFromJson(jsonString);

class AllLaunchesResponse {
  List<Launch>? launches;

  AllLaunchesResponse({
    this.launches,
  });

  factory AllLaunchesResponse.fromJson(String jsonString) {
    final List<dynamic> jsonData = json.decode(jsonString);
    final List<Launch> launches =
        jsonData.map((e) => Launch.fromJson(e)).toList();
    return AllLaunchesResponse(launches: launches);
  }
}

class Launch {
  int? flightNumber;
  String? missionName;
  List<String>? missionId;
  bool? upcoming;
  String? launchYear;
  int? launchDateUnix;
  DateTime? launchDateUtc;
  DateTime? launchDateLocal;
  bool? isTentative;
  TentativeMaxPrecision? tentativeMaxPrecision;
  bool? tbd;
  int? launchWindow;
  Rocket? rocket;
  List<String>? ships;
  Telemetry? telemetry;
  LaunchSite? launchSite;
  bool? launchSuccess;
  LaunchFailureDetails? launchFailureDetails;
  Links? links;
  String? details;
  DateTime? staticFireDateUtc;
  int? staticFireDateUnix;
  Map<String, int?>? timeline;
  List<dynamic>? crew;
  DateTime? lastDateUpdate;
  DateTime? lastLlLaunchDate;
  DateTime? lastLlUpdate;
  DateTime? lastWikiLaunchDate;
  String? lastWikiRevision;
  DateTime? lastWikiUpdate;
  LaunchDateSource? launchDateSource;

  Launch({
    this.flightNumber,
    this.missionName,
    this.missionId,
    this.upcoming,
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
    this.launchFailureDetails,
    this.links,
    this.details,
    this.staticFireDateUtc,
    this.staticFireDateUnix,
    this.timeline,
    this.crew,
    this.lastDateUpdate,
    this.lastLlLaunchDate,
    this.lastLlUpdate,
    this.lastWikiLaunchDate,
    this.lastWikiRevision,
    this.lastWikiUpdate,
    this.launchDateSource,
  });

  factory Launch.fromJson(Map<String, dynamic> json) => Launch(
        flightNumber: json["flight_number"],
        missionName: json["mission_name"],
        missionId: json["mission_id"] == null
            ? []
            : List<String>.from(json["mission_id"].map((x) => x)),
        upcoming: json["upcoming"],
        launchYear: json["launch_year"],
        launchDateUnix: json["launch_date_unix"],
        launchDateUtc: json["launch_date_utc"] == null
            ? null
            : DateTime.parse(json["launch_date_utc"]),
        launchDateLocal: json["launch_date_local"] == null
            ? null
            : DateTime.parse(json["launch_date_local"]),
        isTentative: json["is_tentative"],
        tentativeMaxPrecision:
            tentativeMaxPrecisionValues.map[json["tentative_max_precision"]],
        tbd: json["tbd"],
        launchWindow: json["launch_window"],
        rocket: json["rocket"] == null ? null : Rocket.fromJson(json["rocket"]),
        ships: json["ships"] == null
            ? []
            : List<String>.from(json["ships"].map((x) => x)),
        telemetry: json["telemetry"] == null
            ? null
            : Telemetry.fromJson(json["telemetry"]),
        launchSite: json["launch_site"] == null
            ? null
            : LaunchSite.fromJson(json["launch_site"]),
        launchSuccess: json["launch_success"],
        launchFailureDetails: json["launch_failure_details"] == null
            ? null
            : LaunchFailureDetails.fromJson(json["launch_failure_details"]),
        links: json["links"] == null ? null : Links.fromJson(json["links"]),
        details: json["details"],
        staticFireDateUtc: json["static_fire_date_utc"] == null
            ? null
            : DateTime.parse(json["static_fire_date_utc"]),
        staticFireDateUnix: json["static_fire_date_unix"],
        timeline: json["timeline"] == null
            ? null
            : Map.from(json["timeline"])
                .map((k, v) => MapEntry<String, int?>(k, v)),
        crew: json["crew"] == null
            ? []
            : List<dynamic>.from(json["crew"].map((x) => x)),
        lastDateUpdate: json["last_date_update"] == null
            ? null
            : DateTime.parse(json["last_date_update"]),
        lastLlLaunchDate: json["last_ll_launch_date"] == null
            ? null
            : DateTime.parse(json["last_ll_launch_date"]),
        lastLlUpdate: json["last_ll_update"] == null
            ? null
            : DateTime.parse(json["last_ll_update"]),
        lastWikiLaunchDate: json["last_wiki_launch_date"] == null
            ? null
            : DateTime.parse(json["last_wiki_launch_date"]),
        lastWikiRevision: json["last_wiki_revision"],
        lastWikiUpdate: json["last_wiki_update"] == null
            ? null
            : DateTime.parse(json["last_wiki_update"]),
        launchDateSource: json["launch_date_source"] == null
            ? null
            : launchDateSourceValues.map[json["launch_date_source"]],
      );
}

enum TentativeMaxPrecision { hour }

final tentativeMaxPrecisionValues =
    EnumValues({"hour": TentativeMaxPrecision.hour});

class LaunchFailureDetails {
  int? time;
  int? altitude;
  String? reason;

  LaunchFailureDetails({
    this.time,
    this.altitude,
    this.reason,
  });

  factory LaunchFailureDetails.fromJson(Map<String, dynamic> json) =>
      LaunchFailureDetails(
        time: json["time"],
        altitude: json["altitude"],
        reason: json["reason"],
      );
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

  factory LaunchSite.fromJson(Map<String, dynamic> json) => LaunchSite(
        siteId: json["site_id"],
        siteName: json["site_name"],
        siteNameLong: json["site_name_long"],
      );
}

class Links {
  String? missionPatch;
  String? missionPatchSmall;
  String? redditCampaign;
  String? redditLaunch;
  String? redditRecovery;
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
        flickrImages: json["flickr_images"] == null
            ? []
            : List<String>.from(json["flickr_images"].map((x) => x)),
      );
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

  factory Rocket.fromJson(Map<String, dynamic> json) => Rocket(
        rocketId: json["rocket_id"],
        rocketName: json["rocket_name"],
        rocketType: json["rocket_type"],
        firstStage: json["first_stage"] == null
            ? null
            : FirstStage.fromJson(json["first_stage"]),
        secondStage: json["second_stage"] == null
            ? null
            : SecondStage.fromJson(json["second_stage"]),
        fairings: json["fairings"] == null
            ? null
            : Fairings.fromJson(json["fairings"]),
      );
}

class Fairings {
  bool? reused;
  bool? recoveryAttempt;
  bool? recovered;
  List<dynamic>? ships;

  Fairings({
    this.reused,
    this.recoveryAttempt,
    this.recovered,
    this.ships,
  });

  factory Fairings.fromJson(Map<String, dynamic> json) => Fairings(
        reused: json["reused"],
        recoveryAttempt: json["recovery_attempt"],
        recovered: json["recovered"],
        ships: json["ships"] == null
            ? []
            : List<dynamic>.from(json["ships"].map((x) => x)),
      );
}

class FirstStage {
  List<Core>? cores;

  FirstStage({
    this.cores,
  });

  factory FirstStage.fromJson(Map<String, dynamic> json) => FirstStage(
        cores: json["cores"] == null
            ? []
            : List<Core>.from(json["cores"].map((x) => Core.fromJson(x))),
      );
}

class Core {
  String? coreSerial;
  int? flight;
  dynamic block;
  bool? gridfins;
  bool? legs;
  bool? reused;
  dynamic landSuccess;
  bool? landingIntent;
  LandingType? landingType;
  dynamic landingVehicle;

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

  factory Core.fromJson(Map<String, dynamic> json) => Core(
        coreSerial: json["core_serial"],
        flight: json["flight"],
        block: json["block"],
        gridfins: json["gridfins"],
        legs: json["legs"],
        reused: json["reused"],
        landSuccess: json["land_success"],
        landingIntent: json["landing_intent"],
        landingType: json["landing_type"] == null
            ? null
            : landingTypeValues.map[json["landing_type"]],
        landingVehicle: json["landing_vehicle"],
      );
}

enum LandingType { land }

final landingTypeValues = EnumValues({
  "Land": LandingType.land,
});

class SecondStage {
  int? block;
  List<SecondStagePayload>? payloads;

  SecondStage({
    this.block,
    this.payloads,
  });

  factory SecondStage.fromJson(Map<String, dynamic> json) => SecondStage(
        block: json["block"],
        payloads: json["payloads"] == null
            ? []
            : List<SecondStagePayload>.from(
                json["payloads"].map((x) => SecondStagePayload.fromJson(x))),
      );
}

class SecondStagePayload {
  String? payloadId;
  List<dynamic>? noradId;
  bool? reused;
  List<String>? customers;
  String? nationality;
  String? manufacturer;
  String? payloadType;
  double? payloadMassKg;
  double? payloadMassLbs;
  String? orbit;
  OrbitParams? orbitParams;

  SecondStagePayload({
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

  factory SecondStagePayload.fromJson(Map<String, dynamic> json) =>
      SecondStagePayload(
        payloadId: json["payload_id"],
        noradId: json["norad_id"] == null
            ? []
            : List<dynamic>.from(json["norad_id"].map((x) => x)),
        reused: json["reused"],
        customers: json["customers"] == null
            ? []
            : List<String>.from(json["customers"].map((x) => x)),
        nationality: json["nationality"],
        manufacturer: json["manufacturer"],
        payloadType: json["payload_type"],
        payloadMassKg: json["payload_mass_kg"]?.toDouble(),
        payloadMassLbs: json["payload_mass_lbs"]?.toDouble(),
        orbit: json["orbit"],
        orbitParams: json["orbit_params"] == null
            ? null
            : OrbitParams.fromJson(json["orbit_params"]),
      );
}

class OrbitParams {
  String? referenceSystem;
  String? regime;
  dynamic longitude;
  dynamic semiMajorAxisKm;
  dynamic eccentricity;
  dynamic periapsisKm;
  dynamic apoapsisKm;
  dynamic inclinationDeg;
  dynamic periodMin;
  dynamic lifespanYears;
  dynamic epoch;
  dynamic meanMotion;
  dynamic raan;
  dynamic argOfPericenter;
  dynamic meanAnomaly;

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

  factory OrbitParams.fromJson(Map<String, dynamic> json) => OrbitParams(
        referenceSystem: json["reference_system"],
        regime: json["regime"],
        longitude: json["longitude"],
        semiMajorAxisKm: json["semi_major_axis_km"],
        eccentricity: json["eccentricity"],
        periapsisKm: json["periapsis_km"],
        apoapsisKm: json["apoapsis_km"],
        inclinationDeg: json["inclination_deg"],
        periodMin: json["period_min"],
        lifespanYears: json["lifespan_years"],
        epoch: json["epoch"],
        meanMotion: json["mean_motion"],
        raan: json["raan"],
        argOfPericenter: json["arg_of_pericenter"],
        meanAnomaly: json["mean_anomaly"],
      );
}

class Telemetry {
  String? flightClub;

  Telemetry({
    this.flightClub,
  });

  factory Telemetry.fromJson(Map<String, dynamic> json) => Telemetry(
        flightClub: json["flight_club"],
      );
}

enum LaunchDateSource { wikipedia }

final launchDateSourceValues =
    EnumValues({"wikipedia": LaunchDateSource.wikipedia});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
