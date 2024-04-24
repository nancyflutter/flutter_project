import 'package:flutter/material.dart';

class DividerWidgetScreen extends StatelessWidget {
  const DividerWidgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.yellow,
            height: 80,
          ),
          const Divider(),
          Container(
            color: Colors.yellow,
            height: 80,
          ),
          const Divider(
            color: Colors.red,
            height: 50,
          ),
          Container(
            color: Colors.yellow,
            height: 80,
          ),
          const Divider(
            thickness: 5,
            color: Colors.green,
            indent: 20,
            endIndent: 20,
            // height: 0,
          ),
          Container(
            color: Colors.yellow,
            height: 80,
          ),
        ],
      ),
    );
  }
}
