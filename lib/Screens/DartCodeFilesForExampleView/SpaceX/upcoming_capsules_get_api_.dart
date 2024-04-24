import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class UpComingCapsulesAPI extends StatefulWidget {
  const UpComingCapsulesAPI({super.key});

  @override
  State<UpComingCapsulesAPI> createState() => _UpComingCapsulesAPIState();
}

class _UpComingCapsulesAPIState extends State<UpComingCapsulesAPI> {
  late Future<List<UpcomingCapsulesModel>> upComingCapsules;
  final dio = Dio();


  Future<List<UpcomingCapsulesModel>> getUpComingCapsulesAPI() async {
    try {
      final response = await dio.get('https://api.spacexdata.com/v3/capsules/upcoming');
      if (response.statusCode == 200) {
        if (kDebugMode) {
          print("UpComing Capsules API");
        }
        if (kDebugMode) {
          print(response);
        }
        final List<dynamic> jsonResponse = response.data;
        List<UpcomingCapsulesModel> responseData = [];
        for (var launchData in jsonResponse) {
          responseData.add(UpcomingCapsulesModel.fromJson(launchData));
        }
        return responseData;
      } else {
        if (kDebugMode) {
          print("statusCode:--------------->> ${response.statusCode}");
        }
        throw Exception("Failed to load data");
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error: ------------>>> $e");
      }
      throw Exception("Failed to load data");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    upComingCapsules = getUpComingCapsulesAPI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<UpcomingCapsulesModel>>(
          future: upComingCapsules,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text("Error: ${snapshot.error}"),
              );
            } else if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  var data = snapshot.data![index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      tileColor: Colors.deepPurple[100],
                      contentPadding: const EdgeInsets.all(10),
                      leading: Text("${data.capsuleSerial}"),
                      title: Text(data.type ?? ""),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Details: ${data.details ?? ""}"),
                          Text("Type: ${data.type}"),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                UpComingCapsulesDetailsScreen(data: data),
                          ),
                        );
                        setState(() {});
                      },
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: Text("No data available."),
              );
            }
          },
        ),
      ),
    );
  }
}



class UpComingCapsulesDetailsScreen extends StatelessWidget {
  final UpcomingCapsulesModel? data;

  const UpComingCapsulesDetailsScreen({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[200],
        title: Text(
          "${data?.type}",
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          color: Colors.deepPurple[100],
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data?.details ?? "",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


/// ---------------------------Upcoming Capsules Model--------------------------
///
// To parse this JSON data, do
//
//     final upcomingCapsulesModel = upcomingCapsulesModelFromJson(jsonString);

class UpcomingCapsulesModel {
  String? capsuleSerial;
  String? capsuleId;
  String? status;
  dynamic originalLaunch;
  dynamic originalLaunchUnix;
  List<dynamic>? missions;
  int? landings;
  String? type;
  String? details;
  int? reuseCount;

  UpcomingCapsulesModel({
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

  UpcomingCapsulesModel copyWith({
    String? capsuleSerial,
    String? capsuleId,
    String? status,
    dynamic originalLaunch,
    dynamic originalLaunchUnix,
    List<dynamic>? missions,
    int? landings,
    String? type,
    String? details,
    int? reuseCount,
  }) =>
      UpcomingCapsulesModel(
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

  factory UpcomingCapsulesModel.fromRawJson(String str) =>
      UpcomingCapsulesModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UpcomingCapsulesModel.fromJson(Map<String, dynamic> json) =>
      UpcomingCapsulesModel(
        capsuleSerial: json["capsule_serial"],
        capsuleId: json["capsule_id"],
        status: json["status"],
        originalLaunch: json["original_launch"],
        originalLaunchUnix: json["original_launch_unix"],
        missions: json["missions"] == null
            ? []
            : List<dynamic>.from(json["missions"]!.map((x) => x)),
        landings: json["landings"],
        type: json["type"],
        details: json["details"],
        reuseCount: json["reuse_count"],
      );

  Map<String, dynamic> toJson() => {
        "capsule_serial": capsuleSerial,
        "capsule_id": capsuleId,
        "status": status,
        "original_launch": originalLaunch,
        "original_launch_unix": originalLaunchUnix,
        "missions":
            missions == null ? [] : List<dynamic>.from(missions!.map((x) => x)),
        "landings": landings,
        "type": type,
        "details": details,
        "reuse_count": reuseCount,
      };
}
