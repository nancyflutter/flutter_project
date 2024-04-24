//================================ START =====================================//

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/Controllers/WidgetController/date_picker_controller.dart';
import 'package:get/get.dart';

class AlertDialogWidget extends StatelessWidget {
  final DatePickerController datePickerController =
      Get.find<DatePickerController>();
  AlertDialogWidget({super.key});


  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _simpleDialogBoxView(context),
            _alertDialogBoxView(context),
            _datePickerDialog(context),
            _timePickerDialog(context),
            _cupertinoDialog(context),
          ],
        ),

    );
  }

  // -----------------------SimpleDialogBoxView-------------------------------//

  Widget _simpleDialogBoxView(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Simple Dialog, Is it nice?",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: TextButton(
                    style: const ButtonStyle(alignment: Alignment.centerLeft),
                    onPressed: () {
                      Navigator.pop(context, "Yes");
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.green,
                          content: Text(
                            "❤️Thanks!",
                          ),
                        ),
                      );
                    },
                    child: const Text("Yes",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w400)),
                  ),
                ),
                TextButton(
                  style: const ButtonStyle(alignment: Alignment.centerLeft),
                  onPressed: () {
                    Navigator.pop(context, "No");
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        backgroundColor: Colors.red,
                        content: Row(
                          children: [
                            Icon(
                              Icons.watch_later,
                              color: Colors.yellow,
                            ),
                            Text(" Oh! No... Try to provide you best."),
                          ],
                        )));
                  },
                  child: const Text("No",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w400)),
                ),
              ],
            ),
          ),
        );
      },
      child: const Text("Simple Dialog"),
    );
  }

  // -------------------------AlertDialogBoxView------------------------------//

  Widget _alertDialogBoxView(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Alert Dialog",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: Text("Is it nice?", style: TextStyle(fontSize: 14)),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, "Yes");
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.green,
                        content: Text(
                          "❤️Thanks!",
                        ),
                      ),
                    );
                  },
                  child: const Text("Yes"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, "No");
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        backgroundColor: Colors.red,
                        content: Row(
                          children: [
                            Icon(
                              Icons.watch_later,
                              color: Colors.yellow,
                            ),
                            Text(" Oh! No... Try to provide you best."),
                          ],
                        )));
                  },
                  child: const Text("No"),
                ),
              ],
            );
          },
        );
      },
      child: const Text("Alert Dialog"),
    );
  }


  // ------------------------- DatePickerDialog ------------------------------//

  Widget _datePickerDialog(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        datePickerController.selectDateFunc(context);
      },
      child: const Text("Date Picker Dialog"),
    );
  }


  // ------------------------- TimePickerDialog ------------------------------//

  Widget _timePickerDialog(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        datePickerController.selectedTimeFunc(context);
      },
      child: const Text("Time Picker Dialog"),
    );
  }

  // ---------------------- CupertinoDialog ---------------------------------//

  Widget _cupertinoDialog(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return CupertinoAlertDialog(
              title: const Column(
                children: [
                  Text(
                    "Welcome",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Cupertino Dialog, Is it nice?",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
                  ),
                ],
              ),
              actions: [
                CupertinoDialogAction(
                  onPressed: () {
                    Navigator.pop(context, "Yes");
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.green,
                        content: Text(
                          "❤️Thanks!",
                        ),
                      ),
                    );
                  },
                  child: const Text("Yes"),
                ),
                CupertinoDialogAction(
                  onPressed: () {
                    Navigator.pop(context, "No");
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        backgroundColor: Colors.red,
                        content: Row(
                          children: [
                            Icon(
                              Icons.watch_later,
                              color: Colors.yellow,
                            ),
                            Text(" Oh! No... Try to provide you best."),
                          ],
                        )));
                  },
                  child: const Text("No"),
                ),
              ],
            );
          },
        );
      },
      child: const Text("Cupertino Dialog"),
    );
  }
}

//================================== END ======================================
