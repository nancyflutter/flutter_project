import 'dart:math';

import 'package:flutter/material.dart';

class GestureDetectorScreen extends StatefulWidget {
  const GestureDetectorScreen({super.key});

  @override
  State<GestureDetectorScreen> createState() => _GestureDetectorScreenState();
}

class _GestureDetectorScreenState extends State<GestureDetectorScreen> {
  double top = 100, left = 50;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Positioned(
            top: top,
            left: left,
            child: GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Tapped"),
                  ),
                );
              },
              onLongPress: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Long Pressed"),
                  ),
                );
              },
              onDoubleTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Double Tapped"),
                  ),
                );
              },
              onPanUpdate: (details) {
                setState(() {
                  top = max(0, top + details.delta.dy);
                  left = max(0, left + details.delta.dx);
                });
              },
              child: Container(
                color: Colors.blue,
                padding: const EdgeInsets.all(16),
                child: const Text("Tap / Long press / Double tap / Drag "),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
