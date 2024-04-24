import 'package:flutter/material.dart';

class SplashDesignTwo extends StatelessWidget {
  const SplashDesignTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Wrap(
              direction: Axis.vertical,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                CircleAvatar(
                  maxRadius: 40,
                  child: Icon(Icons.favorite, size: 40),
                ),
                Text("Welcome",
                    style: TextStyle(color: Colors.black, fontSize: 23)),
              ],
            ),
          ],
        ),
      ),
      extendBody: true,
      bottomNavigationBar: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Wrap(
            direction: Axis.vertical,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              CircularProgressIndicator(),
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 8),
                child: Text(
                  "This is sample 1 Splash screen",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
