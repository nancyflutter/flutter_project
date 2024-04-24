import 'package:flutter/material.dart';

class AnimatedPositionScreen extends StatefulWidget {
  const AnimatedPositionScreen({super.key});

  @override
  State<AnimatedPositionScreen> createState() => _AnimatedPositionScreenState();
}

class _AnimatedPositionScreenState extends State<AnimatedPositionScreen> {
  bool first = true;
  double left = 20;
  double top = 20;
  double right = 20;
  double bottom = 20;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            color: Colors.transparent,
            height: 300,
            child: Stack(
              children: [
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 1000),
                  curve: Curves.fastLinearToSlowEaseIn,
                  left: left,
                  right: right,
                  top: top,
                  bottom: bottom,
                  child: Container(
                    color: Colors.blue,
                    height: 50,
                    width: 50,
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                left = first ? 10 : 30;
                right = first ? 10 : 30;
                top = first ? 80 : 30;
                bottom = first ? 80 : 30;
                first = !first;
              });
            },
            child: const Text("Click me"),
          ),
        ],
      ),
    );
  }
}
