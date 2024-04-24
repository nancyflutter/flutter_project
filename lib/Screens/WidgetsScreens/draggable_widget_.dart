import 'package:flutter/material.dart';

class DraggableWidgetScreen extends StatefulWidget {
  const DraggableWidgetScreen({super.key});

  @override
  State<DraggableWidgetScreen> createState() => _DraggableWidgetScreenState();
}

class _DraggableWidgetScreenState extends State<DraggableWidgetScreen> {
  bool isSuccess = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              child: isSuccess
                  ? const SizedBox()
                  : Draggable(
                      data: "Flutter",
                      childWhenDragging: Container(),
                      onDraggableCanceled: (velocity, offset) {},
                      feedback: const FlutterLogo(
                        size: 400,
                      ),
                      child: const Center(
                        child: FlutterLogo(size: 100),
                      ),
                    ),
            ),
          ),
          Expanded(
            child: DragTarget(
              builder: (context, candidateData, rejectedData) => Center(
                child: isSuccess
                    ? Container(
                        color: Theme.of(context)
                            .colorScheme
                            .secondary
                            .withOpacity(0.7),
                        height: 300,
                        child: Center(
                          child: Column(
                            children: [
                              const FlutterLogo(
                                size: 100,
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    isSuccess = false;
                                  });
                                },
                                icon: const Icon(Icons.close,
                                    color: Colors.black),
                              )
                            ],
                          ),
                        ),
                      )
                    : Container(
                        height: 300,
                        color: Theme.of(context)
                            .colorScheme
                            .secondary
                            .withOpacity(0.7),
                      ),
              ),
              onWillAccept: (data) {
                return true;
              },
              onAccept: (dynamic data) {
                setState(
                  () {
                    isSuccess = true;
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
