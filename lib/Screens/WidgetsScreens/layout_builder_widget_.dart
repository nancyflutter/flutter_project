import 'package:flutter/material.dart';

class LayoutBuilderScreen extends StatelessWidget {
  const LayoutBuilderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600 || constraints.maxHeight < 600) {
            return Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                    child: Container(
                  color: Colors.green,
                )),
                Expanded(
                    child: Container(
                  color: Colors.yellow,
                )),
                Expanded(
                    child: Container(
                  color: Colors.orange,
                )),
                Expanded(
                    child: Container(
                  color: Colors.red,
                )),
              ],
            );
          } else {
            return Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                    child: Container(
                  color: Colors.indigo[900],
                )),
                Expanded(
                    child: Container(
                  color: Colors.indigo,
                )),
                Expanded(
                    child: Container(
                  color: Colors.blue,
                )),
                Expanded(
                    child: Container(
                  color: Colors.blue[200],
                )),
              ],
            );
          }
        },
      ),
    );
  }
}
