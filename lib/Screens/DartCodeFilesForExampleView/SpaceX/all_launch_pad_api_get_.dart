import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'Models/all_launch_pad_model_.dart';

class AllLaunchPadAPIScreen extends StatefulWidget {
  const AllLaunchPadAPIScreen({super.key});

  @override
  State<AllLaunchPadAPIScreen> createState() => _AllLaunchPadAPIScreenState();
}

class _AllLaunchPadAPIScreenState extends State<AllLaunchPadAPIScreen> {
  List<AllLaunchPadModel> allLaunchList = [];
  final dio = Dio();

  void getApiData() async {
    try {
      final response = await dio.get('https://api.spacexdata.com/v3/launchpads');
      if (kDebugMode) {
        print("ALL LaunchPad API");
      }
      if (kDebugMode) {
        print(response);
      }

      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = response.data;
        List<AllLaunchPadModel> allCoreData = [];

        for (var launchData in jsonResponse) {
          allCoreData.add(AllLaunchPadModel.fromJson(launchData));
        }

        setState(() {
          allLaunchList = allCoreData;
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
      body: allLaunchList.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.separated(
          itemCount: allLaunchList.length,
          separatorBuilder: (context, index) =>
          const SizedBox(height: 15),
          itemBuilder: (context, index) {
            final data = allLaunchList[index];
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
                    Text('Name: ${data.name}'),
                    Text('Details: ${data.details}'),
                    Text('Status: ${data.status}'),
                    Text('SiteId: ${data.siteId}'),
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
