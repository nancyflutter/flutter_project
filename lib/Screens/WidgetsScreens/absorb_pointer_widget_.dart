import 'package:flutter/material.dart';

class AbsorbPointerWidgetScreen extends StatefulWidget {
  const AbsorbPointerWidgetScreen({super.key});

  @override
  State<AbsorbPointerWidgetScreen> createState() =>
      _AbsorbPointerWidgetScreenState();
}

class _AbsorbPointerWidgetScreenState extends State<AbsorbPointerWidgetScreen> {
  dynamic textString;

  @override
  void initState() {
    // TODO: implement initState
    update();
    super.initState();
  }

  update() {
    setState(() {
      textString = "touch above container";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Stack(
            alignment: Alignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    textString = "you touched pink container.";
                  });
                },
                child: Container(
                  color: Colors.pink,
                ),
              ),
              AbsorbPointer(
                absorbing: true,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      textString = "You touch yellow container";
                    });
                  },
                  child: Center(
                    child: Container(
                      color: Colors.yellow,
                      height: 200,
                      width: 200,
                      child: const Center(
                          child: Text("I am visible to hit testing.")),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          color: Colors.greenAccent,
          child: Text(
            textString,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 26,
            ),
          ),
        ),
      ],
    );
  }
}
