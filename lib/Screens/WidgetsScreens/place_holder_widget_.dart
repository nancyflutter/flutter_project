import 'package:flutter/material.dart';

class PlaceHolderWidgetScreen extends StatefulWidget {
  const PlaceHolderWidgetScreen({super.key});

  @override
  State<PlaceHolderWidgetScreen> createState() =>
      _PlaceHolderWidgetScreenState();
}

class _PlaceHolderWidgetScreenState extends State<PlaceHolderWidgetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Placeholder(),
          const Center(
            child: SizedBox(
              height: 100,
              width: 100,
              child: Placeholder(
                color: Colors.purple,
              ),
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            height: 300,
            width: 300,
            child: const Placeholder(
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
