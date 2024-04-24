import 'dart:math' as math;
import 'package:flutter/material.dart';

class SplashDesignThree extends StatefulWidget {
  const SplashDesignThree({super.key});

  @override
  State<SplashDesignThree> createState() => _SplashDesignThreeState();
}

class _SplashDesignThreeState extends State<SplashDesignThree>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _animationController.repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlutterLogo(
                size: 170,
              ),
              Text(
                "Flutter",
                style: TextStyle(
                  fontSize: 70,
                  fontWeight: FontWeight.w200,
                ),
              ),
            ],
          ),
          WaveAnimation(
            animation: _animationController,
            size: const Size(400, 300),
            waveHeight: 0.15,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}

class WaveAnimation extends StatelessWidget {
  final Animation<double> animation;
  final Size size;
  final double waveHeight;
  final Color color;

  const WaveAnimation({
    super.key,
    required this.animation,
    required this.size,
    required this.waveHeight,
    this.color = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return CustomPaint(
          painter: WavePainter(animation.value, size, waveHeight, color),
          size: size,
        );
      },
    );
  }
}

class WavePainter extends CustomPainter {
  final double animationValue;
  final Size size;
  final double waveHeight;
  final Color color;

  WavePainter(this.animationValue, this.size, this.waveHeight, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    final waveHeight = size.height * this.waveHeight;
    path.moveTo(0, size.height);
    path.lineTo(0, size.height - waveHeight);

    for (double x = 0; x <= size.width; x++) {
      final double y = waveHeight *
          math.sin(x * 2 * math.pi / size.width + (animationValue * 2 * math.pi));
      path.lineTo(x, size.height - waveHeight + (y - 30));
      path.lineTo(x, size.height - waveHeight + (y - 0));
      // path.lineTo(x, size.height - waveHeight + (y-x));
    }

    path.lineTo(size.width, size.height - waveHeight);
    path.lineTo(size.width, size.height);

    final paint = Paint()..color = color;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
