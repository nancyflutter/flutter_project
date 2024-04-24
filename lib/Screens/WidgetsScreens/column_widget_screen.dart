/* -------------------------------- START -----------------------------------*/

import 'package:flutter/material.dart';
import 'package:flutter_project/Controllers/WidgetController/column_controller_.dart';
import 'package:get/get.dart';

class ColumnWidgetScreen extends StatelessWidget {
  final ColumnController controller = Get.put(ColumnController());

  ColumnWidgetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff89b8fa),
      body: Obx(
        () => Column(
          mainAxisAlignment: controller.mainAxisAlignment.value,
          children: [
            const Text("this is the column widget 1"),
            const Text("this is the column widget 2"),
            SizedBox(
              height: Get.height * 0.1,
              child: const Image(
                image: AssetImage("assets/images/Flutter_logo.png"),
              ),
            ),
            const Text("this is the column widget 3"),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Row(
          children: [
            Obx(
              () => Radio(
                value: MainAxisAlignment.spaceEvenly,
                groupValue: controller.mainAxisAlignment.value,
                onChanged: (value) {
                  controller.updateValues(
                    MainAxisAlignment.spaceEvenly,
                  );
                },
              ),
            ),
            const Text("Evenly"),
            Obx(
              () => Radio(
                value: MainAxisAlignment.start,
                groupValue: controller.mainAxisAlignment.value,
                onChanged: (value) {
                  controller.updateValues(
                    MainAxisAlignment.start,
                  );
                },
              ),
            ),
            const Text("Start"),
            Obx(
              () => Radio(
                value: MainAxisAlignment.center,
                groupValue: controller.mainAxisAlignment.value,
                onChanged: (value) {
                  controller.updateValues(
                    MainAxisAlignment.center,
                  );
                },
              ),
            ),
            const Text("Center"),
            Obx(
              () => Radio(
                value: MainAxisAlignment.end,
                groupValue: controller.mainAxisAlignment.value,
                onChanged: (value) {
                  controller.updateValues(
                    MainAxisAlignment.end,
                  );
                },
              ),
            ),
            const Text("End")
          ],
        ),
      ),
    );
  }
}

/* ---------------------------------END--------------------------------------*/
