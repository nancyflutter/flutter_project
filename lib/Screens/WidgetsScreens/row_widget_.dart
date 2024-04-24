/* -------------------------------- START -----------------------------------*/

import 'package:flutter/material.dart';
import 'package:flutter_project/Controllers/WidgetController/row_controller_.dart';
import 'package:get/get.dart';

class RowWidgetScreen extends StatelessWidget {
  final RowController controller = Get.put(RowController());

  RowWidgetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Scaffold(
        body: Obx(
          () => Row(
            mainAxisAlignment: controller.mainAxisAlignment.value,
            children: [
              Container(
                height: double.infinity,
                color: Colors.green[100],
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(child: Text("Item 1")),
                ),
              ),
              Container(
                height: double.infinity,
                color: Colors.yellow[100],
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(child: Text("Item 2")),
                ),
              ),
              Container(
                height: double.infinity,
                color: Colors.red[100],
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(child: Text("Item 3")),
                ),
              ),
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
      ),
    );
  }
}

/* ---------------------------------END--------------------------------------*/
