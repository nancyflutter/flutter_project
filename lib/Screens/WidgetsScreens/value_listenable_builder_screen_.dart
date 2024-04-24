import 'package:flutter/material.dart';

class ValueListenableBuilderScreen extends StatelessWidget {
   ValueListenableBuilderScreen({super.key});

  final ValueNotifier<int> counter = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          counter.value = 1;
                        },
                        child: const Text("give x1"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          counter.value = 2;
                        },
                        child: const Text("give x2"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          counter.value = 3;
                        },
                        child: const Text("give x3"),
                      ),
                    ],
                  ),
                  ValueListenableBuilder(
                    valueListenable: counter,
                    builder: (context, value, child) {
                      return Column(
                        children: [
                          Text(
                            "Counter: $value",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                          const Text(
                            "Tables:",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              height: 3,
                            ),
                          ),
                          Column(
                            children: List.generate(
                              10,
                              (index) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "$value * $index = ${(index * counter.value).toString()}",
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                onPressed: () {
                  counter.value += 1;
                },
                child: const Icon(Icons.add),
              ),
              FloatingActionButton(
                onPressed: () {
                  counter.value -= 1;
                },
                child: const Icon(Icons.remove),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
