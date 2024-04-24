import 'package:flutter/material.dart';
import 'dart:async';

class StreamBuilderScreen extends StatelessWidget {
  Stream<int> counter() async* {
    int i = 0;
    while (true) {
      await Future.delayed(
        const Duration(seconds: 1),
      );
      yield i++;
      if (i == 100) break;
    }
  }

  const StreamBuilderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: StreamBuilder(
        stream: counter(),
        builder: (context, snapshot) {
          if(!snapshot.hasData){
            return const Text("Initializing....");
          }
          return Text("${snapshot.data}");
        },
      ),
    );
  }
}
