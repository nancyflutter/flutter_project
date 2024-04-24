/* ------------------------------- START ------------------------------------- */

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StackWidgetScreen extends StatelessWidget {
  const StackWidgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            height: 350,
            width: 350,
            color: Colors.green[900],
            child: const Text("1",
                style: TextStyle(color: Colors.white),
                textDirection: TextDirection.rtl),
          ),
          Container(
            height: 300,
            width: 300,
            color: Colors.green[800],
            child: const Text("2",
                style: TextStyle(color: Colors.white),
                textDirection: TextDirection.rtl),
          ),
          Container(
            height: 250,
            width: 250,
            color: Colors.green[700],
            child: const Text("3",
                style: TextStyle(color: Colors.white),
                textDirection: TextDirection.rtl),
          ),
          Container(
            height: 200,
            width: 200,
            color: Colors.green[600],
            child: const Text("4",
                style: TextStyle(color: Colors.white),
                textDirection: TextDirection.rtl),
          ),
          Container(
            height: 150,
            width: 150,
            color: Colors.green[500],
            child: const Text("5",
                style: TextStyle(color: Colors.white),
                textDirection: TextDirection.rtl),
          ),
          Container(
            height: 100,
            width: 100,
            color: Colors.green[400],
            child: const Text("6",
                style: TextStyle(color: Colors.white),
                textDirection: TextDirection.rtl),
          ),
          Container(
            height: 50,
            width: 50,
            color: Colors.green[300],
            child: const Text("7",
                style: TextStyle(color: Colors.white),
                textDirection: TextDirection.rtl),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: Get.height * 0.36, left: Get.height * 0.36),
            child: FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.add, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}

/* ------------------------------- END ------------------------------------- */
