import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'Models/company_info_model_.dart';

class CompanyInfoAPI extends StatefulWidget {
  const CompanyInfoAPI({super.key});

  @override
  State<CompanyInfoAPI> createState() => _CompanyInfoAPIState();
}

class _CompanyInfoAPIState extends State<CompanyInfoAPI> {
  final dio = Dio();

  Future<CompanyInfoModel> getOneLaunchAPI() async {
    Response response = await dio.get('https://api.spacexdata.com/v3/info');
    if (kDebugMode) {
      print("Company Info API");
    }
    if (kDebugMode) {
      print(response);
    }
    CompanyInfoModel companyInfoData = CompanyInfoModel.fromJson(response.data);
    return companyInfoData;
  }

  @override
  void initState() {
    // TODO: implement initState
    getOneLaunchAPI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Scaffold(
        body: FutureBuilder<CompanyInfoModel>(
          future: getOneLaunchAPI(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text("error"),
              );
            } else {
              var data = snapshot.data;
              return Card(
                elevation: 3,
                color: Colors.teal[100],
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView(
                    children: [
                      Text(data?.name ?? "NA",
                          style: const TextStyle(
                              color: Colors.black, fontSize: 26)),
                      Text("founder: ${data?.founder ?? "-"}",
                          style: const TextStyle(
                              fontSize: 21, color: Colors.black)),
                      Text("ctoPropulsion: ${data?.ctoPropulsion ?? ""}",
                          style: const TextStyle(
                              fontSize: 18, color: Colors.blue)),
                      Text("address: ${data?.headquarters?.address}"),
                      Text("city: ${data?.headquarters?.city}"),
                      Text("state: ${data?.headquarters?.state}"),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
