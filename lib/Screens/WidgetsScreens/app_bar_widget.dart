/* --------------------------------------START------------------------------------------*/

import 'package:flutter/material.dart';

class AppBarWidgetScreen extends StatelessWidget {
  const AppBarWidgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ScaffoldMessenger(
        child: Scaffold(
          appBar: AppBar(
            title: const Text("AppBar Demo"),
            actions: [
              IconButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Notification Clicked")));
                },
                icon: const Icon(Icons.add_alert),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          body: const Center(
              child: Text(
            "This is the Home page",
            style: TextStyle(fontSize: 24),
          )),
        ),
      ),
    );
  }
}

/* --------------------------------------END------------------------------------------*/
