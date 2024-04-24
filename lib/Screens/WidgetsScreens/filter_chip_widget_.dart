import 'package:flutter/material.dart';

class FilterChipWidgetScreen extends StatefulWidget {
  const FilterChipWidgetScreen({super.key});

  @override
  State<FilterChipWidgetScreen> createState() => _FilterChipWidgetScreenState();
}

class _FilterChipWidgetScreenState extends State<FilterChipWidgetScreen> {
  var data = [
    "data 1",
    "data 2",
    "data 3",
    "data 4",
    "data 5",
    "data 6",
    "data 7",
    "data 8",
  ];
  var selected = [];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return FilterChip(
            selectedColor: Colors.deepOrange,
            backgroundColor: Colors.green,
            label: Text(
              data[index],
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            selected: selected.contains(index),
            onSelected: (bool value) {
              setState(() {
                selected.contains(index) == true
                    ? selected.remove(index)
                    : selected.add(index);
              });
            },
          );
        },
      ),
    );
  }
}
