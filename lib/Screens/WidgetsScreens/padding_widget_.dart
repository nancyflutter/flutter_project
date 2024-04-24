import 'package:flutter/material.dart';

class PaddingWidgetScreen extends StatelessWidget {
  const PaddingWidgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.orange,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Container(
                  color: Colors.red,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16, top: 16),
                    child: Container(
                      color: Colors.yellow,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 16, left: 16),
                        child: Container(
                          color: Colors.amber,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
