import 'package:flutter/material.dart';

class MouseRegionWidgetScreen extends StatefulWidget {
  const MouseRegionWidgetScreen({super.key});

  @override
  State<MouseRegionWidgetScreen> createState() =>
      _MouseRegionWidgetScreenState();
}

class _MouseRegionWidgetScreenState extends State<MouseRegionWidgetScreen> {
  double x = 0.0;
  double y = 0.0;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) {
        setState(() {
          x = event.position.dx;
          y = event.position.dy;
        });
      },
      cursor: SystemMouseCursors.click,
      child: Center(
        child: Text(
          "you touch at: (${x.toStringAsFixed(2)}, ${y.toStringAsFixed(2)})",
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
