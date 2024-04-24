import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class OneCapsulesAPI extends StatefulWidget {
  const OneCapsulesAPI({super.key});

  @override
  State<OneCapsulesAPI> createState() => _OneCapsulesAPIState();
}

class _OneCapsulesAPIState extends State<OneCapsulesAPI> {
  OneCapsulesModel? oneCapsulesModel;
  final dio = Dio();

  Future<OneCapsulesModel> getOneLaunchAPI() async {
    Response response =
        await dio.get('https://api.spacexdata.com/v3/capsules/C112');
    if (kDebugMode) {
      print("ONE CAPSULES");
    }
    if (kDebugMode) {
      print(response);
    }
    OneCapsulesModel launchModel = OneCapsulesModel.fromJson(response.data);
    setState(() {
      oneCapsulesModel = launchModel;
    });
    return launchModel;
  }

  @override
  void initState() {
    // TODO: implement initState
    getOneLaunchAPI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Scaffold(
        body: ListView.builder(
          itemCount: oneCapsulesModel == null ? 0 : 1,
          itemBuilder: (context, index) {
            var data = oneCapsulesModel;
            return Card(
              color: Colors.purple[100],
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data?.capsuleSerial ?? "NA",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 26,
                      ),
                    ),
                    Text(
                      "${data?.details}",
                      style: const TextStyle(
                        fontSize: 21,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "capsuleSerial: ${data?.capsuleSerial ?? ""}",
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    Text("Type: ${data?.type}"),
                    Text("OriginalLaunch: ${data?.originalLaunch}"),
                    Text("OriginalLaunchUnix: ${data?.originalLaunchUnix}"),
                    Text("Landings: ${data?.landings}"),
                    Text("ReuseCount: ${data?.reuseCount}"),
                    Text("Name: ${data?.missions?[0].name}"),
                    Text("Flight: ${data?.missions?[0].flight}"),
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

// To parse this JSON data, do
//
//     final oneCapsulesModel = oneCapsulesModelFromJson(jsonString);

class OneCapsulesModel {
  String? capsuleSerial;
  String? capsuleId;
  String? status;
  DateTime? originalLaunch;
  int? originalLaunchUnix;
  List<Mission>? missions;
  int? landings;
  String? type;
  dynamic details;
  int? reuseCount;

  OneCapsulesModel({
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

  OneCapsulesModel copyWith({
    String? capsuleSerial,
    String? capsuleId,
    String? status,
    DateTime? originalLaunch,
    int? originalLaunchUnix,
    List<Mission>? missions,
    int? landings,
    String? type,
    dynamic details,
    int? reuseCount,
  }) =>
      OneCapsulesModel(
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

  factory OneCapsulesModel.fromRawJson(String str) =>
      OneCapsulesModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OneCapsulesModel.fromJson(Map<String, dynamic> json) =>
      OneCapsulesModel(
        capsuleSerial: json["capsule_serial"],
        capsuleId: json["capsule_id"],
        status: json["status"],
        originalLaunch: json["original_launch"] == null
            ? null
            : DateTime.parse(json["original_launch"]),
        originalLaunchUnix: json["original_launch_unix"],
        missions: json["missions"] == null
            ? []
            : List<Mission>.from(
                json["missions"]!.map((x) => Mission.fromJson(x))),
        landings: json["landings"],
        type: json["type"],
        details: json["details"],
        reuseCount: json["reuse_count"],
      );

  Map<String, dynamic> toJson() => {
        "capsule_serial": capsuleSerial,
        "capsule_id": capsuleId,
        "status": status,
        "original_launch": originalLaunch?.toIso8601String(),
        "original_launch_unix": originalLaunchUnix,
        "missions": missions == null
            ? []
            : List<dynamic>.from(missions!.map((x) => x.toJson())),
        "landings": landings,
        "type": type,
        "details": details,
        "reuse_count": reuseCount,
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
