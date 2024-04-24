import 'package:flutter/material.dart';

class FadeTransitionWidgetScreen extends StatefulWidget {
  const FadeTransitionWidgetScreen({super.key});

  @override
  State<FadeTransitionWidgetScreen> createState() =>
      _FadeTransitionWidgetScreenState();
}

class _FadeTransitionWidgetScreenState extends State<FadeTransitionWidgetScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = Tween(end: 0.0, begin: 1.0).animate(_controller);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: FadeTransition(
        opacity: _animation,
        child: Container(
          color: Colors.green,
          width: 100,
          height: 100,
        ),
      ),
    );
  }
}
