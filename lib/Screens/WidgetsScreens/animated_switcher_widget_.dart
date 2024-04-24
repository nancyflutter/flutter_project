import 'dart:math';
import 'package:flutter/material.dart';

class AnimatedSwitcherWidgetScreen extends StatefulWidget {
  const AnimatedSwitcherWidgetScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedSwitcherWidgetScreen> createState() =>
      _AnimatedSwitcherWidgetScreenState();
}

class _AnimatedSwitcherWidgetScreenState
    extends State<AnimatedSwitcherWidgetScreen> {
  bool switchChild = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: AnimatedSwitcher(
            duration: const Duration(seconds: 2),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return ScaleTransition(scale: animation, child: child);
            },
            child: switchChild
                ? Container(
                    key: UniqueKey(),
                    height: 140.0,
                    width: 140.0,
                    color:
                        Color((Random().nextDouble() * 0xffffff).toInt() << 0)
                            .withOpacity(1.0),
                  )
                : Container(
                    key: UniqueKey(),
                    height: 140.0,
                    width: 140.0,
                    color:
                        Color((Random().nextDouble() * 0xffffff).toInt() << 0)
                            .withOpacity(1.0),
                  ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              switchChild = !switchChild;
            });
          },
          child: const Text('Click'),
        ),
      ],
    );
  }
}

//---------------------------------END---------------------------------------//

