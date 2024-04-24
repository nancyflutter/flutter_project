/* --------------------------------- START ----------------------------------*/


import 'package:flutter/material.dart';

class ScaffoldWidgetScreen extends StatefulWidget {
  const ScaffoldWidgetScreen({Key? key}) : super(key: key);

  @override
  State<ScaffoldWidgetScreen> createState() => _ScaffoldWidgetScreenState();
}

class _ScaffoldWidgetScreenState extends State<ScaffoldWidgetScreen> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Scaffold'),
        ),
        body: Center(
          child: RichText(
            text: TextSpan(
              text: "You have pressed the button ",
              style: const TextStyle(color: Colors.black),
              children: [
                TextSpan(
                  text: "$count ",
                  style: const TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const TextSpan(
                  text: "times.",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          child: Container(
            height: 50.0,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          heroTag: "floating hero",
          onPressed: () => setState(() {
            count++;
          }),
          tooltip: 'Increment Counter',
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}



/* --------------------------------- END -------------------------------------*/
