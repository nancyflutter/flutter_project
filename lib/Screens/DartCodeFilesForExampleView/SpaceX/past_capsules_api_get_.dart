import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/Screens/DartCodeFilesForExampleView/SpaceX/Models/past_capsules_model_.dart';

class PastCapsulesAPI extends StatefulWidget {
  const PastCapsulesAPI({super.key});

  @override
  State<PastCapsulesAPI> createState() => _PastCapsulesAPIState();
}

class _PastCapsulesAPIState extends State<PastCapsulesAPI> {
  List<PastCapsulesModel> pastCapsulesList = [];
  final dio = Dio();

  void getApiData() async {
    try {
      final response =
          await dio.get('https://api.spacexdata.com/v3/capsules/past');
      if (kDebugMode) {
        print("Past Capsules API");
      }
      if (kDebugMode) {
        print(response);
      }

      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = response.data;
        List<PastCapsulesModel> pastCapsulesData = [];

        for (var launchData in jsonResponse) {
          pastCapsulesData.add(PastCapsulesModel.fromJson(launchData));
        }

        setState(() {
          pastCapsulesList = pastCapsulesData;
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
          itemCount: pastCapsulesList.length,
          separatorBuilder: (context, index) => const SizedBox(height: 15),
          itemBuilder: (context, index) {
            final data = pastCapsulesList[index];
            return Card(
              color: Colors.green[100],
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: Colors.green,
                ),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(10),
                leading: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text("${data.capsuleSerial}"),
                ),
                title: Text("${data.type}",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Details: ${data.details}'),
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
