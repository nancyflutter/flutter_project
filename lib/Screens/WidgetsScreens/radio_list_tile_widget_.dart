import 'package:flutter/material.dart';

class RadioListTileWidget extends StatefulWidget {
  const RadioListTileWidget({super.key});

  @override
  State<RadioListTileWidget> createState() => _RadioListTileWidgetState();
}

class _RadioListTileWidgetState extends State<RadioListTileWidget> {
  Color? color = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Column(
        children: [
          RadioListTile(
            value: Colors.greenAccent,
            groupValue: color,
            title: const Text("Green"),
            onChanged: (Color? value) {
              setState(() {
                color = value;
              });
            },
          ),
          RadioListTile(
            value: Colors.yellow,
            groupValue: color,
            title: const Text("Yellow"),
            onChanged: (Color? value) {
              setState(() {
                color = value;
              });
            },
          ),
          RadioListTile(
            value: Colors.red,
            groupValue: color,
            title: const Text("Red"),
            onChanged: (Color? value) {
              setState(() {
                color = value;
              });
            },
          ),
          RadioListTile(
            value: Colors.indigo,
            groupValue: color,
            title: const Text("Blue"),
            onChanged: (Color? value) {
              setState(() {
                color = value;
              });
            },
          ),
          RadioListTile(
            value: Colors.orange,
            groupValue: color,
            title: const Text("Orange"),
            onChanged: (Color? value) {
              setState(() {
                color = value;
              });
            },
          ),
          RadioListTile(
            value: Colors.purpleAccent,
            groupValue: color,
            title: const Text("Purple Accent"),
            onChanged: (Color? value) {
              setState(() {
                color = value;
              });
            },
          ),
          RadioListTile(
            value: Colors.white,
            groupValue: color,
            title: const Text("White"),
            onChanged: (Color? value) {
              setState(() {
                color = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
