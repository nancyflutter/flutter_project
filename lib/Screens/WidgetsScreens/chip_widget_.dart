
/* ------------------------------- START ------------------------------------- */


import 'package:flutter/material.dart';

class ChipWidgetScreen extends StatelessWidget {
  const ChipWidgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        direction: Axis.horizontal,
        children: [
          Chip(
            label: Text("Flutter Tutorial"),
            avatar: CircleAvatar(
              backgroundColor: Colors.blue,
              child: Text("FT"),
            ),
          ),
          Chip(
            label: Text("Share"),
            avatar: CircleAvatar(
              backgroundColor: Colors.blue,
              child: Icon(Icons.share),
            ),
          ),
          Chip(
            label: Text("Camera"),
            avatar: CircleAvatar(
              backgroundColor: Colors.blue,
              child: Icon(Icons.camera),
            ),
          ),
          Chip(
            label: Text("Feedback"),
            avatar: CircleAvatar(
              backgroundColor: Colors.blue,
              child: Text("F"),
            ),
          ),
        ],
      ),
    );
  }
}


/* ------------------------------- END ------------------------------------- */
