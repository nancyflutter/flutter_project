import 'package:flutter/material.dart';
import 'package:flutter_project/Controllers/WidgetController/radio_button_widget_controller_.dart';
import 'package:get/get.dart';

class RadioButtonWidgetScreen extends StatelessWidget {
  final RadioButtonController controller = Get.put(RadioButtonController());

  RadioButtonWidgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: "Selected Number :",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: "${controller.num.value}",
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 23,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Obx(
                          () => Radio(
                            value: 1,
                            groupValue: controller.num.value,
                            onChanged: (value) {
                              controller.updateValues(1);
                            },
                          ),
                        ),
                        const Text("1"),
                      ],
                    ),
                    Row(
                      children: [
                        Obx(
                          () => Radio(
                            value: 2,
                            groupValue: controller.num.value,
                            onChanged: (value) {
                              controller.updateValues(2);
                            },
                          ),
                        ),
                        const Text("2"),
                      ],
                    ),
                    Row(
                      children: [
                        Obx(
                          () => Radio(
                            value: 3,
                            groupValue: controller.num.value,
                            onChanged: (value) {
                              controller.updateValues(3);
                            },
                          ),
                        ),
                        const Text("3"),
                      ],
                    ),
                    Row(
                      children: [
                        Obx(
                          () => Radio(
                            value: 4,
                            groupValue: controller.num.value,
                            onChanged: (value) {
                              controller.updateValues(4);
                            },
                          ),
                        ),
                        const Text("4"),
                      ],
                    ),
                    Row(
                      children: [
                        Obx(
                          () => Radio(
                            value: 5,
                            groupValue: controller.num.value,
                            onChanged: (value) {
                              controller.updateValues(5);
                            },
                          ),
                        ),
                        const Text("5"),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: "Selected Character :",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: controller.char.value,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 23,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Obx(
                          () => Radio(
                            value: "A",
                            groupValue: controller.char.value,
                            onChanged: (value) {
                              controller.updateCharValues("A");
                            },
                          ),
                        ),
                        const Text("A"),
                      ],
                    ),
                    Row(
                      children: [
                        Obx(
                          () => Radio(
                            value: "B",
                            groupValue: controller.char.value,
                            onChanged: (value) {
                              controller.updateCharValues("B");
                            },
                          ),
                        ),
                        const Text("B"),
                      ],
                    ),
                    Row(
                      children: [
                        Obx(
                          () => Radio(
                            value: "C",
                            groupValue: controller.char.value,
                            onChanged: (value) {
                              controller.updateCharValues("C");
                            },
                          ),
                        ),
                        const Text("C"),
                      ],
                    ),
                    Row(
                      children: [
                        Obx(
                          () => Radio(
                            value: "D",
                            groupValue: controller.char.value,
                            onChanged: (value) {
                              controller.updateCharValues("D");
                            },
                          ),
                        ),
                        const Text("D"),
                      ],
                    ),
                    Row(
                      children: [
                        Obx(
                          () => Radio(
                            value: "E",
                            groupValue: controller.char.value,
                            onChanged: (value) {
                              controller.updateCharValues("E");
                            },
                          ),
                        ),
                        const Text("E"),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
