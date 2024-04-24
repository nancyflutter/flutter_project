import 'package:flutter/material.dart';

class SafeAreaWidgetScreen extends StatefulWidget {
  const SafeAreaWidgetScreen({super.key});

  @override
  State<SafeAreaWidgetScreen> createState() => _SafeAreaWidgetScreenState();
}

class _SafeAreaWidgetScreenState extends State<SafeAreaWidgetScreen> {
  var isSafeArea = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: isSafeArea,
      bottom: isSafeArea,
      child: Scaffold(
        backgroundColor: Colors.blue[100],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                "Top text for testing the safe area. Switch to full screen view in notch mobile to test SafeArea.",
                style: TextStyle(
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isSafeArea = !isSafeArea;
                  });
                },
                child:
                    Text(isSafeArea ? "SafeArea Enabled" : "SafeArea Disabled"),
              ),
              const Text(
                "Bottom text for testing the safe area.",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
