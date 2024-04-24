import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/Screens/DartCodeFilesForExampleView/SpaceXModelAPIs/Models/api_info_model_.dart';

class ApiInfoGETScreen extends StatefulWidget {
  const ApiInfoGETScreen({super.key});

  @override
  State<ApiInfoGETScreen> createState() => _ApiInfoGETScreenState();
}

class _ApiInfoGETScreenState extends State<ApiInfoGETScreen> {
  ApiInfoModel? apiInfoModel;
  final dio = Dio();

  Future<ApiInfoModel> getOneLaunchAPI() async {
    Response response =
        await dio.get('https://api.spacexdata.com/v3');
    if (kDebugMode) {
      print("API Info Api CALL...");
    }
    if (kDebugMode) {
      print(response);
    }
    ApiInfoModel apiInfoData = ApiInfoModel.fromJson(response.data);
    setState(() {
      apiInfoModel = apiInfoData;
    });
    return apiInfoData;
  }

  @override
  void initState() {
    // TODO: implement initState
    getOneLaunchAPI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(10.0),
      child: Scaffold(
        body: ListView.builder(
          itemCount: apiInfoModel == null ? 0 : 1,
          itemBuilder: (context, index) {
            var data = apiInfoModel;
            return Card(
              color: Colors.purple[100],
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data?.projectName ?? "NA",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                      ),
                    ),
                    Text("${data?.description}"
                    ),
                    Text("Version: ${data?.version}"),
                    Text("Organization: ${data?.organization}"),
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
