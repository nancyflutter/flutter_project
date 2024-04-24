import 'package:flutter/material.dart';

class IndexedStackWidgetScreen extends StatefulWidget {
  const IndexedStackWidgetScreen({super.key});

  @override
  State<IndexedStackWidgetScreen> createState() =>
      _IndexedStackWidgetScreenState();
}

class _IndexedStackWidgetScreenState extends State<IndexedStackWidgetScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: IndexedStack(
              index: index,
              children: [
                Container(
                  color: Colors.green[900],
                  child: const Center(child: Text("index: 0")),
                ),
                Container(
                  color: Colors.green,
                  child: const Center(child: Text("index: 1")),
                ),
                Container(
                  color: Colors.yellow,
                  child: const Center(child: Text("index: 2")),
                ),
                Container(
                  color: Colors.orange,
                  child: const Center(child: Text("index: 3")),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                if (index == 3) {
                  index = 0;
                } else {
                  index++;
                }
              });
            },
            child: const Text("data"),
          ),
        ],
      ),
    );
  }
}
