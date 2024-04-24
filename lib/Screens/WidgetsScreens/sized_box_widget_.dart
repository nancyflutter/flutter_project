/* ------------------------------- START ------------------------------------- */

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SizedBoxWidgetScreen extends StatelessWidget {
  const SizedBoxWidgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text("Simple Button"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Simple Button"),
            ),
            SizedBox(
              height: Get.height * 0.09,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Button with fix height"),
              ),
            ),
            SizedBox(
              width: Get.width * 0.19,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Button with fix width"),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Button with infinity width"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/* ------------------------------- END ------------------------------------- */
