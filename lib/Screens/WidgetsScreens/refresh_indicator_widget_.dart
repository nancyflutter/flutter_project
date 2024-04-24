import 'package:flutter/material.dart';

class RefreshIndicatorWidgetScreen extends StatelessWidget {
  final List<int> colorCode = <int>[
    50,
    100,
    200,
    300,
    400,
    500,
    600,
    700,
    800,
    900
  ];

  RefreshIndicatorWidgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: Colors.yellow,
      backgroundColor: Colors.orange[900],
      onRefresh: _refresh,
      child: ListView.builder(
        itemCount: colorCode.length,
        itemBuilder: (context, index) {
          return ListTile(
            tileColor: Colors.amber[colorCode[index % 10]],
            title:
                Text("Color shade AMBER - ${colorCode[index % 10].toString()}"),
          );
        },
      ),
    );
  }

  Future<void> _refresh() {
    return Future.delayed(
      const Duration(seconds: 4),
    );
  }
}
