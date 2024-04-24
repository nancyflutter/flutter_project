import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'Models/one_mission_model.dart';

class OneMissionAPIScreen extends StatefulWidget {
  const OneMissionAPIScreen({super.key});

  @override
  State<OneMissionAPIScreen> createState() => _OneMissionAPIScreenState();
}

class _OneMissionAPIScreenState extends State<OneMissionAPIScreen> {
  OneMissionModel? oneMissionModel;
  final dio = Dio();

  Future<OneMissionModel> getOneLaunchAPI() async {
    Response response =
        await dio.get('https://api.spacexdata.com/v3/missions/F3364BF');
    if (kDebugMode) {
      print("One Mission API");
    }
    if (kDebugMode) {
      print(response);
    }
    OneMissionModel oneMissionData = OneMissionModel.fromJson(response.data);
    setState(() {
      oneMissionModel = oneMissionData;
    });
    return oneMissionData;
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
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        body: oneMissionModel == null
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: oneMissionModel == null ? 0 : 1,
                itemBuilder: (BuildContext context, int index) {
                  var data = oneMissionModel;
                  return Card(
                    color: Colors.teal[100],
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${data?.missionId}",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text("${data?.missionName}"),
                          Text("${data?.description}"),
                          Text("${data?.wikipedia}"),
                          Text("${data?.website}"),
                          Text("${data?.twitter}"),
                          Text("${data?.payloadIds}"),
                          Text("${data?.missionId}"),
                          Text("${data?.manufacturers}"),
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
