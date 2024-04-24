import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/Screens/DartCodeFilesForExampleView/SpaceX/Models/all_ships_model.dart';

class AllShipApiScreen extends StatefulWidget {
  const AllShipApiScreen({super.key});

  @override
  State<AllShipApiScreen> createState() => _AllShipApiScreenState();
}

class _AllShipApiScreenState extends State<AllShipApiScreen> {
  late Future<List<AllShipsModel>> allShipsList;
  final dio = Dio();

  Future<List<AllShipsModel>> getAPIData() async {
    try {
      final response = await dio.get('https://api.spacexdata.com/v3/ships');
      if (response.statusCode == 200) {
        if (kDebugMode) {
          print("All Ship API");
        }
        if (kDebugMode) {
          print(response);
        }
        final List<dynamic> jsonResponse = response.data;
        List<AllShipsModel> responseData = [];
        for (var launchData in jsonResponse) {
          responseData.add(AllShipsModel.fromJson(launchData));
        }
        return responseData;
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
    // TODO: implement initState
    allShipsList = getAPIData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<AllShipsModel>>(
          future: allShipsList,
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
                    child: Card(
                      elevation: 3,
                      child: ListTile(
                        tileColor: Colors.deepPurple[100],
                        contentPadding: const EdgeInsets.all(10),
                        // leading: Text("${data.shipId}"),
                        title: Text("${data.shipId}"),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("ShipName: ${data.shipName ?? ""}"),
                            Text("Active: ${data.active ?? ""}"),
                            Text("ShipType: ${data.shipType ?? ""}"),
                            Text("HomePort: ${data.homePort ?? ""}"),
                            (data.image == null)
                                ? const SizedBox()
                                : Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 250,
                                      // width: 160,
                                      decoration: BoxDecoration(
                                        color: Colors.indigo[100],
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              data.image.toString()),fit: BoxFit.cover
                                        ),
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                      ),
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
    );
  }
}
