/* ------------------------------- START ------------------------------------- */

import 'package:flutter/material.dart';

class WrapWidgetScreen extends StatelessWidget {
  const WrapWidgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(15.0),
      child: Row(
        children: [
          Expanded(
            child: Wrap(
              direction: Axis.vertical,
              spacing: 18.0,
              runSpacing: 10.0,
              children: [
                CircleAvatar(backgroundColor: Colors.blue, child: Text("A")),
                CircleAvatar(backgroundColor: Colors.blue, child: Text("B")),
                CircleAvatar(backgroundColor: Colors.blue, child: Text("C")),
                CircleAvatar(backgroundColor: Colors.blue, child: Text("D")),
                CircleAvatar(backgroundColor: Colors.blue, child: Text("E")),
                CircleAvatar(backgroundColor: Colors.blue, child: Text("F")),
                CircleAvatar(backgroundColor: Colors.blue, child: Text("G")),
                CircleAvatar(backgroundColor: Colors.blue, child: Text("H")),
                CircleAvatar(backgroundColor: Colors.blue, child: Text("I")),
                CircleAvatar(backgroundColor: Colors.blue, child: Text("J")),
                CircleAvatar(backgroundColor: Colors.blue, child: Text("K")),
                CircleAvatar(backgroundColor: Colors.blue, child: Text("L")),
                CircleAvatar(backgroundColor: Colors.blue, child: Text("M")),
                CircleAvatar(backgroundColor: Colors.blue, child: Text("N")),
                CircleAvatar(backgroundColor: Colors.blue, child: Text("O")),
                CircleAvatar(backgroundColor: Colors.blue, child: Text("P")),
                CircleAvatar(backgroundColor: Colors.blue, child: Text("Q")),
                CircleAvatar(backgroundColor: Colors.blue, child: Text("R")),
                CircleAvatar(backgroundColor: Colors.blue, child: Text("S")),
                CircleAvatar(backgroundColor: Colors.blue, child: Text("T")),
                CircleAvatar(backgroundColor: Colors.blue, child: Text("U")),
                CircleAvatar(backgroundColor: Colors.blue, child: Text("V")),
                CircleAvatar(backgroundColor: Colors.blue, child: Text("W")),
                CircleAvatar(backgroundColor: Colors.blue, child: Text("X")),
                CircleAvatar(backgroundColor: Colors.blue, child: Text("Y")),
                CircleAvatar(backgroundColor: Colors.blue, child: Text("Z")),
              ],
            ),
          ),
          Expanded(
            child: Wrap(
              direction: Axis.horizontal,
              spacing: 18.0,
              runSpacing: 18.0,
              children: [
                CircleAvatar(backgroundColor: Colors.blue, child: Text("0")),
                CircleAvatar(backgroundColor: Colors.blue, child: Text("1")),
                CircleAvatar(backgroundColor: Colors.blue, child: Text("2")),
                CircleAvatar(backgroundColor: Colors.blue, child: Text("3")),
                CircleAvatar(backgroundColor: Colors.blue, child: Text("4")),
                CircleAvatar(backgroundColor: Colors.blue, child: Text("5")),
                CircleAvatar(backgroundColor: Colors.blue, child: Text("6")),
                CircleAvatar(backgroundColor: Colors.blue, child: Text("7")),
                CircleAvatar(backgroundColor: Colors.blue, child: Text("8")),
                CircleAvatar(backgroundColor: Colors.blue, child: Text("9")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/* ------------------------------- END ------------------------------------- */
