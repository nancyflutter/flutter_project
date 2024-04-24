import 'package:flutter/material.dart';

class LinearGradientWidgetScreen extends StatelessWidget {
  const LinearGradientWidgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue,
              Colors.red,
              Colors.yellow,
              Colors.orange,
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          )
        ),
      ),
    );
  }
}
