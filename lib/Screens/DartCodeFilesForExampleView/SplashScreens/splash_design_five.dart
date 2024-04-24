import 'package:flutter/material.dart';

class SplashDesignFive extends StatefulWidget {
  const SplashDesignFive({super.key});

  @override
  State<SplashDesignFive> createState() => _SplashDesignFiveState();
}

class _SplashDesignFiveState extends State<SplashDesignFive> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            ClipPath(
              clipper: WaveClipper(),
              child: Container(
                // height: 100,
                // width: 100,
                color: Colors.green,
              ),
            ),
            const Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      maxRadius: 40,
                      child: Icon(Icons.train, size: 40,),
                    ),
                  ],
                ),
                Center(child: Text("App Name", style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold),)),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                          "Application Description:\nWe can place some images or tagline here.\nThis helps users to understand about the apps",style: TextStyle(fontSize: 18)),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(0, 0)
      ..cubicTo(0, size.height * 1 / 2, size.width, size.height * 1 / 2,
          size.width, size.height)
      ..lineTo(size.width, 0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

