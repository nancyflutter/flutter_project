import 'package:flutter/material.dart';

class PhysicalModelScreen extends StatelessWidget {
  const PhysicalModelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            PhysicalModel(
              elevation: 12,
              color: Colors.orange,
              shadowColor: Colors.green,
              borderRadius: BorderRadius.circular(45),
              child: Container(
                color: Colors.purpleAccent[100],
                width: 200,
                height: 200,
              ),
            ),
            PhysicalModel(
              elevation: 18,
              color: Colors.orange,
              shadowColor: Colors.green,
              borderRadius: BorderRadius.circular(45),
              child: Opacity(
                opacity: 0.75,
                child: Container(
                  color: Colors.purpleAccent[100],
                  width: 200,
                  height: 200,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
