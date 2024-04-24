import 'package:flutter/material.dart';

class IgnorePointerScreen extends StatefulWidget {
  const IgnorePointerScreen({super.key});

  @override
  State<IgnorePointerScreen> createState() => _IgnorePointerScreenState();
}

class _IgnorePointerScreenState extends State<IgnorePointerScreen> {
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
    return  Column(
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
              IgnorePointer(
                ignoring: true,
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
        Padding(
          padding: const EdgeInsets.all(15.0),
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
