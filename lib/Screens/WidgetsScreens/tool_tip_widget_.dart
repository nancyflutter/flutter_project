import 'package:flutter/material.dart';

class ToolTipWidgetScreen extends StatelessWidget {
  const ToolTipWidgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text("Long Press on Box."),
          Tooltip(
            message: "Green",
            child: Container(
              height: 100,
              width: 100,
              color: Colors.green,
            ),
          ),
          Tooltip(
            message: "Yellow",
            child: Container(
              height: 100,
              width: 100,
              color: Colors.yellow,
            ),
          ),
          Tooltip(
            message: "Red",
            child: Container(
              height: 100,
              width: 100,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
