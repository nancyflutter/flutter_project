import 'package:flutter/material.dart';

class InputChipWidgetScreen extends StatefulWidget {
  const InputChipWidgetScreen({super.key});

  @override
  State<InputChipWidgetScreen> createState() => _InputChipWidgetScreenState();
}

class _InputChipWidgetScreenState extends State<InputChipWidgetScreen> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InputChip(
        label: Text(isSelected ? "Selected" : "Select",
            style: const TextStyle(color: Colors.white, fontSize: 18)),
        // avatar: Icon(Icons.check),
        deleteIcon: const Icon(Icons.cancel_rounded, color: Colors.white),
        selected: isSelected,
        selectedColor: Colors.green,
        backgroundColor: Colors.red,
        onSelected: (value) {
          setState(() {
            isSelected = value;
          });
        },
        onDeleted: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Delete Clicked"),
            ),
          );
        },
      ),
    );
  }
}
