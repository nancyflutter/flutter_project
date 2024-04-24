import 'dart:math';

import 'package:flutter/material.dart';

class FlippingCardWidget extends StatefulWidget {
  const FlippingCardWidget({super.key});

  @override
  State<FlippingCardWidget> createState() => _FlippingCardWidgetState();
}

class _FlippingCardWidgetState extends State<FlippingCardWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;
  AnimationStatus _status = AnimationStatus.dismissed;

  // initialize _controller, _animation
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animation = Tween(end: 1.0, begin: 0.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        _status = status;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                if (_status == AnimationStatus.dismissed) {
                  _controller.forward();
                } else {
                  _controller.reverse();
                }
              },
              child: const Text('Reveal The Secrets'),
            ),

            /// Horizontal Flipping
            Transform(
              alignment: FractionalOffset.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.0015)
                ..rotateY(pi * _animation.value),
              child: Card(
                child: _animation.value <= 0.5
                    ? Container(
                        color: Colors.deepOrange,
                        width: 150,
                        height: 200,
                        child: const Center(
                          child: Text(
                            '?',
                            style: TextStyle(fontSize: 100, color: Colors.white),
                          ),
                        ),
                      )
                    : Container(
                        width: 150,
                        height: 200,
                        color: Colors.grey,
                        child: Image.network(
                          'https://www.kindacode.com/wp-content/uploads/2021/09/girl.jpeg',
                          fit: BoxFit.cover,
                        ),
                      ),
              ),
            ),

            /// Vertical Flipping
            const Divider(),
            Transform(
              alignment: FractionalOffset.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.0015)
                ..rotateX(pi * _animation.value),
              child: Card(
                child: _animation.value <= 0.5
                    ? Container(
                        color: Colors.deepPurple,
                        width: 150,
                        height: 200,
                        child: const Center(
                          child: Text(
                            '?',
                            style: TextStyle(fontSize: 100, color: Colors.white),
                          ),
                        ),
                      )
                    : Container(
                        width: 150,
                        height: 200,
                        color: Colors.grey,
                        child: RotatedBox(
                          quarterTurns: 2,
                          child: Image.network(
                            'https://www.kindacode.com/wp-content/uploads/2021/09/flower.jpeg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
