import 'package:flutter/material.dart';

class ClipRectWidgetScreen extends StatefulWidget {
  const ClipRectWidgetScreen({super.key});

  @override
  ClipRectWidgetScreenState createState() => ClipRectWidgetScreenState();
}

class ClipRectWidgetScreenState extends State<ClipRectWidgetScreen> {
  var clipSize = 50.0;
  var clipSizeNext = 40.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(clipSize),
            child: Container(
              width: 220,
              height: 220,
              color: Colors.yellow,
              child: Center(
                  child: FlutterLogo(
                size: clipSize + 10,
              )),
            ),
          ),
        ),
        Slider(
          value: clipSize,
          activeColor: Theme.of(context).primaryColor,
          inactiveColor: Theme.of(context).primaryColor.withOpacity(0.3),
          min: 0.0,
          max: 120.0,
          divisions: 120,
          onChanged: (double value) {
            setState(() {
              clipSize = value;
            });
          },
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(clipSizeNext),
          child: Container(
            width: 200,
            height: 200,
            color: Colors.deepPurple[300],
            child: Center(
              child: FlutterLogo(
                size: clipSizeNext + 10,
              ),
            ),
          ),
        ),
        Slider(
          value: clipSizeNext,
          min: 0,
          max: 120,
          divisions: 120,
          activeColor: Theme.of(context).primaryColor,
          inactiveColor: Theme.of(context).primaryColor.withOpacity(0.3),
          onChanged: (value) {
            setState(() {
              clipSizeNext = value;
            });
          },
        )
      ],
    );
  }
}
