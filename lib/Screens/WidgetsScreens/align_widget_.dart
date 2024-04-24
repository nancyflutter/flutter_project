import 'package:flutter/material.dart';

class AlignWidgetScreen extends StatelessWidget {
  const AlignWidgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 400,
          width: 400,
          color: Colors.blue[50],
          child: const Stack(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: FlutterLogo(
                  size: 60,
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: FlutterLogo(
                  size: 60,
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: FlutterLogo(
                  size: 60,
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: FlutterLogo(
                  size: 60,
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: FlutterLogo(
                  size: 60,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: FlutterLogo(
                  size: 60,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: FlutterLogo(
                  size: 100,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
