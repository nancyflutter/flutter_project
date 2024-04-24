import 'package:flutter/material.dart';

class ActionChipWidgetScreen extends StatelessWidget {
  const ActionChipWidgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ActionChip(
            label: const Text("Action Chip"),
            backgroundColor: Colors.greenAccent,
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Clicked"),
                ),
              );
            },
          ),
          ActionChip(
            label: const Text("Action Chip with tool tip",
                style: TextStyle(color: Colors.black)),
            // backgroundColor: Colors.greenAccent,
            tooltip: "I am tool Tip",
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Clicked"),
                ),
              );
            },
          ),
          ActionChip(
            avatar: const Icon(Icons.accessibility),
            label: const Text(
              "Action Chip with icon",
              style: TextStyle(color: Colors.black),
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Clicked"),
                ),
              );
            },
          ),
          ActionChip(
            avatar: const Icon(Icons.color_lens_outlined,color: Colors.white),
            backgroundColor: Colors.deepPurple,
            label: const Text(
              "Action Chip with custom color",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Clicked"),
                ),
              );
            },
          ), ActionChip(
            elevation: 4,
            shadowColor: Colors.greenAccent,
            avatar: const Icon(Icons.ac_unit,color: Colors.black),
            label: const Text(
              "Action Chip with Elevation",
              style: TextStyle(color: Colors.black),
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Clicked"),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
