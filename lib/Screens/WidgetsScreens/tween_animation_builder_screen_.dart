import 'package:flutter/material.dart';

class TweenAnimationBuilderScreen extends StatefulWidget {
  const TweenAnimationBuilderScreen({super.key});

  @override
  State<TweenAnimationBuilderScreen> createState() =>
      _TweenAnimationBuilderScreenState();
}

class _TweenAnimationBuilderScreenState
    extends State<TweenAnimationBuilderScreen> {
  Color c1 = Colors.white;
  Color c2 = Colors.yellow;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: TweenAnimationBuilder<Color?>(
                tween: ColorTween(begin: c1, end: c2),
                duration: const Duration(seconds: 3),
                builder: (__, Color? color, _) {
                  return ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      color!,
                      BlendMode.modulate,
                    ),
                    child: const FlutterLogo(
                      size: 350,
                    ),
                  );
                },
                onEnd: () {
                  setState(() {
                    c1 = c1 == Colors.white ? Colors.yellow : Colors.white;
                    c2 = c2 == Colors.yellow ? Colors.white : Colors.yellow;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
