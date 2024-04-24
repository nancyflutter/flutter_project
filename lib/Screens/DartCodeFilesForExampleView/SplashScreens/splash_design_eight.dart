import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashDesignEight extends StatefulWidget {
  const SplashDesignEight({super.key});

  @override
  State<SplashDesignEight> createState() => _SplashDesignEightState();
}

class _SplashDesignEightState extends State<SplashDesignEight> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/ripple_img.png",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: Get.height * 0.30),
            child: const RotatedBox(
              quarterTurns: 3,
              child: Text(
                "APP NAME",
                style: TextStyle(
                  fontSize: 70,
                  color: Colors.white,
                  letterSpacing: 10,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
