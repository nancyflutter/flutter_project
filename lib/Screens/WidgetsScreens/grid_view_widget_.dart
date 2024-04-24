
/* ------------------------------- START ------------------------------------- */

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_project/Controllers/WidgetController/random_color_gen_controller.dart';
import 'package:get/get.dart';

class GridViewWidgetScreen extends StatelessWidget {
  final randomColorController = Get.find<RandomColorController>();

  GridViewWidgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(15.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 10.0,
          shrinkWrap: true,
          children: List.generate(
            16,
            (index) {
              return Container(
                height: Get.height * 0.02,
                decoration: BoxDecoration(
                  // color: randomColorController.colors[index],
                  color: Color((Random().nextDouble()*0xffffff).toInt()<<0).withOpacity(1.0),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
              );
            },
          ),
        ),

    );
  }
}


/* ------------------------------- START ------------------------------------- */

