
/* ------------------------------- START ------------------------------------- */


import 'package:flutter/material.dart';
import 'package:flutter_project/Controllers/WidgetController/dismissible_controller_.dart';
import 'package:get/get.dart';

class DismissibleWidgetScreen extends StatelessWidget {
  final DismissibleController controller = Get.put(DismissibleController());

  DismissibleWidgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GetX<DismissibleController>(
        builder: (controller) {
          return ListView.builder(
            itemCount: controller.items.length,
            padding: const EdgeInsets.symmetric(vertical: 16),
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                background: Container(
                  color: Colors.red,
                ),
                key: ValueKey<int>(controller.items[index]),
                onDismissed: (DismissDirection direction) {
                  controller.updateValues(index);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Remove - Item $index"),
                    ),
                  );
                },
                child: ListTile(
                  tileColor: Colors.amber[controller.colorCode[index % 10]],
                  title: Center(
                    child: Text(
                      'Item ${controller.items[index]}',
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}


/* ------------------------------- END ------------------------------------- */
