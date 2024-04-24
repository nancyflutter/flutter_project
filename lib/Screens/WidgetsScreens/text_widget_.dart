/* -------------------------------------- START -----------------------------------------*/

import 'package:flutter/material.dart';

class TextWidgetScreen extends StatelessWidget {
  const TextWidgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text("Simple Text"),

            const Text(
              "Over Flow Text will skipped automatically. So lets have some Long text to get skipped",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),

            // Shadow Text
            const Text(
              "Shadow Text",
              style: TextStyle(
                color: Colors.green,
                fontSize: 24,
                shadows: [
                  Shadow(color: Colors.amber, offset: Offset(2, 4)),
                ],
              ),
            ),

            const Text.rich(
              TextSpan(
                text: "Hi, I am ",
                children: [
                  TextSpan(
                    text: "Italic ",
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                  TextSpan(
                    text: "Bold ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                      text: "Normal",
                      style: TextStyle(fontWeight: FontWeight.normal)),
                ],
              ),
            ),

            RichText(
              overflow: TextOverflow.clip,
              textAlign: TextAlign.end,
              textDirection: TextDirection.rtl,
              softWrap: true,
              text: const TextSpan(
                text: "I am ",
                style: TextStyle(color: Colors.indigo),
                children: [
                  TextSpan(
                    text: "Rich Text ",
                    style: TextStyle(color: Colors.green, fontSize: 24),
                  ),
                  TextSpan(
                    text: "Similar to ",
                    style: TextStyle(
                        color: Colors.red, fontStyle: FontStyle.italic),
                  ),
                  TextSpan(
                    text: "Text.rich",
                    style: TextStyle(
                        color: Colors.purple, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/* -------------------------------------- END -----------------------------------------*/
