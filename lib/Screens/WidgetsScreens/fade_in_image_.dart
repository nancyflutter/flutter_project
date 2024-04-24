import 'package:flutter/material.dart';

class FadeInImageScreen extends StatelessWidget {
  const FadeInImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FadeInImage.assetNetwork(
              fadeInDuration: const Duration(seconds: 2),
              placeholder: "assets/animation/loading_gif.gif",
              image: "https://picsum.photos/280?image=29",
            ),
            FadeInImage.assetNetwork(
              fadeInDuration: const Duration(seconds: 5),
              fadeInCurve: Curves.bounceIn,
              placeholder: "assets/animation/loading_gif.gif",
              image: "https://picsum.photos/280?image=25",
            ),
          ],
        ),
      ),
    );
  }
}
