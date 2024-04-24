import 'package:flutter/material.dart';

class CheckBoxWidgetScreen extends StatefulWidget {
  const CheckBoxWidgetScreen({Key? key}) : super(key: key);

  @override
  State<CheckBoxWidgetScreen> createState() => _CheckBoxWidgetScreenState();
}

class _CheckBoxWidgetScreenState extends State<CheckBoxWidgetScreen> {
  List<Map> availableHobbies = [
    {"name": "Football", "isChecked": false},
    {"name": "Baseball", "isChecked": false},
    {"name": "Cricket", "isChecked": false},
    {"name": "Kabaddi", "isChecked": false},
    {"name": "BasketBall", "isChecked": false},
    {"name": "VolleyBall", "isChecked": false},
    {"name": "Other Games", "isChecked": false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // The checkboxes will be here
            Column(
              children: availableHobbies.map(
                (hobby) {
                  return ListTile(
                    title: Text(hobby["name"]),
                    leading: Checkbox(
                      value: hobby["isChecked"],
                      onChanged: (value) {
                        setState(() {
                          hobby["isChecked"] = value;
                        });
                      },
                    ),
                  );
                },
              ).toList(),
            ),

            Column(
              children: [
                const Center(
                    child: Text(
                  "Selected Games:",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                )),
                const SizedBox(height: 10),
                Wrap(
                  alignment: WrapAlignment.center,
                  children: availableHobbies.map(
                    (hobby) {
                      if (hobby["isChecked"] == true) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("${hobby["name"]},"),
                        );
                      }
                      return Container();
                    },
                  ).toList(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
