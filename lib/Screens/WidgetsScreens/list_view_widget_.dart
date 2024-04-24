/* ------------------------------- START ------------------------------------- */

import 'package:flutter/material.dart';
import 'package:flutter_project/Controllers/WidgetController/list_view_widget_controller.dart';
import 'package:get/get.dart';

class ListViewWidgetScreen extends StatelessWidget {
  final listViewController = Get.find<ListViewController>();

  ListViewWidgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 500,
      itemBuilder: (context, index) {
        return Container(
          height: Get.height * 0.07,
          color: Colors.orange[listViewController.colorShadeCode[index % 10]],
          child: Center(child: Text("item ${index + 1}")),
        );
      },
    );
  }
}

/* ------------------------------- END ------------------------------------- */
