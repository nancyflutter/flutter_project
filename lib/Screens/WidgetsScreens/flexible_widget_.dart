import 'package:flutter/material.dart';

class FlexibleWidgetScreen extends StatelessWidget {
  const FlexibleWidgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Flexible(
            fit: FlexFit.tight,
            child: Container(
              color: Colors.green,
              height: 50,
              child: const Center(child: Text("FlexFit Tight")),
            ),
          ),
          Flexible(
            fit: FlexFit.loose,
            child: Row(
              children: [
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Container(
                    color: Colors.red,
                    // height: 50,
                    width: 10,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    color: Colors.yellow,
                    // height: 50,
                    width: 10,
                  ),
                ),
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Container(
                    color: Colors.blue,
                    // height: 50,
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            fit: FlexFit.loose,
            child: Container(
              color: Colors.purple[200],
              height: 50,
              child: const Center(child: Text("FlexFit loose")),
            ),
          ),
        ],
      ),
    );
  }
}
