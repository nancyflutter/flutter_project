import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'Models/one_rocket_model.dart';

class OneRocketAPIScreen extends StatefulWidget {
  const OneRocketAPIScreen({super.key});

  @override
  State<OneRocketAPIScreen> createState() => _OneRocketAPIScreenState();
}

class _OneRocketAPIScreenState extends State<OneRocketAPIScreen> {
  OneRocketModel? oneRocketModel;
  final dio = Dio();

  Future<OneRocketModel> getOneLaunchAPI() async {
    Response response =
        await dio.get('https://api.spacexdata.com/v3/rockets/falcon9');
    if (kDebugMode) {
      print("One Rocket API");
    }
    if (kDebugMode) {
      print(response);
    }
    OneRocketModel oneRocketData = OneRocketModel.fromJson(response.data);
    setState(() {
      oneRocketModel = oneRocketData;
    });
    return oneRocketData;
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
        body: oneRocketModel == null
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: oneRocketModel == null ? 0 : 1,
                itemBuilder: (BuildContext context, int index) {
                  var data = oneRocketModel;
                  return Card(
                    color: Colors.teal[100],
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${data?.id}",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text("${data?.rocketName}"),
                          Text("${data?.description}"),
                          Text("${data?.active}"),
                          Text("${data?.country}"),
                          Text("${data?.company}"),
                          Text("${data?.costPerLaunch}"),
                          Text("${data?.payloadWeights?[index].name}"),
                          Text("${data?.payloadWeights?[index].id}"),
                          Text("${data?.payloadWeights?[index].kg}"),
                          Text("${data?.payloadWeights?[index].lb}"),
                          const Divider(),
                          Image.network("${data?.flickrImages?[0]}"),
                          const Divider(),
                          Image.network("${data?.flickrImages?[1]}"),
                          const Divider(),
                          Image.network("${data?.flickrImages?[2]}"),
                          const Divider(),
                          Image.network("${data?.flickrImages?[3]}"),
                          const Divider(),
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
