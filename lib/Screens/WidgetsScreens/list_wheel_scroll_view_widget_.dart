import 'package:flutter/material.dart';

class ListWheelScrollViewWidgetScreen extends StatelessWidget {
  const ListWheelScrollViewWidgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListWheelScrollView(
        itemExtent: 100,
        useMagnifier: true,
        magnification: 1.25,
        children: [
          Container(
            height: 150,
            color: Colors.green[900],
          ),
          Container(
            height: 150,
            color: Colors.green,
          ),
          Container(
            height: 150,
            color: Colors.yellowAccent,
          ),
          Container(
            height: 150,
            color: Colors.orange,
          ),
          Container(
            height: 150,
            color: Colors.redAccent,
          ),
          Container(
            height: 150,
            color: Colors.brown[900],
          ),
          Container(
            height: 150,
            color: Colors.indigo[900],
          ),
          Container(
            height: 150,
            color: Colors.blueAccent,
          ),
          Container(
            height: 150,
            color: Colors.purpleAccent,
          ),
          Container(
            height: 150,
            color: Colors.purple[900],
          ),
        ],
      ),
    );
  }
}
