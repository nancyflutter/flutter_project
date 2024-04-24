import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'Models/rocket_model_.dart';

class UsingFutureBuilder extends StatefulWidget {
  const UsingFutureBuilder({Key? key}) : super(key: key);

  @override
  State<UsingFutureBuilder> createState() => _UsingFutureBuilderState();
}

class _UsingFutureBuilderState extends State<UsingFutureBuilder> {
  late Future<List<RocketsModel>> rocketList;
  final dio = Dio();

  Future<List<RocketsModel>> getRocketAPI() async {
    try {
      final response = await dio.get('https://api.spacexdata.com/v3/rockets');
      if (response.statusCode == 200) {
        if (kDebugMode) {
          print("Rockets API");
        }
        if (kDebugMode) {
          print(response);
        }
        final List<dynamic> jsonResponse = response.data;
        List<RocketsModel> rocketResponse = [];
        for (var launchData in jsonResponse) {
          rocketResponse.add(RocketsModel.fromJson(launchData));
        }
        return rocketResponse;
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
    super.initState();
    rocketList = getRocketAPI(); // Assign the future in initState
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Scaffold(
        body: Center(
          child: FutureBuilder<List<RocketsModel>>(
            future: rocketList,
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
                        leading: CircleAvatar(
                          maxRadius: 30,
                          backgroundImage:
                              NetworkImage("${data.flickrImages?[0]}"),
                        ),
                        title: Text(data.country ?? ""),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                "Reusable: ${data.firstStage?.reusable ?? ""}"),
                            Text("ID: ${data.id}"),
                          ],
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  RocketDetailsScreen(data: data),
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
      ),
    );
  }
}

class RocketDetailsScreen extends StatelessWidget {
  final RocketsModel? data;

  const RocketDetailsScreen({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[200],
        title: Text(
          "${data?.country}",
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
                Center(
                  child: Image.network("${data?.flickrImages?[0]}",
                      fit: BoxFit.cover),
                ),
                Text(
                  data?.successRatePct.toString() ?? "",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text("Upcoming: ${data?.active ?? ""}"),
                Text('Flight Number: ${data?.boosters ?? ""}'),
                Text('RocketId: ${data?.height?.feet ?? ""}'),
                Text('RocketName: ${data?.engines?.engineLossMax ?? "-"}'),
                Text('Layout: ${data?.engines?.layout ?? "-"}'),
                Text('Type: ${data?.engines?.type ?? "-"}'),
                Text('Version: ${data?.engines?.version ?? "-"}'),
                Text('ThrustToWeight: ${data?.engines?.thrustToWeight ?? "-"}'),
                Text('EngineLossMax: ${data?.engines?.engineLossMax ?? "-"}'),
                Text('Propellant1: ${data?.engines?.propellant1 ?? "-"}'),
                Text('Propellant2: ${data?.engines?.propellant2 ?? "-"}'),
                Text('Number: ${data?.engines?.number ?? "-"}'),
                Text(
                    'ThrustSeaLevel: ${data?.engines?.thrustSeaLevel?.lbf ?? "-"}'),
                Text(
                    'ThrustVacuum: ${data?.engines?.thrustVacuum?.lbf ?? "-"}'),
                Text('SeaLevel: ${data?.engines?.isp?.seaLevel ?? "-"}'),
                Text('Vacuum: ${data?.engines?.isp?.vacuum ?? "-"}'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
