
/* ------------------------------- START ------------------------------------- */


import 'package:flutter/material.dart';

class DropDownButtonScreen extends StatefulWidget {
  const DropDownButtonScreen({Key? key}) : super(key: key);

  @override
  State<DropDownButtonScreen> createState() => _DropDownButtonScreenState();
}

class _DropDownButtonScreenState extends State<DropDownButtonScreen> {
  String dropDownValue = 'Green';
  var items = [
    'Green',
    'Red',
    'Yellow',
    'Blue',
    'Pink',
    'Orange',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 500,
              width: 350,
              color: getColor(dropDownValue),
              child: Center(
                child: DropdownButton(
                  value: dropDownValue,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropDownValue = newValue!;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color getColor(String color) {
    if (color.compareTo("Green") == 0) {
      return Colors.green;
    } else if (color.compareTo("Red") == 0) {
      return Colors.red;
    } else if (color.compareTo("Yellow") == 0) {
      return Colors.yellow;
    } else if (color.compareTo("Blue") == 0) {
      return Colors.blue;
    } else if (color.compareTo("Pink") == 0) {
      return Colors.pink;
    } else if (color.compareTo("Orange") == 0) {
      return Colors.orange;
    } else {
      return Colors.white;
    }
  }
}


/* ------------------------------- END ------------------------------------- */
