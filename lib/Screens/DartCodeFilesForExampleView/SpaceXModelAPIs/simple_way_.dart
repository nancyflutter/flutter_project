import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/Screens/DartCodeFilesForExampleView/SpaceXModelAPIs/Models/one_launch_model_.dart';

class SimpleModelTypeAPI extends StatefulWidget {
  const SimpleModelTypeAPI({super.key});

  @override
  State<SimpleModelTypeAPI> createState() => _SimpleModelTypeAPIState();
}

class _SimpleModelTypeAPIState extends State<SimpleModelTypeAPI> {
  OneLaunchModel? oneLaunchModel;
  final dio = Dio();

  Future<OneLaunchModel> getOneLaunchAPI() async {
    Response response =
        await dio.get('https://api.spacexdata.com/v3/launches/67');
    if (kDebugMode) {
      print("ONE LAUNCHES");
    }
    if (kDebugMode) {
      print(response);
    }
    OneLaunchModel oneLaunchData = OneLaunchModel.fromJson(response.data);
    setState(() {
      oneLaunchModel = oneLaunchData;
    });
    return oneLaunchData;
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
          itemCount: oneLaunchModel == null ? 0 : 1,
          itemBuilder: (context, index) {
            var data = oneLaunchModel;
            return Card(
              color: Colors.purple[100],
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "MissionName: ${data?.missionName ?? "NA"}",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 26,
                      ),
                    ),
                    Text(
                      "FlightNumber: ${data?.flightNumber ?? "-"}",
                      style: const TextStyle(
                        fontSize: 21,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "Details: ${data?.details ?? ""}",
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                        "CoreSerial: ${data?.rocket?.firstStage?.cores?[0].coreSerial}"),
                    Text("Block: ${data?.rocket?.firstStage?.cores?[0].block}"),
                    Text(
                        "Flight: ${data?.rocket?.firstStage?.cores?[0].flight}"),
                    Text(
                        "LandingType: ${data?.rocket?.firstStage?.cores?[0].landingType}"),
                    Text(
                        "LandingVehicle: ${data?.rocket?.firstStage?.cores?[0].landingVehicle}"),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network("${data?.links?.flickrImages?[0]}"),
                    ),
                    Text("LaunchYear: ${data?.launchYear}"),
                    Text("Upcoming: ${data?.upcoming}"),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network("${data?.links?.flickrImages?[1]}"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network("${data?.links?.flickrImages?[2]}"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network("${data?.links?.flickrImages?[3]}"),
                    ),
                    Text("SiteId: ${data?.launchSite?.siteId}"),
                    Text("SiteName: ${data?.launchSite?.siteName}"),
                    Text("SiteNameLong: ${data?.launchSite?.siteNameLong}"),
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
