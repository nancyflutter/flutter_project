
/* ------------------------------- START ------------------------------------- */


import 'package:flutter/material.dart';

class SpacerWidgetScreen extends StatelessWidget {
  const SpacerWidgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              Icon(Icons.camera),
              Spacer(),
              Icon(Icons.camera),
              Spacer(),
              Icon(Icons.camera),
              Spacer(),
              Icon(Icons.camera),
              Spacer(
                flex: 10,
              ),
              Text("Roll to this side"),
            ],
          ),
          Divider(
            thickness: 1,
          ),
          Row(
            children: [
              Icon(Icons.camera),
              Spacer(),
              Icon(Icons.camera),
              Spacer(),
              Icon(Icons.camera),
              Spacer(
                flex: 10,
              ),
              Icon(Icons.camera),
            ],
          ),
          Divider(
            thickness: 1,
          ),
          Row(
            children: [
              Icon(Icons.camera),
              Spacer(),
              Icon(Icons.camera),
              Spacer(
                flex: 4,
              ),
              Icon(Icons.camera),
              Spacer(
                flex: 6,
              ),
              Icon(Icons.camera),
            ],
          ),
          Divider(
            thickness: 1,
          ),
          Row(
            children: [
              Icon(Icons.camera),
              Spacer(),
              Icon(Icons.camera),
              Spacer(
                flex: 6,
              ),
              Icon(Icons.camera),
              Spacer(
                flex: 4,
              ),
              Icon(Icons.camera),
            ],
          ),
          Divider(
            thickness: 1,
          ),
          Row(
            children: [
              Icon(Icons.camera),
              Spacer(
                flex: 4,
              ),
              Icon(Icons.camera),
              Spacer(
                flex: 6,
              ),
              Icon(Icons.camera),
              Spacer(),
              Icon(Icons.camera),
            ],
          ),
          Divider(
            thickness: 1,
          ),
          Row(
            children: [
              Icon(Icons.camera),
              Spacer(
                flex: 8,
              ),
              Icon(Icons.camera),
              Spacer(
                flex: 2,
              ),
              Icon(Icons.camera),
              Spacer(),
              Icon(Icons.camera),
            ],
          ),
          Divider(
            thickness: 1,
          ),
          Row(
            children: [
              Text("I am empty"),
              Spacer(
                flex: 6,
              ),
              Icon(Icons.camera),
              Spacer(
                flex: 4,
              ),
              Icon(Icons.camera),
              Spacer(),
              Icon(Icons.camera),
              Spacer(),
              Icon(Icons.camera),
            ],
          ),
          Divider(
            thickness: 1,
          ),
          Row(
            children: [
              Text("I am empty"),
              Spacer(
                flex: 10,
              ),
              Icon(Icons.camera),
              Spacer(),
              Icon(Icons.camera),
              Spacer(),
              Icon(Icons.camera),
              Spacer(),
              Icon(Icons.camera),
            ],
          ),
          Divider(
            thickness: 1,
          ),
        ],
      ),
    );
  }
}

/* ------------------------------- END ------------------------------------- */
