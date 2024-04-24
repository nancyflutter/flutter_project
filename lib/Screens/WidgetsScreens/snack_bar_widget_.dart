/* ------------------------------- START ------------------------------------- */

import 'package:flutter/material.dart';

class SnackBarWidgetScreen extends StatelessWidget {
  const SnackBarWidgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Simple SnackBar")));
            },
            child: const Text("Simple SnackBar"),
          ),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: Colors.lightGreenAccent,
                  duration: Duration(milliseconds: 500),
                  content: Text(
                    "Colored SnackBar - 0.5 Seconds",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              );
            },
            child: const Text("Colored SnackBar - 0.5 Seconds"),
          ),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Row(
                  children: [
                    Icon(
                      Icons.favorite,
                      color: Colors.indigo,
                    ),
                    Text(
                      "Hai",
                      style: TextStyle(color: Colors.red),
                    )
                  ],
                ),
                duration: Duration(seconds: 1),
                backgroundColor: Colors.limeAccent,
              ));
            },
            child: const Text("SnackBar with Image"),
          ),
        ],
      ),
    );
  }
}

/* ------------------------------- END ------------------------------------- */
