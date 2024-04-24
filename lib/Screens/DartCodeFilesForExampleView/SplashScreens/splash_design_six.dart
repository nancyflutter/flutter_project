import 'package:flutter/material.dart';

class SplashDesignSix extends StatefulWidget {
  const SplashDesignSix({super.key});

  @override
  State<SplashDesignSix> createState() => _SplashDesignSixState();
}

class _SplashDesignSixState extends State<SplashDesignSix> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 200,
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.purpleAccent,
                Colors.pinkAccent,
              ]),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(400),
              ),
            ),
          ),
          Center(
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.blue[100],
                  maxRadius: 30,
                  child: const FlutterLogo(
                    size: 40,
                  ),
                ),
                const Text(
                  "App Name",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 200,
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.pinkAccent,
                Colors.purpleAccent,
              ]),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(400),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

