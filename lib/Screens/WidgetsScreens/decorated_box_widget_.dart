import 'package:flutter/material.dart';

class DecoratedBoxScreen extends StatelessWidget {
  const DecoratedBoxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: DecoratedBox(
        position: DecorationPosition.background,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.green,
              Colors.yellow,
            ],
          ),
        ),
      ),
    );
  }
}
