import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/Screens/DartCodeFilesForExampleView/SpaceXModelAPIs/Models/dragons_model_.dart';

class DragonAPIScreen extends StatefulWidget {
  const DragonAPIScreen({super.key});

  @override
  State<DragonAPIScreen> createState() => _DragonAPIScreenState();
}

class _DragonAPIScreenState extends State<DragonAPIScreen> {
  DragonsModel? dragonsModel;
  final dio = Dio();

  Future<DragonsModel> getOneLaunchAPI() async {
    Response response =
        await dio.get('https://api.spacexdata.com/v3/dragons/dragon1');
    if (kDebugMode) {
      print("Dragons API");
    }
    if (kDebugMode) {
      print(response);
    }
    DragonsModel dragonsModel = DragonsModel.fromJson(response.data);
    setState(() {
      dragonsModel = dragonsModel;
    });
    return dragonsModel;
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
        body: dragonsModel == null
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: dragonsModel == null ? 0 : 1,
                itemBuilder: (BuildContext context, int index) {
                  var data = dragonsModel;
                  return Card(
                    color: Colors.teal[100],
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            color: Colors.greenAccent[100],
                            child:
                                Image.network("${data?.flickrImages?[index]}"),
                          ),
                          Text(
                            "${data?.name}",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "${data?.description}",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                          Text("Wikipedia: ${data?.wikipedia}"),
                          Text("Type: ${data?.type}"),
                          Text("Active: ${data?.active}"),
                          Text("SolarArray: ${data?.trunk?.cargo?.solarArray}"),
                          Text("UnpressurizedCargo: ${data?.trunk?.cargo?.unpressurizedCargo}"),
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
