import 'package:flutter/material.dart';

class AnimatedCrossFadeScreen extends StatefulWidget {
  const AnimatedCrossFadeScreen({super.key});

  @override
  State<AnimatedCrossFadeScreen> createState() =>
      _AnimatedCrossFadeScreenState();
}

class _AnimatedCrossFadeScreenState extends State<AnimatedCrossFadeScreen> {
  bool _trigger = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: AnimatedCrossFade(
                firstChild: const FlutterLogo(
                    style: FlutterLogoStyle.horizontal, size: 200.0),
                secondChild: const FlutterLogo(
                    style: FlutterLogoStyle.stacked, size: 200.0),
                crossFadeState: _trigger
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: const Duration(seconds: 1),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                    setState(() {
                      _trigger = !_trigger;
                    });
                },
                child: const Text("Tap me!"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
