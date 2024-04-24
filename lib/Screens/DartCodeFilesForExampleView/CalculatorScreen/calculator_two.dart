import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalculatorTwo extends StatefulWidget {
  const CalculatorTwo({super.key});

  @override
  State<CalculatorTwo> createState() => _CalculatorTwoState();
}

class _CalculatorTwoState extends State<CalculatorTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.red.shade900,
                ),
              ),
              padding: const EdgeInsets.all(10.0),
              alignment: Alignment.bottomRight,
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 60.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.red[900],
                ),
              ),
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    customOutlineButton("1"),
                    customOutlineButton("2"),
                    customOutlineButton("3"),
                    customOutlineButton("/"),
                  ],
                ),
                Row(
                  children: [
                    customOutlineButton("4"),
                    customOutlineButton("5"),
                    customOutlineButton("6"),
                    customOutlineButton("x"),
                  ],
                ),
                Row(
                  children: [
                    customOutlineButton("7"),
                    customOutlineButton("8"),
                    customOutlineButton("9"),
                    customOutlineButton("-"),
                  ],
                ),
                Row(
                  children: [
                    customOutlineButton("."),
                    customOutlineButton("0"),
                    customOutlineButton("00"),
                    customOutlineButton("+"),
                  ],
                ),
                Row(
                  children: [
                    customOutlineButton("CLEAR"),
                    customOutlineButton("="),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget customOutlineButton(String val) {
    return Expanded(
      child: Container(
        height: Get.height * 0.1,
        width: Get.height * 0.1,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.teal.shade400,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(6),
          ),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal[100],
          ),
          onPressed: () => btnClicked(val),
          child: Text(
            val,
            style: TextStyle(fontSize: 35.0, color: Colors.teal[700]),
          ),
        ),
      ),
    );
  }

  num first = 0;
  num? second;
  String text = "";
  String opp = "";

  void btnClicked(String btnText) {
    if (btnText == "CLEAR") {
      text = "";
      first = 0;
      second = null;
      opp = "";
    } else if (btnText == "+" ||
        btnText == "-" ||
        btnText == "x" ||
        btnText == "/") {
      if (text.isNotEmpty) {
        first = num.parse(text);
        text = "";
        opp = btnText;
      }
    } else if (btnText == ".") {
      if (!text.contains(".")) {
        text = text.isEmpty ? "0." : "$text.";
      }
    } else if (btnText == "=") {
      if (opp.isNotEmpty && text.isNotEmpty) {
        second = num.parse(text);
        if (opp == "+") {
          text = (first + second!).toString();
        } else if (opp == "-") {
          text = (first - second!).toString();
        } else if (opp == "x") {
          text = (first * second!).toString();
        } else if (opp == "/") {
          if (second != 0) {
            text = (first / second!).toString();
          } else {
            text = "Error";
          }
        }
        opp = "";
      }
    } else {
      text += btnText;
    }
    setState(() {});
  }
}
