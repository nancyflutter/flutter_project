/* ------------------------------- START ------------------------------------- */

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_project/Controllers/WidgetController/back_drop_filter_controller_.dart';
import 'package:get/get.dart';

class BackDropFilterWidgetScreen extends StatelessWidget {
  final BackDropFilterController controller =
      Get.put(BackDropFilterController());

  BackDropFilterWidgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: Get.height * 0.3,
                color: Colors.white,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 70,
                      width: 90,
                      child: FlutterLogo(),
                    ),
                    Text(
                      "Flutter",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 60,
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: ClipRRect(
                  child: Obx(
                    () => BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: controller.sX.value,
                        sigmaY: controller.sY.value,
                      ),
                      child: SizedBox(
                        width: Get.width * 0.7,
                        height: Get.height * 0.3,
                        child: Center(child: Text(controller.textVar.value)),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Wrap(
              spacing: 20,
              runSpacing: 15,
              direction: Axis.horizontal,
              children: [
                ElevatedButton(
                  onPressed: () {
                    controller.updateValues(1, 1, "x:1, y:1");
                  },
                  child: const Text("x:1, y:1"),
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.updateValues(1, 5, "x:1, y:5");
                  },
                  child: const Text("x:1, y:5"),
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.updateValues(5, 1, "x:5, y:1");
                  },
                  child: const Text("x:5, y:1"),
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.updateValues(5, 5, "x:5, y:5");
                  },
                  child: const Text("x:5, y:5"),
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.updateValues(5, 10, "x:5, y:10");
                  },
                  child: const Text("x:5, y:10"),
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.updateValues(10, 5, "x:10, y:5");
                  },
                  child: const Text("x:10, y:5"),
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.updateValues(10, 10, "x:10, y:10");
                  },
                  child: const Text("x:10, y:10"),
                ),
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/img_1.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                    child: ClipOval(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                        child: const SizedBox(
                          width: 150.0,
                          height: 115.0,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: FlutterLogo(),
                                ),
                                Text(
                                  "Flutter",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/* ------------------------------- END ------------------------------------- */
