import 'package:flutter/material.dart';

class SplashDesignOne extends StatefulWidget {
  const SplashDesignOne({super.key});

  @override
  State<SplashDesignOne> createState() => _SplashDesignOneState();
}

class _SplashDesignOneState extends State<SplashDesignOne>
    with TickerProviderStateMixin {
  late final AnimationController controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> opacity = Tween(end: 0.0, begin: 1.1).animate(controller);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: FadeTransition(
            opacity: opacity,
            child: const FlutterLogo(
              size: 350,
            ),
          ),
        ),
      ),
    );
  }
}
