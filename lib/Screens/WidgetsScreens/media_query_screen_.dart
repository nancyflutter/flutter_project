import 'package:flutter/material.dart';

class MediaQueryScreen extends StatelessWidget {
  const MediaQueryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "Device Information:",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            Text(
              "Orientation: ${MediaQuery.of(context).orientation}",
            ),
            Text("Size(w,h): ${MediaQuery.of(context).size.toString()}"),
            Text(
                "Pixel Ratio: ${MediaQuery.of(context).devicePixelRatio.toString()}"),
            Text(
                "Platform Brightness: ${MediaQuery.of(context).platformBrightness.toString()}"),
            Text("Device padding: ${MediaQuery.of(context).padding.toString()}"),
            Text(
                "Navigation Mode: ${MediaQuery.of(context).navigationMode.toString()}"),
          ],
        ),
      ),
    );
  }
}
