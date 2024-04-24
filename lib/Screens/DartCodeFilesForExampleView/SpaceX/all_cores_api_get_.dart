import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/Screens/DartCodeFilesForExampleView/SpaceX/Models/all_cores_model_.dart';

class AllCoresAPIScreen extends StatefulWidget {
  const AllCoresAPIScreen({super.key});

  @override
  State<AllCoresAPIScreen> createState() => _AllCoresAPIScreenState();
}

class _AllCoresAPIScreenState extends State<AllCoresAPIScreen> {
  List<AllCoresModel> allCoreList = [];
  final dio = Dio();

  void getApiData() async {
    try {
      final response = await dio.get('https://api.spacexdata.com/v3/cores');
      if (kDebugMode) {
        print("ALL Cores API");
      }
      if (kDebugMode) {
        print(response);
      }

      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = response.data;
        List<AllCoresModel> allCoreData = [];

        for (var launchData in jsonResponse) {
          allCoreData.add(AllCoresModel.fromJson(launchData));
        }

        setState(() {
          allCoreList = allCoreData;
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
      body: allCoreList.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.separated(
                itemCount: allCoreList.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 15),
                itemBuilder: (context, index) {
                  final data = allCoreList[index];
                  return Card(
                    color: Colors.green[100],
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: Colors.green,
                      ),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(8),
                      title: Text("${data.status}",
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Details: ${data.details}'),
                          Text('CoreSerial: ${data.coreSerial}'),
                          Text('Block: ${data.block}'),
                          Text('OriginalLaunchUnix: ${data.originalLaunchUnix}'),
                          Text('OriginalLaunch: ${data.originalLaunch}'),
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
