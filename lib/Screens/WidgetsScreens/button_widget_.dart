/* -------------------------------------- START -----------------------------------------*/

import 'package:flutter/material.dart';

class ButtonWidgetScreen extends StatelessWidget {
  const ButtonWidgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
            onPressed: () {},
            child: const Text("Text Button"),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Elevated Button"),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.sms_failed,
              color: Colors.blue,
              size: 36,
            ),
            tooltip: "icon Button",
          ),

          Material(
            // needed
            color: Colors.orange,
            child: InkWell(
              onTap: () {},
              child: Container(
                width: 80,
                height: 40,
                color: Colors.yellow,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(4),
                margin: const EdgeInsets.all(4),
                child: const Text("Material"),
              ),
            ),
          ),
          RawMaterialButton(
            onPressed: () {},
            shape: const CircleBorder(),
            elevation: 2,
            splashColor: Colors.transparent,
            fillColor: Colors.deepPurpleAccent,
            highlightColor: Colors.transparent,
            child: const Icon(Icons.play_arrow, color: Colors.limeAccent),
          ),
          BackButton(
            onPressed: () {},
            color: Colors.green,
          ),
          CloseButton(
            onPressed: () {},
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}

/* --------------------------------------END------------------------------------------*/
