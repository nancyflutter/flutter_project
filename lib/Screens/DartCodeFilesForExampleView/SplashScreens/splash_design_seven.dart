import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashDesignSeven extends StatefulWidget {
  const SplashDesignSeven({super.key});

  @override
  State<SplashDesignSeven> createState() => _SplashDesignSevenState();
}

class _SplashDesignSevenState extends State<SplashDesignSeven>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )..repeat(reverse: true);

  late final Animation<double> opacity =
      Tween(end: 0.0, begin: 1.1).animate(controller);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Stack(
          children: [
            const Center(
              child: Text(
                "App Name",
                style: TextStyle(fontSize: 25),
              ),
            ),
            FadeTransition(
              opacity: opacity,
              // duration: const Duration(milliseconds: 500),
              child: ClipPath(
                clipper: CornerRoundedCut(),
                child: Container(
                  color: Get.theme.primaryColor,
                  child: const Center(
                    child: Text(
                      "App Name",
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CornerRoundedCut extends CustomClipper<Path> {
  double radius = 15;

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(radius, 0.0);
    path.arcToPoint(Offset(0.0, radius),
        clockwise: true, radius: Radius.circular(radius));
    path.lineTo(0.0, size.height - radius);
    path.arcToPoint(Offset(radius, size.height),
        clockwise: true, radius: Radius.circular(radius));
    path.lineTo(size.width - radius, size.height);
    path.arcToPoint(Offset(size.width, size.height - radius),
        clockwise: true, radius: Radius.circular(radius));
    path.lineTo(size.width, radius);
    path.arcToPoint(Offset(size.width - radius, 0.0),
        clockwise: true, radius: Radius.circular(radius));
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

// https://flutteragency.com/clippath-widget/
