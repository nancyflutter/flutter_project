import 'package:flutter/material.dart';

class CheckBoxListTileScreen extends StatefulWidget {
  const CheckBoxListTileScreen({super.key});

  @override
  State<CheckBoxListTileScreen> createState() => _CheckBoxListTileScreenState();
}

class _CheckBoxListTileScreenState extends State<CheckBoxListTileScreen> {
  bool? isCheck1 = false;
  bool? isCheck2 = false;
  bool? isCheck3 = false;
  bool? isCheck4 = false;
  bool? isCheck5 = false;
  bool? isCheck6 = false;
  bool? isCheck7 = false;
  List<String> list = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            CheckboxListTile(
              secondary: const Icon(Icons.animation),
              value: isCheck1,
              title: const Text("FootBall"),
              onChanged: (value) {
                setState(() {
                  isCheck1 = value;
                  String strValue = "FootBall";
                  value! ? list.add(strValue) : list.remove(strValue);
                });
              },
            ),
            CheckboxListTile(
              tileColor: Colors.greenAccent,
              subtitle: const Text("subtitle"),
              activeColor: Colors.deepPurple[400],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              // fillColor: MaterialStateProperty.resolveWith(getColor),
              autofocus: true,
              dense: true,
              checkboxShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              secondary: const Icon(Icons.animation),
              value: isCheck2,
              controlAffinity: ListTileControlAffinity.leading,
              title: const Text("Baseball"),
              onChanged: (value) {
                setState(() {
                  isCheck2 = value;
                  String strValue = "Baseball";
                  value! ? list.add(strValue) : list.remove(strValue);
                });
              },
            ),
            CheckboxListTile(
              secondary: const Icon(Icons.animation),
              value: isCheck3,
              title: const Text("Cricket"),
              onChanged: (value) {
                setState(() {
                  isCheck3 = value;
                  String strValue = "Cricket";
                  value! ? list.add(strValue) : list.remove(strValue);
                });
              },
            ),
            CheckboxListTile(
              secondary: const Icon(Icons.animation),
              value: isCheck4,
              controlAffinity: ListTileControlAffinity.leading,
              activeColor: Colors.green,
              title: const Text("Kabaddi"),
              onChanged: (value) {
                setState(() {
                  isCheck4 = value;
                  String strValue = "Kabaddi";
                  value! ? list.add(strValue) : list.remove(strValue);
                });
              },
            ),
            CheckboxListTile(
              secondary: const Icon(Icons.animation),
              value: isCheck5,
              title: const Text("BasketBall"),
              onChanged: (value) {
                setState(() {
                  isCheck5 = value;
                  String strValue = "BasketBall";
                  value! ? list.add(strValue) : list.remove(strValue);
                });
              },
            ),
            CheckboxListTile(
              secondary: const Icon(Icons.animation),
              value: isCheck6,
              activeColor: Colors.green,
              checkColor: Colors.yellow,
              controlAffinity: ListTileControlAffinity.leading,
              title: const Text("VolleyBall"),
              onChanged: (value) {
                setState(() {
                  isCheck6 = value;
                  String strValue = "VolleyBall";
                  value! ? list.add(strValue) : list.remove(strValue);
                });
              },
            ),
            CheckboxListTile(
              secondary: const Icon(Icons.offline_bolt),
              checkColor: Colors.yellow,
              activeColor: Colors.red,
              value: isCheck7,
              title: const Text("Other Games"),
              onChanged: (value) {
                setState(() {
                  isCheck7 = value;
                  String strValue = "Other Games";
                  value! ? list.add(strValue) : list.remove(strValue);
                });
              },
            ),
          ],
        ),
        Center(
          child: Row(
            children: [
              Flexible(
                child: Text(
                  "$list",
                  softWrap: true,
                  style: const TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    height: 1.5,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
