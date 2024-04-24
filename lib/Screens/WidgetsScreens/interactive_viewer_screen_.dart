import 'package:flutter/material.dart';

class InterActiveViewerScreen extends StatelessWidget {
  const InterActiveViewerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InteractiveViewer(
        maxScale: 6,
        minScale: 0.1,
        child: const Image(
          image: AssetImage("assets/images/img_1.jpg"),
        ),
      ),
    );
  }
}
