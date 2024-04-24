import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'Models/one_history_model.dart';

class OneHistoryAPIScreen extends StatefulWidget {
  const OneHistoryAPIScreen({super.key});

  @override
  State<OneHistoryAPIScreen> createState() => _OneHistoryAPIScreenState();
}

class _OneHistoryAPIScreenState extends State<OneHistoryAPIScreen> {
  OneHistoryModel? oneHistoryModel;
  final dio = Dio();

  Future<OneHistoryModel> getOneLaunchAPI() async {
    Response response =
        await dio.get('https://api.spacexdata.com/v3/history/1');
    if (kDebugMode) {
      print("One History API");
    }
    if (kDebugMode) {
      print(response);
    }
    OneHistoryModel oneHistoryData = OneHistoryModel.fromJson(response.data);
    setState(() {
      oneHistoryModel = oneHistoryData;
    });
    return oneHistoryData;
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
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        body: oneHistoryModel == null
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: oneHistoryModel == null ? 0 : 1,
                itemBuilder: (BuildContext context, int index) {
                  var data = oneHistoryModel;
                  return Card(
                    color: Colors.teal[100],
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${data?.id}",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "${data?.title}",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            "${data?.details}",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                          Text("Wikipedia: ${data?.links?.wikipedia}"),
                          Text("Article: ${data?.links?.article}"),
                          Text("FlightNumber: ${data?.flightNumber}"),
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
