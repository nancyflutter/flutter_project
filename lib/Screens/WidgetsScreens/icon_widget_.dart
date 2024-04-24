/* ------------------------------- START ------------------------------------- */

import 'package:flutter/material.dart';

class IconWidgetScreen extends StatelessWidget {
  const IconWidgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            Icons.add,
            color: Colors.green,
            size: 40,
          ),
          Icon(
            Icons.favorite,
            color: Colors.red,
            size: 40,
          ),
          Icon(
            Icons.beach_access,
            color: Colors.blue,
            size: 40,
          ),
        ],
      ),
    );
  }
}

/* ------------------------------- END ------------------------------------- */
