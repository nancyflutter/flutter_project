/* ------------------------------------ START ----------------------------------------*/

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SliverListWidgetScreen extends StatelessWidget {
  const SliverListWidgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              // childCount: 100,
              (context, index) {
                return Container(
                  height: Get.height * 0.13,
                  color: Color((Random().nextDouble() * 0xffffff).toInt() << 0)
                      .withOpacity(1.0),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

/* ------------------------------------ END ----------------------------------------*/
