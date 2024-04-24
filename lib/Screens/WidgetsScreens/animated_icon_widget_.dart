/* ------------------------------- START ------------------------------------- */

import 'package:flutter/material.dart';

class AnimatedIconWidgetScreen extends StatefulWidget {
  const AnimatedIconWidgetScreen({super.key});

  @override
  State<AnimatedIconWidgetScreen> createState() =>
      _AnimatedIconWidgetScreenState();
}

class _AnimatedIconWidgetScreenState extends State<AnimatedIconWidgetScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..forward();
    // ..repeat(reverse: true);
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedIcon(
            icon: AnimatedIcons.play_pause,
            color: Colors.blue,
            progress: animation,
            size: 72.0,
            semanticLabel: 'Show menu',
          ),
          AnimatedIcon(
            icon: AnimatedIcons.add_event,
            color: Colors.green,
            progress: animation,
            size: 72.0,
            semanticLabel: 'Show menu',
          ),
          AnimatedIcon(
            icon: AnimatedIcons.menu_arrow,
            color: Colors.blue,
            progress: animation,
            size: 72.0,
            semanticLabel: 'Show menu',
          ),
          AnimatedIcon(
            icon: AnimatedIcons.search_ellipsis,
            color: Colors.red,
            progress: animation,
            size: 72.0,
            semanticLabel: 'Show menu',
          ),
          AnimatedIcon(
            icon: AnimatedIcons.list_view,
            color: Colors.black,
            progress: animation,
            size: 72.0,
            semanticLabel: 'Show menu',
          ),
          AnimatedIcon(
            icon: AnimatedIcons.home_menu,
            color: Colors.pink,
            progress: animation,
            size: 72.0,
            semanticLabel: 'Show menu',
          ),
        ],
      ),
    );
  }
}


/* ------------------------------- END ------------------------------------- */
