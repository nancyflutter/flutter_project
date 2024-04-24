// https://api.spacexdata.com/v3/cores/upcoming

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/Screens/DartCodeFilesForExampleView/SpaceX/Models/upcoming_core_models_.dart';

class UpComingCoreAPIScreen extends StatefulWidget {
  const UpComingCoreAPIScreen({super.key});

  @override
  State<UpComingCoreAPIScreen> createState() => _UpComingCoreAPIScreenState();
}

class _UpComingCoreAPIScreenState extends State<UpComingCoreAPIScreen> {
  late Future<List<UpcomingCoreModel>> upComingCores;
  final dio = Dio();

  Future<List<UpcomingCoreModel>> getUpComingCapsulesAPI() async {
    try {
      final response =
          await dio.get('https://api.spacexdata.com/v3/cores/upcoming');
      if (response.statusCode == 200) {
        if (kDebugMode) {
          print("UpComing Core API");
        }
        if (kDebugMode) {
          print(response);
        }
        final List<dynamic> jsonResponse = response.data;
        List<UpcomingCoreModel> responseData = [];
        for (var launchData in jsonResponse) {
          responseData.add(UpcomingCoreModel.fromJson(launchData));
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
    upComingCores = getUpComingCapsulesAPI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<UpcomingCoreModel>>(
          future: upComingCores,
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
                      leading: Text("${data.status}"),
                      title: Text("${data.block}"),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Details: ${data.details ?? ""}"),
                        ],
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
