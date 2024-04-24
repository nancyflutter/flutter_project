import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'Models/all_landing_pads_model_.dart';

class AllLandingAPIScreen extends StatefulWidget {
  const AllLandingAPIScreen({super.key});

  @override
  State<AllLandingAPIScreen> createState() => _AllLandingAPIScreenState();
}

class _AllLandingAPIScreenState extends State<AllLandingAPIScreen> {
  late Future<List<AllLandingPadsModel>> allLandingPadsList;
  final dio = Dio();

  Future<List<AllLandingPadsModel>> getUpComingCapsulesAPI() async {
    try {
      final response =
      await dio.get('https://api.spacexdata.com/v3/landpads');
      if (response.statusCode == 200) {
        if (kDebugMode) {
          print("All LandPads API");
        }
        if (kDebugMode) {
          print(response);
        }
        final List<dynamic> jsonResponse = response.data;
        List<AllLandingPadsModel> responseData = [];
        for (var launchData in jsonResponse) {
          responseData.add(AllLandingPadsModel.fromJson(launchData));
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
    allLandingPadsList = getUpComingCapsulesAPI();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<AllLandingPadsModel>>(
          future: allLandingPadsList,
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
                        tileColor: Colors.lightBlue[100],
                        contentPadding: const EdgeInsets.all(10),
                        leading: Text("${data.id}"),
                        title: Text("${data.status}"),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("FullName: ${data.fullName ?? ""}"),
                            Text("Details: ${data.details ?? ""}"),
                            Text("Wikipedia: ${data.wikipedia ?? ""}"),
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
