import 'package:flutter/material.dart';

class ShaderMaskWidgetScreen extends StatelessWidget {
  const ShaderMaskWidgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ShaderMask(
        blendMode: BlendMode.srcATop,
        shaderCallback: (Rect bounds) {
          return const RadialGradient(
            center: Alignment.topLeft,
            radius: 1.0,
            tileMode: TileMode.mirror,
            colors: [
              Colors.deepOrange,
              Colors.orangeAccent,
              Colors.yellowAccent,
              Colors.green,
            ],
          ).createShader(bounds);
        },
        child: const Center(
          child: FlutterLogo(
            size: 400,
          ),
        ),
      ),
    );
  }
}
