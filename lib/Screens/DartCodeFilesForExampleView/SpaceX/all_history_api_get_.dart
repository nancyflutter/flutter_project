import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/Screens/DartCodeFilesForExampleView/SpaceX/Models/all_history_model_.dart';

class AllHistoryAPIGet extends StatefulWidget {
  const AllHistoryAPIGet({super.key});

  @override
  State<AllHistoryAPIGet> createState() => _AllHistoryAPIGetState();
}

class _AllHistoryAPIGetState extends State<AllHistoryAPIGet> {
  List<AllHistoryModel> allHistory = [];
  final dio = Dio();

  void getApiData() async {
    try {
      final response = await dio.get('https://api.spacexdata.com/v3/history');
      if (kDebugMode) {
        print("ALL History API");
      }
      if (kDebugMode) {
        print(response);
      }

      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = response.data;
        List<AllHistoryModel> allCoreData = [];

        for (var launchData in jsonResponse) {
          allCoreData.add(AllHistoryModel.fromJson(launchData));
        }

        setState(() {
          allHistory = allCoreData;
        });
      } else {
        if (kDebugMode) {
          print("statusCode:--------------->> ${response.statusCode}");
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error: ------------>>> $e");
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getApiData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: allHistory.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.separated(
                itemCount: allHistory.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 15),
                itemBuilder: (context, index) {
                  final data = allHistory[index];
                  return Card(
                    color: Colors.pink[50],
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: Colors.pink,
                      ),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(8),
                      title: Text("${data.id}",
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('title: ${data.title}'),
                          Text('Details: ${data.details}'),
                          Text("article: ${data.links?.article}"),
                          Text("wikipedia: ${data.links?.wikipedia}"),
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
