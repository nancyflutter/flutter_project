import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/Screens/DartCodeFilesForExampleView/SpaceXModelAPIs/Models/one_ship_model_.dart';

class OneShipAPIScreen extends StatefulWidget {
  const OneShipAPIScreen({super.key});

  @override
  State<OneShipAPIScreen> createState() => _OneShipAPIScreenState();
}

class _OneShipAPIScreenState extends State<OneShipAPIScreen> {
  OneShipModel? oneShipModel;
  final dio = Dio();

  Future<OneShipModel> getOneLaunchAPI() async {
    Response response =
        await dio.get('https://api.spacexdata.com/v3/ships/AMERICANCHAMPION');
    if (kDebugMode) {
      print("One Ship API");
    }
    if (kDebugMode) {
      print(response);
    }
    OneShipModel oneShipData = OneShipModel.fromJson(response.data);
    setState(() {
      oneShipModel = oneShipData;
    });
    return oneShipData;
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
        body: oneShipModel == null
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: oneShipModel == null ? 0 : 1,
                itemBuilder: (BuildContext context, int index) {
                  var data = oneShipModel;
                  return Card(
                    color: Colors.teal[100],
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${data?.homePort}",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "${data?.shipType}",
                          ),
                          Text("${data?.shipName}"),
                          Text("${data?.shipId}"),
                          Text("${data?.active}"),
                          Text("${data?.status}"),
                          Text("${data?.abs}"),
                          Text("${data?.missions?[index].name}"),
                          Text("${data?.missions?[index].flight}"),
                          Text("${data?.url}"),
                          Text("${data?.oneShipModelClass}"),
                          Text("${data?.imo}"),
                          Text("${data?.mmsi}"),
                          Text("${data?.roles}"),
                          Image.network("${data?.image}")
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
