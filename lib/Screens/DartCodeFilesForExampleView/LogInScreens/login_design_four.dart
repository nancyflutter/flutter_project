import 'package:flutter/material.dart';
import 'package:flutter_project/Commons/CommonWidgets/common_rounded_text_field_.dart';
import 'dart:math' as math;

import 'package:get/get.dart';

class LogInDesignFour extends StatefulWidget {
  const LogInDesignFour({super.key});

  @override
  State<LogInDesignFour> createState() => _LogInDesignFourState();
}

class _LogInDesignFourState extends State<LogInDesignFour>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            Stack(
              children: [
                _waveView(),
                _logInView(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _logInView() {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(
            top: 40.0,
            bottom: 20,
          ),
          child: Text(
            "Login",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: RoundedTextField(
            backgroundColor: Colors.white,
            hintText: "Username",
            color: Colors.grey[600],
            icon: Icons.person,
            onChanged: (value) {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: RoundedTextField(
            backgroundColor: Colors.white,
            hintText: "PassWord",
            color: Colors.grey[600],
            icon: Icons.lock,
            onChanged: (value) {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 15, left: 15, top: 15),
          child: SizedBox(
              width: Get.width,
              height: 50,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    elevation: 15,
                  ),
                  child: const Text('Login'))),
        ),
      ],
    );
  }

  Widget _waveView() {
    return RotatedBox(
      quarterTurns: 2,
      child: Stack(
        children: [
          Wave(
            controller: _controller!,
            color: Colors.blue.withOpacity(0.5),
            yOffset: 50.0,
            amplitude: 45.0,
            frequency: 0.2,
          ),
          Wave(
            controller: _controller!,
            color: Colors.blue.withOpacity(0.5),
            yOffset: 70.0,
            amplitude: 70.0,
            frequency: 0.3,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }
}


//========================= wave animation ==============================

class Wave extends StatelessWidget {
  final AnimationController controller;
  final Color color;
  final double yOffset;
  final double amplitude;
  final double frequency;

  const Wave({
    super.key,
    required this.controller,
    required this.color,
    required this.yOffset,
    required this.amplitude,
    required this.frequency,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return ClipPath(
          clipper: DoubleWaveClipper(
            controller.value,
            yOffset: yOffset,
            amplitude: amplitude,
            frequency: frequency,
          ),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: Get.height * 0.7,
            color: color,
          ),
        );
      },
    );
  }
}

class DoubleWaveClipper extends CustomClipper<Path> {
  final double animationValue;
  final double yOffset;
  final double amplitude;
  final double frequency;

  DoubleWaveClipper(
    this.animationValue, {
    required this.yOffset,
    required this.amplitude,
    required this.frequency,
  });

  @override
  Path getClip(Size size) {
    final path = Path();

    for (double i = 0; i <= size.width; i++) {
      final x = i;
      final y = math.sin((i * frequency * math.pi / 180.0) +
                  (animationValue * 360 * math.pi / 180.0)) *
              amplitude +
          yOffset;

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

// ================ How to use ==============
// Wave(
// controller: _controller!,
// color: Colors.blue.withOpacity(0.5),
// yOffset: 50.0,
// amplitude: 40.0,
// frequency: 1,
// ),
// Wave(
// controller: _controller!,
// color: Colors.blue.withOpacity(0.9),
// yOffset: 70.0,
// amplitude: 60.0,
// frequency: 2,
// ),
// ]
