import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/Screens/DartCodeFilesForExampleView/SpaceX/Models/all_pay_load_model_.dart';

class AllPayLoadAPIScreen extends StatefulWidget {
  const AllPayLoadAPIScreen({super.key});

  @override
  State<AllPayLoadAPIScreen> createState() => _AllPayLoadAPIScreenState();
}

class _AllPayLoadAPIScreenState extends State<AllPayLoadAPIScreen> {
  late Future<List<AllPayLoadsModel>> allPayLoadList;
  final dio = Dio();

  Future<List<AllPayLoadsModel>> getAPIData() async {
    try {
      final response = await dio.get('https://api.spacexdata.com/v3/payloads');
      if (response.statusCode == 200) {
        if (kDebugMode) {
          print("All PayLoads API");
        }
        if (kDebugMode) {
          print(response);
        }
        final List<dynamic> jsonResponse = response.data;
        List<AllPayLoadsModel> responseData = [];
        for (var launchData in jsonResponse) {
          responseData.add(AllPayLoadsModel.fromJson(launchData));
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
    allPayLoadList = getAPIData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<AllPayLoadsModel>>(
          future: allPayLoadList,
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
                        leading: Text("${data.payloadMassLbs}"),
                        title: Text("${data.payloadId}"),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Customers: ${data.customers ?? ""}"),
                            Text("Nationality: ${data.nationality ?? ""}"),
                            Text("Manufacturer: ${data.manufacturer ?? ""}"),
                            Text("Orbit: ${data.orbit ?? ""}"),
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
