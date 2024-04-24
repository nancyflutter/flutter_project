import 'package:flutter/material.dart';

class AspectRatioScreen extends StatelessWidget {
  const AspectRatioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            AspectRatio(
              aspectRatio: 1 / 1,
              child: Container(
                color: Colors.yellow,
                child: const Center(child: Text("1/1")),
              ),
            ),
            AspectRatio(
              aspectRatio: 4 / 6,
              child: Container(
                color: Colors.green,
                child: const Center(child: Text("4/9")),
              ),
            ),
            AspectRatio(
              aspectRatio: 5 / 9,
              child: Container(
                color: Colors.green[900],
                child: const Center(child: Text("5/9")),
              ),
            ),
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                color: Colors.purple[900],
                child: const Center(child: Text("16/9")),
              ),
            ),  AspectRatio(
              aspectRatio: 9 / 16,
              child: Container(
                color: Colors.blue[900],
                child: const Center(child: Text("9/16")),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
