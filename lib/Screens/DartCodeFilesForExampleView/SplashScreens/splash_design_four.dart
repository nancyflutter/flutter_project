import 'package:flutter/material.dart';
import 'package:flutter_project/AnimatedTextKit/src/animated_text.dart';
import 'package:flutter_project/AnimatedTextKit/src/typer.dart';

class SplashDesignFour extends StatefulWidget {
  const SplashDesignFour({super.key});

  @override
  State<SplashDesignFour> createState() => _SplashDesignFourState();
}

class _SplashDesignFourState extends State<SplashDesignFour>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 10),
  )..repeat(reverse: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                ClipPath(
                  clipper: DiagonalPathClipperOne(),
                  child: Container(
                    color: Colors.blue,
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: RotationTransition(
                    turns: Tween(begin: 0.0, end: 2.0).animate(_controller),
                    child: const Icon(
                      Icons.star,
                      size: 50,
                      color: Colors.yellow,
                      // color: Get.theme.secondaryHeaderColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          AnimatedTextKit(
            animatedTexts: [
              TyperAnimatedText('Splash',
                  textStyle: const TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                  speed: const Duration(milliseconds: 200)),
            ],
            onTap: () {},
          ),
          // TextLiquidFill(
          //   text: 'LIQUIDY',
          //   waveColor: Colors.blueAccent,
          //   textStyle: TextStyle(
          //     fontSize: 60.0,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
          Expanded(
            child: Stack(
              children: [
                ClipPath(
                  clipper: CrossClipper(),
                  child: Container(
                    color: Colors.blue,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: RotationTransition(
                    turns: Tween(begin: 0.0, end: 2.0).animate(_controller),
                    child: const Icon(
                      Icons.star,
                      size: 50,
                      color: Colors.yellow,
                      // color: Get.theme.secondaryHeaderColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CrossClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(size.width, 0)
      ..lineTo(0.0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0.0)
      ..lineTo(0, size.height)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class DiagonalPathClipperOne extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(0.0, size.height)
      ..lineTo(size.width, size.height - size.height)
      ..lineTo(size.width, 0.0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class DiagonalPathClipperTwo extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(0.0, size.height)
      ..lineTo(size.width - size.width / 1, size.height)
      ..lineTo(size.width, 0.0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}


