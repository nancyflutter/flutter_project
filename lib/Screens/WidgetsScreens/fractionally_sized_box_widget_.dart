import 'package:flutter/material.dart';

class FractionallySizedBoxWidgetScreen extends StatelessWidget {
  const FractionallySizedBoxWidgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              color: Colors.lightBlueAccent[700],
              height: 400,
              width: 400,
              child: FractionallySizedBox(
                widthFactor: 0.5,
                heightFactor: 0.5,
                child: Container(
                  color: Colors.blue[200],
                  child: FractionallySizedBox(
                    widthFactor: 0.5,
                    heightFactor: 0.5,
                    child: Container(
                      color: Colors.blue,
                      child: FractionallySizedBox(
                        widthFactor: 0.5,
                        heightFactor: 0.5,
                        child: Container(
                          color: Colors.indigo[100],
                          child: FractionallySizedBox(
                            heightFactor: 0.5,
                            widthFactor: 0.5,
                            child: Container(
                              width: 10,
                              height: 10,
                              color: Colors.indigo,
                              child: const Center(
                                  child: Text("Fractionally SizedBox")),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.blueAccent[100],
              height: 200,
              width: 200,
              child: FractionallySizedBox(
                heightFactor: 0.5,
                widthFactor: 0.8,
                child: Container(
                  width: 10,
                  height: 10,
                  color: Colors.indigo,
                  child: const Center(child: Text("Fractionally SizedBox")),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
