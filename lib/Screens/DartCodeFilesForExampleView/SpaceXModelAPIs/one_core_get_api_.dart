// https://api.spacexdata.com/v3/cores/B1042

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/Screens/DartCodeFilesForExampleView/SpaceXModelAPIs/Models/one_core_model_.dart';

class OneCoreAPIGet extends StatefulWidget {
  const OneCoreAPIGet({super.key});

  @override
  State<OneCoreAPIGet> createState() => _OneCoreAPIGetState();
}

class _OneCoreAPIGetState extends State<OneCoreAPIGet> {
  final dio = Dio();

  Future<OneCoreModel> getOneLaunchAPI() async {
    Response response = await dio.get('https://api.spacexdata.com/v3/cores/B1042');
    if (kDebugMode) {
      print("Cores API");
    }
    if (kDebugMode) {
      print(response);
    }
    OneCoreModel oneCoreData = OneCoreModel.fromJson(response.data);
    return oneCoreData;
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
        body: FutureBuilder<OneCoreModel>(
          future: getOneLaunchAPI(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text("error"),
              );
            } else {
              var data = snapshot.data;
              return Card(
                elevation: 3,
                color: Colors.blueGrey[100],
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView(
                    children: [
                      Text(
                        "Status: ${data?.status ?? "NA"}",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 26,
                        ),
                      ),
                      Text(
                        "Details: ${data?.details ?? "-"}",
                        style: const TextStyle(
                          fontSize: 21,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "OriginalLaunch: ${data?.originalLaunch ?? ""}",
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.blue,
                        ),
                      ),
                      Text("CoreSerial: ${data?.coreSerial}"),
                      Text("OriginalLaunch: ${data?.originalLaunch}"),
                      Text("OriginalLaunchUnix: ${data?.originalLaunchUnix}"),
                      Text("ReuseCount: ${data?.reuseCount}"),
                      Text("AsdsAttempts: ${data?.asdsAttempts}"),
                      Text("AsdsLandings: ${data?.asdsLandings}"),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
