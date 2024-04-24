import 'package:flutter/material.dart';

class DraggableScrollableSheetScreen extends StatelessWidget {
  const DraggableScrollableSheetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: DraggableScrollableSheet(
        builder: (BuildContext context,ScrollController scrollController) {
          return Container(
            color: Colors.amber,
            child: ListView.builder(
              controller: scrollController,
              itemCount: 20,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("Item: $index"),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
