import 'package:flutter/material.dart';
import 'dart:math';

class TransFormWidgetScreen extends StatelessWidget {
  const TransFormWidgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.black,
      child: Transform(
        transform: Matrix4.skewY(0.3)..rotateZ(pi / 36.0),
        child: Container(
          color: Theme.of(context).primaryColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Transform(
              transform: Matrix4.skewY(0.3)..rotateZ(pi / 36.0),
              child: Container(
                color: Theme.of(context).primaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Transform(
                    alignment: Alignment.topRight,
                    transform: Matrix4.skewY(0.3)..rotateZ(pi / 36.0),
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      color: Theme.of(context).primaryColor,
                      child: const Center(child: Text('Apartment for rent!')),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
