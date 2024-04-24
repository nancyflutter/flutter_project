/* ------------------------------- START ------------------------------------- */

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExpandedWidgetScreen extends StatelessWidget {
  const ExpandedWidgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            height: Get.height * 0.09,
            color: Colors.green,
            child: const Center(child: Text("Container Top")),
          ),
          Expanded(
            child: Container(
              height: Get.height * 0.05,
              color: Colors.yellow,
            ),
          ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  height: Get.height * 0.15,
                  color: Colors.green,
                  child: const Center(child: Text("flex: 2")),
                ),
              ),
              Expanded(
                child: Container(
                  height: Get.height * 0.15,
                  color: Colors.blue,
                  child: const Center(child: Text("Container")),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: Get.height * 0.15,
                  color: Colors.green,
                  child: const Center(child: Text("flex: 1")),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              color: Colors.yellow,
            ),
          ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  height: Get.height * 0.15,
                  color: Colors.green,
                  child: const Center(child: Text("flex: 2")),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  height: Get.height * 0.15,
                  color: Colors.blue,
                  child: const Center(child: Text("flex: 3")),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: Get.height * 0.15,
                  color: Colors.green,
                  child: const Center(child: Text("flex: 1")),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              color: Colors.yellow,
            ),
          ),
          Container(
            height: Get.height * 0.09,
            color: Colors.green,
            child: const Center(child: Text("Container Bottom")),
          ),
        ],
      ),
    );
  }
}

/* ------------------------------- END ------------------------------------- */
