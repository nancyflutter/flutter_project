import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/Screens/DartCodeFilesForExampleView/SpaceX/Models/mission_model.dart';

class MissionApiScreen extends StatefulWidget {
  const MissionApiScreen({super.key});

  @override
  State<MissionApiScreen> createState() => _MissionApiScreenState();
}

class _MissionApiScreenState extends State<MissionApiScreen> {
  List<MissionModel> missionList = [];
  final dio = Dio();

  void getMissionAPI() async {
    try {
      final response = await dio.get('https://api.spacexdata.com/v3/missions');
      if (kDebugMode) {
        print("ALL Missions API");
      }
      if (kDebugMode) {
        print(response);
      }

      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = response.data;
        List<MissionModel> missionListData = [];

        for (var launchData in jsonResponse) {
          missionListData.add(MissionModel.fromJson(launchData));
        }

        setState(() {
          missionList = missionListData;
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
    getMissionAPI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        body: ListView.separated(
          itemCount: missionList.length,
          separatorBuilder: (context, index) => const SizedBox(height: 15),
          itemBuilder: (context, index) {
            final data = missionList[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MissionDetailsScreen(data: data),
                  ),
                );
              },
              child: Card(
                color: Colors.indigo[100],
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: Colors.indigo,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data.missionName ?? "NA",
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      Text('Launch Year: ${data.description}'),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class MissionDetailsScreen extends StatelessWidget {
  final MissionModel? data;

  const MissionDetailsScreen({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: Text(
            "${data?.missionName}",
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: Colors.indigo[100],
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data?.missionName ?? "",
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  Text(
                    data?.description ?? "",
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  ),
                  Text('Twitter: ${data?.twitter ?? ""}'),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(10),
                      title: Text(
                          'Manufacturers: ${data?.manufacturers?[0] ?? ""}'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('PayloadIds: ${data?.payloadIds?[0] ?? "-"}'),
                          Text('PayloadIds: ${data?.payloadIds?[1] ?? "-"}'),
                        ],
                      ),
                    ),
                  ),
                  const Text("Wikipedia:"),
                  Text(
                    "${data?.wikipedia}",
                    style: const TextStyle(color: Colors.blue),
                  ),
                  const Text("Twitter:"),
                  Text(
                    "${data?.twitter}",
                    style: const TextStyle(color: Colors.blue),
                  ),
                  const Text("Website:"),
                  Text(
                    "${data?.website}",
                    style: const TextStyle(color: Colors.blue),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
