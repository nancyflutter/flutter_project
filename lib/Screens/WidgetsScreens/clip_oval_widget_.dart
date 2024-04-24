import 'package:flutter/material.dart';

class ClipOvalWidgetScreen extends StatelessWidget {
  const ClipOvalWidgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      body: ListView(
        children: const [
          Text(
            "Based image height and width it automatically clips, if we want we can customize using clipper.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: ClipOval(
              child: Image(
                image: AssetImage("assets/images/Flutter_logo.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: ClipOval(
              child: Image(
                image: AssetImage("assets/images/img_1.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
