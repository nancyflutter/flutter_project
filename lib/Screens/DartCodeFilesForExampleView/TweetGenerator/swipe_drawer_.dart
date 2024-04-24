import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SwipeDrawer extends StatefulWidget {
  const SwipeDrawer({super.key});

  @override
  State<SwipeDrawer> createState() => _SwipeDrawerState();
}

class _SwipeDrawerState extends State<SwipeDrawer> {
  double value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// Set Background and Background Color ------------------------------------------
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.lightGreen.shade100,
                  Colors.lightGreen.shade400,
                  Colors.lightGreen.shade900,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),

          /// Profile View -------------------------------------------
          SafeArea(
            child: SizedBox(
              width: 250,
              // color: Colors.white12,
              child: Column(
                children: [
                  DrawerHeader(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 45,
                          child: Image.asset("assets/images/correct.png"),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text("Profile"),
                        ),
                      ],
                    ),
                  ),
                  const ListTile(
                    title: Text("Home"),
                    leading: Icon(Icons.home),
                  ),
                  const ListTile(
                    title: Text("Settings"),
                    leading: Icon(Icons.settings),
                  ),
                  const ListTile(
                    title: Text("About"),
                    leading: Icon(Icons.help),
                  ),
                  const ListTile(
                    title: Text("Exit"),
                    leading: Icon(Icons.exit_to_app),
                  ),
                ],
              ),
            ),
          ),

          /// Main Screen Tween Animation Builder ------------------------------------------
          TweenAnimationBuilder(
            tween: Tween<double>(
              end: value,
              begin: value,
            ),
            curve: Curves.easeInOut,
            duration: const Duration(milliseconds: 500),
            builder: (_, double value, __) {
              /// -pi / 3.8 (fully closed) to 0 (fully open).   ///  0.0 (closed) to 1.0 (fully open).
              final rotationValue = (value - 1.0) * (-pi / 3.8);

              /// -1.0 when fully closed and 0.0 when fully open.  /// -200.0 (fully closed) to 0.0 (fully open).
              final translationValue = (value - 1.0) * -200.0;

              if (kDebugMode) {
                print("value ------------------------------->> $value");
              }
              if (kDebugMode) {
                print("rotationValue ------------------------------->> $rotationValue");
              }
              if (kDebugMode) {
                print("translationValue ------------------------------->> $translationValue");
              }

              return Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..setEntry(0, 3, translationValue)
                  ..rotateY(rotationValue),
                child: Scaffold(
                  backgroundColor: Colors.lightGreen,
                  appBar: AppBar(
                    backgroundColor: Colors.lightGreen,
                    title: const Text("D3 Drawer Screen"),
                    automaticallyImplyLeading: false,
                  ),
                  body: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Container(
                      color: Colors.white12,
                      child: Center(
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              if (kDebugMode) {
                                print("Text Button value---->>>>>> $value");
                              }
                              value = value == 0 ? 1 : 0;
                            });
                          },
                          child: const Text(
                            "Swipe Me",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),

          /// Gesture Detector
          GestureDetector(
            onHorizontalDragUpdate: (details) {
              setState(() {
                if (kDebugMode) {
                  print("details ---------->>>>>>>>>>>>>>>>>>>> $details");
                }
                value += details.delta.dx / 50; // 100 is used to control the sensitivity of the animation to the user's drag input.(500,200,100,50,10).
                value = value.clamp(0.0, 1.0); // for maintain valid rang 0 to 1
              });
            },
          ),
        ],
      ),
    );
  }
}

/// calculates the new value of the value variable based on the user's horizontal drag input (details.delta.dx)
/// divided by a constant value of 100. Let's break it down:

/// details.delta.dx: This represents the horizontal (x-axis) change in position caused by the user's drag gesture.
/// When the user drags to the right, it's a positive value, and when they drag to the left, it's a negative value.
/// Essentially, it measures how much the user has moved their finger or cursor horizontally.
///
/// 100: This is the division operation, and 100 is a constant divisor.
///
/// So, when the user performs a horizontal drag:
///
/// If they drag to the right (details.delta.dx is positive), it increases the value.
/// If they drag to the left (details.delta.dx is negative), it decreases the value.
/// Dividing details.delta.dx by 100 is used to control the sensitivity of the animation to the user's drag input.
/// A smaller divisor (e.g., 50, 10, etc.) makes the animation more sensitive and responsive to small drag movements,
/// while a larger divisor (e.g., 200, 500, etc.) makes the animation less sensitive and smoother.
///
///
/// By clamping the value between 0.0 and 1.0 with value = value.clamp(0.0, 1.0);,
/// you ensure that the value remains within the valid range. This prevents the animation from going beyond fully closed (0.0) or
/// fully open (1.0). It helps maintain smooth and predictable behavior when the user interacts with the animation.
