import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/Screens/DartCodeFilesForExampleView/SpaceX/Models/all_capsules_model.dart';

class AllCapsulesAPI extends StatefulWidget {
  const AllCapsulesAPI({super.key});

  @override
  State<AllCapsulesAPI> createState() => _AllCapsulesAPIState();
}

class _AllCapsulesAPIState extends State<AllCapsulesAPI> {
  List<AllCapsulesModel> allCapsules = [];
  final dio = Dio();

  void getApiData() async {
    try {
      final response = await dio.get('https://api.spacexdata.com/v3/capsules');
      if (kDebugMode) {
        print("ALL Capsules API");
      }
      if (kDebugMode) {
        print(response);
      }

      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = response.data;
        List<AllCapsulesModel> allCapsulesData = [];

        for (var launchData in jsonResponse) {
          allCapsulesData.add(AllCapsulesModel.fromJson(launchData));
        }

        setState(() {
          allCapsules = allCapsulesData;
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
      body: allCapsules.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.separated(
                itemCount: allCapsules.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 15),
                itemBuilder: (context, index) {
                  final data = allCapsules[index];
                  return Card(
                    color: Colors.green[100],
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: Colors.green,
                      ),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                AllCapsulesDetailScreen(data: data),
                          ),
                        );
                      },
                      contentPadding: const EdgeInsets.all(8),
                      // tileColor: Colors.lightGreen[100],
                      leading: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text("${data.capsuleSerial}"),
                      ),
                      title: Text(data.missions?[0].name ?? "NA",
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
class AllCapsulesDetailScreen extends StatelessWidget {
  final AllCapsulesModel? data;

  const AllCapsulesDetailScreen({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[200],
          title: Text(
            "${data?.capsuleSerial}",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green.shade900),
          ),
          automaticallyImplyLeading: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            color: Colors.green[100],
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                color: Colors.green,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView(
                children: [
                  Text(data?.details ?? "",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  Text("${data?.type ?? ""}"),
                  Text('Missions: ${data?.missions?[0].name ?? ""}'),
                  Text('Flight: ${data?.missions?[0].flight ?? ""}'),
                  Text('Landings: ${data?.landings ?? ""}'),
                  Text('OriginalLaunch: ${data?.originalLaunch ?? ""}'),
                  Text('ReuseCount: ${data?.reuseCount ?? ""}'),
                  Text('Status: ${data?.status ?? ""}'),
                  Text('OriginalLaunchUnix: ${data?.originalLaunchUnix ?? ""}'),
                  Text('IsUtc: ${data?.originalLaunch?.isUtc ?? ""}'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}