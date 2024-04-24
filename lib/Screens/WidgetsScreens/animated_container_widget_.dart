import 'package:flutter/material.dart';

class AnimatedContainerWidgetScreen extends StatefulWidget {
  const AnimatedContainerWidgetScreen({super.key});

  @override
  State<AnimatedContainerWidgetScreen> createState() =>
      _AnimatedContainerWidgetScreenState();
}

class _AnimatedContainerWidgetScreenState
    extends State<AnimatedContainerWidgetScreen> {
  double size = 50.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            AnimatedContainer(
              duration: const Duration(seconds: 2),
              width: size,
              height: size,
              color: Colors.blueAccent,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  size = size == 250 ? 50 : 250;
                });
              },
              child: const Text("click to animate"),
            ),
          ],
        ),
      ),
    );
  }
}
