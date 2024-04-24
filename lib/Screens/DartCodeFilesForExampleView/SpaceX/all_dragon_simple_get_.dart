import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/Screens/DartCodeFilesForExampleView/SpaceX/Models/all_dragon_api_.dart';

class AllDragonApiGet extends StatefulWidget {
  const AllDragonApiGet({super.key});

  @override
  State<AllDragonApiGet> createState() => _AllDragonApiGetState();
}

class _AllDragonApiGetState extends State<AllDragonApiGet> {
  List<AllDragonsModel> allDragon = [];
  final dio = Dio();

  void getApiData() async {
    try {
      final response = await dio.get('https://api.spacexdata.com/v3/dragons');
      if (kDebugMode) {
        print("ALL Dragon API");
      }
      if (kDebugMode) {
        print(response);
      }

      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = response.data;
        List<AllDragonsModel> allDragonData = [];

        for (var launchData in jsonResponse) {
          allDragonData.add(AllDragonsModel.fromJson(launchData));
        }

        setState(() {
          allDragon = allDragonData;
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
          itemCount: allDragon.length,
          separatorBuilder: (context, index) =>
          const SizedBox(height: 15),
          itemBuilder: (context, index) {
            final data = allDragon[index];
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
                  child: Text("${data.id}"),
                ),
                title: Text(data.name ?? "NA",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Description: ${data.description}'),
                    Image.network("${data.flickrImages?[0]}"),
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
