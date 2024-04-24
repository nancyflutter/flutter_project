import 'package:flutter/material.dart';

class FloatingActionButtonWidgetScreen extends StatefulWidget {
  const FloatingActionButtonWidgetScreen({super.key});

  @override
  State<FloatingActionButtonWidgetScreen> createState() =>
      _FloatingActionButtonWidgetScreenState();
}

class _FloatingActionButtonWidgetScreenState
    extends State<FloatingActionButtonWidgetScreen> {
  bool isMini = false;
  bool isBottomNotch = false;
  FloatingActionButtonLocation location =
      FloatingActionButtonLocation.centerDocked;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          extendBody: true,
          body: Column(
            children: [
              Row(
                children: [
                  Checkbox(
                    value: isMini,
                    onChanged: (value) {
                      setState(() {
                        isMini = value!;
                      });
                    },
                  ),
                  const Text("Mini")
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: isBottomNotch,
                    onChanged: (value) {
                      setState(() {
                        isBottomNotch = value!;
                      });
                    },
                  ),
                  const Text("Bottom Notched")
                ],
              ),
              const Divider(
                thickness: 2,
              ),
              Row(
                children: [
                  Radio(
                    value: FloatingActionButtonLocation.centerDocked,
                    groupValue: location,
                    onChanged: (FloatingActionButtonLocation? value) {
                      setState(() {
                        location = value!;
                      });
                    },
                  ),
                  const Text("Center Docked")
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: FloatingActionButtonLocation.endDocked,
                    groupValue: location,
                    onChanged: (FloatingActionButtonLocation? value) {
                      setState(() {
                        location = value!;
                      });
                    },
                  ),
                  const Text("End Docked"),
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: FloatingActionButtonLocation.endFloat,
                    groupValue: location,
                    onChanged: (FloatingActionButtonLocation? value) {
                      setState(() {
                        location = value!;
                      });
                    },
                  ),
                  const Text("End Float"),
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: FloatingActionButtonLocation.centerFloat,
                    groupValue: location,
                    onChanged: (FloatingActionButtonLocation? value) {
                      setState(() {
                        location = value!;
                      });
                    },
                  ),
                  const Text("End Float"),
                ],
              ),
            ],
          ),
          floatingActionButtonLocation: location,
          floatingActionButton: FloatingActionButton(
            mini: isMini,
            onPressed: () {},
            child: const Icon(Icons.add),
          ),
          bottomNavigationBar: BottomAppBar(
            shape: isBottomNotch ? const CircularNotchedRectangle() : null,
            child: Container(
              height: 60,
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}

