/* ------------------------------- START ------------------------------------- */

import 'package:flutter/material.dart';
import 'package:flutter_project/Controllers/WidgetController/list_view_widget_controller.dart';
import 'package:get/get.dart';

class SliverAppBarWidgetScreen extends StatelessWidget {
  final listViewController = Get.find<ListViewController>();

  SliverAppBarWidgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            forceElevated: true,
            pinned: true,
            snap: false,
            floating: false,
            elevation: 3,
            expandedHeight: Get.height * 0.19,
            flexibleSpace: const FlexibleSpaceBar(
              title: Text("SliverAppBar"),
              centerTitle: true,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 500,
              (context, index) {
                return Container(
                  height: Get.height * 0.07,
                  color: Colors
                      .blue[listViewController.colorShadeCode[index % 10]],
                  child: Center(
                    child: Text("item ${index + 1}"),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

/* ------------------------------- END ------------------------------------- */
