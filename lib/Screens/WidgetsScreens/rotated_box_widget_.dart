import 'package:flutter/material.dart';

class RotatedBoxWidgetScreen extends StatelessWidget {
  const RotatedBoxWidgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          RotatedBox(
            quarterTurns: 1,
            child: Container(
              padding: const EdgeInsets.all(5),
              color: Colors.greenAccent,
              child: const Text("Hello World!"),
            ),
          ),
          RotatedBox(
            quarterTurns: 2,
            child: Container(
              padding: const EdgeInsets.all(5),
              color: Colors.purpleAccent[100],
              child: const Text("Hello World!"),
            ),
          ),
          RotatedBox(
            quarterTurns: 3,
            child: Container(
              padding: const EdgeInsets.all(5),
              color: Colors.indigoAccent[100],
              child: const Text("Hello World!"),
            ),
          ),
          RotatedBox(
            quarterTurns: 4,
            child: Container(
              padding: const EdgeInsets.all(5),
              color: Colors.redAccent[100],
              child: const Text("Hello World!"),
            ),
          ),
        ],
      ),
    );
  }
}
