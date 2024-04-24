/* ------------------------------- START ------------------------------------- */

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SliverGridWidgetScreen extends StatelessWidget {
  const SliverGridWidgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: CustomScrollView(
        slivers: [
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Container(
                color: Color((Random().nextDouble() * 0xffffff).toInt() << 0)
                    .withOpacity(1.0),
                height: Get.height * 0.1,
              ),
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 8,
            ),
          )
        ],
      ),
    );
  }
}

/* ------------------------------- END ------------------------------------- */
