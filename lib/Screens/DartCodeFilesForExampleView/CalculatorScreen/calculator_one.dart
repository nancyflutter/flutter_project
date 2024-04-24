import 'package:flutter/material.dart';
import 'package:flutter_project/Commons/CommonWidgets/common_text_field_widget.dart';
import 'package:get/get.dart';

class CalculatorOne extends StatefulWidget {
  const CalculatorOne({super.key});

  @override
  State<CalculatorOne> createState() => _CalculatorOneState();
}

class _CalculatorOneState extends State<CalculatorOne> {
  final TextEditingController firstValue = TextEditingController();
  final TextEditingController secondValue = TextEditingController();
  String outPut = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0, left: 10, right: 10),
        child: ListView(
          children: [
            CommonTextField(
              keyboardType: TextInputType.number,
              controller: firstValue,
              fillColor: Colors.white,
              hintText: "Enter First number",
            ),
            CommonTextField(
              keyboardType: TextInputType.number,
              controller: secondValue,
              fillColor: Colors.white,
              hintText: "Enter Second number",
            ),
            Center(
              child: Text(
                "Output: $outPut",
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      addImplement();
                    },
                    child: const Icon(Icons.add),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      removeImplement();
                    },
                    child: const Icon(Icons.remove),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      multiplyImplement();
                    },
                    child: const Row(
                      children: [
                        Text(
                          "*",
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      divideImplement();
                    },
                    child: const Text(
                      "/",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: Get.width * 0.3, right: Get.width * 0.3, top: 8),
              child: ElevatedButton(
                onPressed: () {
                  clearImplement();
                },
                child: const Text("Clear"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void addImplement() {
    double firstNum = double.tryParse(firstValue.text) ?? 0;
    double secondNum = double.tryParse(secondValue.text) ?? 0;
    double result = firstNum + secondNum;
    setState(() {
      outPut = "$result";
    });
  }

  void removeImplement() {
    double firstNum = double.tryParse(firstValue.text) ?? 0;
    double secondNum = double.tryParse(secondValue.text) ?? 0;
    double result = firstNum - secondNum;
    setState(() {
      outPut = "$result";
    });
  }

  void multiplyImplement() {
    double firstNum = double.tryParse(firstValue.text) ?? 0;
    double secondNum = double.tryParse(secondValue.text) ?? 0;
    double result = firstNum * secondNum;
    setState(() {
      outPut = "$result";
    });
  }

  void divideImplement() {
    double firstNum = double.tryParse(firstValue.text) ?? 0;
    double secondNum = double.tryParse(secondValue.text) ?? 0;
    double result = firstNum / secondNum;
    setState(() {
      outPut = "$result";
    });
  }

  void clearImplement() {
    firstValue.text = "";
    secondValue.text = "";
    setState(() {
      outPut = "";
    });
  }
}
