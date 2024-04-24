import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RandomColorController extends GetxController {
  List colors = [
    Colors.red,
    Colors.green,
    Colors.yellow,
    Colors.blue,
    Colors.blueGrey,
    Colors.orange,
    Colors.amberAccent,
    Colors.greenAccent,
    Colors.indigo,
    Colors.amber,
    Colors.grey,
    Colors.brown,
    Colors.cyan,
    Colors.deepPurple,
    Colors.pink,
    Colors.yellowAccent,
  ];
  Random random = Random();
  int index = 0;

  void changeIndex() {
    index = random.nextInt(4);
    update();
  }
}
