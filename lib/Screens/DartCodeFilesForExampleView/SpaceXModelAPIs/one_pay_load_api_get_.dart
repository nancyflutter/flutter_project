import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'Models/one_pay_load_model.dart';

class OnePayLoadAPIScreen extends StatefulWidget {
  const OnePayLoadAPIScreen({super.key});

  @override
  State<OnePayLoadAPIScreen> createState() => _OnePayLoadAPIScreenState();
}

class _OnePayLoadAPIScreenState extends State<OnePayLoadAPIScreen> {
  OnePayloadModel? onePayloadModel;
  final dio = Dio();

  Future<OnePayloadModel> getOneLaunchAPI() async {
    Response response =
        await dio.get('https://api.spacexdata.com/v3/payloads/Telkom-4');
    if (kDebugMode) {
      print("One Payload API");
    }
    if (kDebugMode) {
      print(response);
    }
    OnePayloadModel onePayloadData = OnePayloadModel.fromJson(response.data);
    setState(() {
      onePayloadModel = onePayloadData;
    });
    return onePayloadData;
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
        body: onePayloadModel == null
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: onePayloadModel == null ? 0 : 1,
                itemBuilder: (BuildContext context, int index) {
                  var data = onePayloadModel;
                  return Card(
                    color: Colors.teal[100],
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${data?.noradId}",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text("${data?.orbit}"),
                          Text("${data?.nationality}"),
                          Text("${data?.payloadMassLbs}"),
                          Text("${data?.payloadId}"),
                          Text("${data?.manufacturer}"),
                          Text("${data?.orbitParams?.apoapsisKm}"),
                          Text("${data?.orbitParams?.argOfPericenter}"),
                          Text("${data?.orbitParams?.eccentricity}"),
                          Text("${data?.orbitParams?.epoch?.isUtc}"),
                          Text("${data?.orbitParams?.lifespanYears}"),
                          Text("${data?.orbitParams?.meanAnomaly}"),
                          Text("${data?.orbitParams?.regime}"),
                          Text("${data?.orbitParams?.inclinationDeg}"),
                          Text("${data?.orbitParams?.longitude}"),
                          Text("${data?.orbitParams?.meanMotion}"),
                          Text("${data?.orbitParams?.periodMin}"),
                          Text("${data?.orbitParams?.raan}"),
                          Text("${data?.customers}"),
                          Text("${data?.reused}"),
                          Text("${data?.payloadMassKg}"),
                          Text("${data?.payloadType}"),
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
