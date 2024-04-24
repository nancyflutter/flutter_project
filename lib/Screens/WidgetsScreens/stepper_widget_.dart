
/* ------------------------------- START ------------------------------------- */


import 'package:flutter/material.dart';

class StepperWidgetScreen extends StatefulWidget {
  const StepperWidgetScreen({super.key});

  @override
  State<StepperWidgetScreen> createState() => _StepperWidgetScreenState();
}

class _StepperWidgetScreenState extends State<StepperWidgetScreen> {
  int _currentStep = 0;
  StepperType stepperType = StepperType.vertical;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Stepper(
              type: stepperType,
              physics: const ScrollPhysics(),
              currentStep: _currentStep,
              onStepTapped: (step) => tapped(step),
              onStepContinue: continued,
              onStepCancel: cancel,
              steps: <Step>[
                Step(
                  title: const Text('Step 1'),
                  content: const Column(
                    children: [Text("start")],
                  ),
                  isActive: _currentStep >= 0,
                  state: _currentStep >= 0
                      ? StepState.complete
                      : StepState.disabled,
                ),
                Step(
                  title: const Text('Step 2'),
                  content: const Column(
                    children: [Text("Process 1")],
                  ),
                  isActive: _currentStep >= 0,
                  state: _currentStep >= 1
                      ? StepState.complete
                      : StepState.disabled,
                ),
                Step(
                  title: const Text('Step 3'),
                  content: const Column(
                    children: [Text("Process 2")],
                  ),
                  isActive: _currentStep >= 0,
                  state: _currentStep >= 2
                      ? StepState.complete
                      : StepState.disabled,
                ),
                Step(
                  title: const Text('Step 4'),
                  content: const Column(
                    children: [Text("Process 3")],
                  ),
                  isActive: _currentStep >= 0,
                  state: _currentStep >= 3
                      ? StepState.complete
                      : StepState.disabled,
                ),
                Step(
                  title: const Text('Step 5'),
                  content: const Column(
                    children: [Text("Process 4")],
                  ),
                  isActive: _currentStep >= 0,
                  state: _currentStep >= 4
                      ? StepState.complete
                      : StepState.disabled,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  switchStepsType() {
    setState(() => stepperType == StepperType.vertical
        ? stepperType = StepperType.horizontal
        : stepperType = StepperType.vertical);
  }

  tapped(int step) {
    setState(() => _currentStep = step);
  }

  continued() {
    _currentStep < 4 ? setState(() => _currentStep += 1) : null;
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }
}


/* ------------------------------- END ------------------------------------- */
