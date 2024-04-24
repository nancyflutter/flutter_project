import 'package:flutter/material.dart';

class ChoiceChipWidgetScreen extends StatefulWidget {
  const ChoiceChipWidgetScreen({super.key});

  @override
  State<ChoiceChipWidgetScreen> createState() => _ChoiceChipWidgetScreenState();
}

class _ChoiceChipWidgetScreenState extends State<ChoiceChipWidgetScreen> {
  int? _value = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 10.0),
          Wrap(
            spacing: 5.0,
            direction: Axis.vertical,
            children: List<Widget>.generate(
              8,
              (int index) {
                return ChoiceChip(
                  label: Text('Choice $index'),
                  selected: _value == index,
                  backgroundColor: Colors.greenAccent,
                  selectedColor: Colors.deepPurple[400],
                  onSelected: (bool selected) {
                    setState(() {
                      _value = selected ? index : null;
                    });
                  },
                );
              },
            ).toList(),
          ),
        ],
      ),
    );
  }
}
