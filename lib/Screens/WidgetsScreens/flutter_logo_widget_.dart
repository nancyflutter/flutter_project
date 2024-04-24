import 'package:flutter/material.dart';

class FlutterLogoWidgetScreen extends StatefulWidget {
  const FlutterLogoWidgetScreen({super.key});

  @override
  State<FlutterLogoWidgetScreen> createState() =>
      _FlutterLogoWidgetScreenState();
}

class _FlutterLogoWidgetScreenState extends State<FlutterLogoWidgetScreen> {
  double size = 100;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FlutterLogo(
            size: size,
            curve: Curves.elasticInOut,
            duration: const Duration(seconds: 5),
          ),
          FlutterLogo(
            size: size,
            curve: Curves.easeInOutCubic,
            style: FlutterLogoStyle.horizontal,
            duration: const Duration(seconds: 5),
            textColor: Colors.teal,
          ),
          FlutterLogo(
            size: size,
            curve: Curves.bounceInOut,
            style: FlutterLogoStyle.stacked,
            duration: const Duration(seconds: 5),
            textColor: Colors.redAccent,
          ),
          TextButton(
            onPressed: () {
              setState(() {
                size = size + 100;
                if (size >= 300) {
                  size = 100;
                }
              });
            },
            child: const Text("Click Here!"),
          ),
        ],
      ),
    );
  }
}
