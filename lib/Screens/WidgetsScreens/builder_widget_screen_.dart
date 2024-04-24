import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuilderWidgetScreen extends StatelessWidget {
  const BuilderWidgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // ScaffoldMessenger.of(context).showSnackBar(
            //   const SnackBar(
            //     content: Text("Snack bar shown without using scaffold key."),
            //   ),
            // );
            Get.snackbar("title", "message");
          },
          child: const Text("Show SnackBar"),
        ),
      ),
    );
  }
}
