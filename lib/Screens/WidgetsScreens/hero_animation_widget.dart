
// /* ------------------------------- START ------------------------------------- */

import 'dart:math';
import 'package:flutter/material.dart';

class HeroAnimationContainer extends StatelessWidget {
  const HeroAnimationContainer({
    Key? key,
    required this.onTap,
    required this.tag,
    this.height,
    this.width,
    this.color,
    this.child,
    this.colorOfPlaceholder,
  }) : super(key: key);

  final Object tag;
  final VoidCallback onTap;
  final double? height;
  final double? width;
  final Color? color;
  final Color? colorOfPlaceholder;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: HeroMode(
          child: Hero(
            transitionOnUserGestures: true,
            placeholderBuilder: (context, heroSize, child) {
              return Container(
                height: 150,
                width: 150,
                color: color,
              );
            },
            tag: tag,
            child: Container(
              height: height,
              width: width,
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}

class HeroAnimationWidgetScreen extends StatelessWidget {
  const HeroAnimationWidgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // timeDilation = 1.5;
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        Color color = Color((Random().nextDouble() * 0xffffff).toInt() << 0)
            .withOpacity(1.0);
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              HeroAnimationContainer(
                height: 60,
                width: 60,
                colorOfPlaceholder: color,
                color: color,
                tag: "tag$index",
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) {
                        return Scaffold(
                          appBar: AppBar(
                            title: const Text("Flippers Page"),
                          ),
                          body: HeroAnimationContainer(
                            height: 350,
                            width: 350,
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            color: color,
                            colorOfPlaceholder: color,
                            tag: "tap$index",
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
              const Text(" Tap for Transition."),
            ],
          ),
        );
      },
    );
  }
}

// /* ------------------------------- END ------------------------------------- */