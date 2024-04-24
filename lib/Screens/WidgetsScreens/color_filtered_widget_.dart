import 'package:flutter/material.dart';

class ColorFilteredWidget extends StatelessWidget {
  const ColorFilteredWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FlutterLogo(
              size: 75,
            ),
            ColorFiltered(
              colorFilter: ColorFilter.srgbToLinearGamma(),
              child: FlutterLogo(
                size: 75,
              ),
            ),
            ColorFiltered(
              colorFilter: ColorFilter.linearToSrgbGamma(),
              child: FlutterLogo(
                size: 75,
              ),
            ),
            ColorFiltered(
              colorFilter: ColorFilter.mode(
                Colors.yellowAccent,
                BlendMode.modulate,
              ),
              child: FlutterLogo(
                size: 75,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
