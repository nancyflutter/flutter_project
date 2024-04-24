import 'package:flutter/material.dart';

class BaseLineScreen extends StatelessWidget {
  const BaseLineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          color: Colors.black12,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Baseline(
              baseline: 50,
              baselineType: TextBaseline.alphabetic,
              child: Text("Baseline 50"),
            ),
          ),
        ),
        Container(
          color: Colors.black12,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Baseline(
              baseline: -50,
              baselineType: TextBaseline.ideographic,
              child: Text("Baseline -50"),
            ),
          ),
        ),
        Container(
          color: Colors.black12,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Baseline(
              baseline: 0,
              baselineType: TextBaseline.ideographic,
              child: Text("Baseline 0"),
            ),
          ),
        ),
        Container(
          color: Colors.black12,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Baseline(
              baseline: 25,
              baselineType: TextBaseline.ideographic,
              child: Text("Baseline 25"),
            ),
          ),
        ),
      ],
    );
  }
}
