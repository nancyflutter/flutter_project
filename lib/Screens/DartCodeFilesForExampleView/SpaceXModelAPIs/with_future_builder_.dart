import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'Models/roadster_model.dart';

class MapAPIWithFutureBuilder extends StatefulWidget {
  const MapAPIWithFutureBuilder({super.key});

  @override
  State<MapAPIWithFutureBuilder> createState() =>
      _MapAPIWithFutureBuilderState();
}

class _MapAPIWithFutureBuilderState extends State<MapAPIWithFutureBuilder> {
  final dio = Dio();

  Future<RoadsterModel> getOneLaunchAPI() async {
    Response response = await dio.get('https://api.spacexdata.com/v3/roadster');
    if (kDebugMode) {
      print("Roadster API");
    }
    if (kDebugMode) {
      print(response);
    }
    RoadsterModel roadsterData = RoadsterModel.fromJson(response.data);
    return roadsterData;
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
        body: FutureBuilder<RoadsterModel>(
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
                  padding: const EdgeInsets.all(10.0),
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      Text("FlightNumber: ${data?.name ?? "NA"}",
                          style: const TextStyle(
                              color: Colors.black, fontSize: 26)),
                      Text("MissionName: ${data?.details ?? "-"}",
                          style: const TextStyle(
                              fontSize: 21, color: Colors.black)),
                      Text("Wikipedia: ${data?.wikipedia ?? ""}",
                          style: const TextStyle(
                              fontSize: 18, color: Colors.blue)),
                      Image.network("${data?.flickrImages?[0]}"),
                      const Divider(),
                      Image.network("${data?.flickrImages?[1]}"),
                      const Divider(),
                      Image.network("${data?.flickrImages?[2]}"),
                      const Divider(),
                      Image.network("${data?.flickrImages?[3]}"),
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
