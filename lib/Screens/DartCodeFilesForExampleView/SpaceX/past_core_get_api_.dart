import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/Screens/DartCodeFilesForExampleView/SpaceX/Models/past_core_model_.dart';

class PastCoreAPIGet extends StatefulWidget {
  const PastCoreAPIGet({super.key});

  @override
  State<PastCoreAPIGet> createState() => _PastCoreAPIGetState();
}

class _PastCoreAPIGetState extends State<PastCoreAPIGet> {
  List<PastCoresModel> pastCoreList = [];
  final dio = Dio();

  void getApiData() async {
    try {
      final response =
      await dio.get('https://api.spacexdata.com/v3/cores/past');
      if (kDebugMode) {
        print("Past Core API");
      }
      if (kDebugMode) {
        print(response);
      }

      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = response.data;
        List<PastCoresModel> pastCapsulesData = [];

        for (var launchData in jsonResponse) {
          pastCapsulesData.add(PastCoresModel.fromJson(launchData));
        }

        setState(() {
          pastCoreList = pastCapsulesData;
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
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView.separated(
          itemCount: pastCoreList.length,
          separatorBuilder: (context, index) => const SizedBox(height: 15),
          itemBuilder: (context, index) {
            final data = pastCoreList[index];
            return Card(
              color: Colors.red[100],
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: Colors.red,
                ),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(10),
                leading: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(data.status ?? "-"),
                ),
                title: Text(data.coreSerial??"-",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Details: ${data.details??"-"}'),
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
