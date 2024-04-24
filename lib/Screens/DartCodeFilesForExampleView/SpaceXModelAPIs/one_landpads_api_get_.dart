import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/Screens/DartCodeFilesForExampleView/SpaceXModelAPIs/Models/onr_land_pad_model_.dart';

class OneLandPadsAPIScreen extends StatefulWidget {
  const OneLandPadsAPIScreen({super.key});

  @override
  State<OneLandPadsAPIScreen> createState() => _OneLandPadsAPIScreenState();
}

class _OneLandPadsAPIScreenState extends State<OneLandPadsAPIScreen> {
  OneLandPadModel? oneLandPadModel;
  final dio = Dio();

  Future<OneLandPadModel> getOneLaunchAPI() async {
    Response response =
        await dio.get('https://api.spacexdata.com/v3/ships/AMERICANCHAMPION');
    if (kDebugMode) {
      print("One Ship API");
    }
    if (kDebugMode) {
      print(response);
    }
    OneLandPadModel oneLandPadData = OneLandPadModel.fromJson(response.data);
    setState(() {
      oneLandPadModel = oneLandPadData;
    });
    return oneLandPadData;
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
        body: oneLandPadModel == null
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: oneLandPadModel == null ? 0 : 1,
                itemBuilder: (BuildContext context, int index) {
                  var data = oneLandPadModel;
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
                          Text(
                            "${data?.fullName}",
                          ),
                          Text(
                            "${data?.details}",
                          ),
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
