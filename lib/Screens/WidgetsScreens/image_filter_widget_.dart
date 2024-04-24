import 'dart:ui';

import 'package:flutter/material.dart';

class ImageFilterWidgetScreen extends StatelessWidget {
  const ImageFilterWidgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ImageFiltered(
          imageFilter: ImageFilter.blur(sigmaX: 6, sigmaY: 4),
          child: const FlutterLogo(
            size: 200,
          ),
        ),
        ImageFiltered(
          imageFilter: ImageFilter.matrix(Matrix4.rotationZ(0.2).storage),
          child: const FlutterLogo(
            size: 200,
          ),
        ),
      ],
    );
  }
}
