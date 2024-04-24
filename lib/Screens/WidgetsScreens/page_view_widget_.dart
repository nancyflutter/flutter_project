import 'package:flutter/material.dart';

class PageViewWidgetScreen extends StatelessWidget {
  const PageViewWidgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: [
          Container(
            color: Colors.brown[900],
            child: const Center(
              child: Text("Page 1"),
            ),
          ),  Container(
            color: Colors.red,
            child: const Center(
              child: Text("Page 2"),
            ),
          ),
          Container(
            color: Colors.orange,
            child: const Center(
              child: Text("Page 3"),
            ),
          ),
          Container(
            color: Colors.yellow,
            child: const Center(
              child: Text("Page 4"),
            ),
          ),
          Container(
            color: Colors.green[300],
            child: const Center(
              child: Text("Page 5"),
            ),
          ),
          Container(
            color: Colors.green,
            child: const Center(
              child: Text("Page 6"),
            ),
          ),
          Container(
            color: Colors.green[900],
            child: const Center(
              child: Text("Page 7"),
            ),
          ),
        ],
      ),
    );
  }
}
