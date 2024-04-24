import 'package:flutter/material.dart';

class SelectableTextWidgetScreen extends StatefulWidget {
  const SelectableTextWidgetScreen({super.key});

  @override
  State<SelectableTextWidgetScreen> createState() =>
      _SelectableTextWidgetScreenState();
}

class _SelectableTextWidgetScreenState
    extends State<SelectableTextWidgetScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SelectableText(
              "Long Press Me, I am Selectable",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SelectableText.rich(
              TextSpan(
                text: "Hi, ",
                children: [
                  TextSpan(
                    text: "I am Selectable.",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        fontSize: 16),
                  ),
                  TextSpan(
                    text: "\n\nLong Press ",
                    style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
                  ),
                  TextSpan(
                    text: "and Copy me.",
                    style: TextStyle(fontSize: 16, letterSpacing: 3),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
