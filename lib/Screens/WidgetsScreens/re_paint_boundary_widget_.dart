
import 'package:flutter/material.dart';

class RepaintBoundaryWidgetScreen extends StatefulWidget {
  const RepaintBoundaryWidgetScreen({Key? key}) : super(key: key);

  @override
  State<RepaintBoundaryWidgetScreen> createState() =>
      _RepaintBoundaryWidgetScreenState();
}

class _RepaintBoundaryWidgetScreenState
    extends State<RepaintBoundaryWidgetScreen> {
  List<List<Offset>> strokes = [];
  List<Offset> currentStroke = [];
  Color selectedColor = Colors.black;
  double strokeWidth = 5.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RepaintBoundary(
              child: GestureDetector(
                onPanStart: (details) {
                  setState(() {
                    currentStroke = [details.localPosition];
                    strokes.add(currentStroke);
                  });
                },
                onPanUpdate: (details) {
                  setState(() {
                    currentStroke.add(details.localPosition);
                  });
                },
                onPanEnd: (_) {
                  setState(() {
                    currentStroke.add(Offset.infinite);
                  });
                },
                child: Container(
                  width: 300,
                  height: 400,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: CustomPaint(
                    painter: MyCustomPainter(
                      strokes: strokes,
                      color: selectedColor,
                      strokeWidth: strokeWidth,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ColorButton(
                  color: Colors.black,
                  isSelected: selectedColor == Colors.black,
                  onTap: () {
                    setState(() {
                      selectedColor = Colors.black;
                    });
                  },
                ),
                ColorButton(
                  color: Colors.red,
                  isSelected: selectedColor == Colors.red,
                  onTap: () {
                    setState(() {
                      selectedColor = Colors.red;
                    });
                  },
                ),
                ColorButton(
                  color: Colors.blue,
                  isSelected: selectedColor == Colors.blue,
                  onTap: () {
                    setState(() {
                      selectedColor = Colors.blue;
                    });
                  },
                ),
                BrushSizeButton(
                  size: 5.0,
                  isSelected: strokeWidth == 5.0,
                  onTap: () {
                    setState(() {
                      strokeWidth = 5.0;
                    });
                  },
                ),
                BrushSizeButton(
                  size: 10.0,
                  isSelected: strokeWidth == 10.0,
                  onTap: () {
                    setState(() {
                      strokeWidth = 10.0;
                    });
                  },
                ),
                BrushSizeButton(
                  size: 15.0,
                  isSelected: strokeWidth == 15.0,
                  onTap: () {
                    setState(() {
                      strokeWidth = 15.0;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  strokes.clear();
                  currentStroke.clear();
                });
              },
              child: const Text("Clear Canvas"),
            ),
          ],
        ),
      ),
    );
  }
}

class MyCustomPainter extends CustomPainter {
  final List<List<Offset>> strokes;
  final Color color;
  final double strokeWidth;

  MyCustomPainter({
    required this.strokes,
    required this.color,
    required this.strokeWidth,
  }) : super();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    for (final stroke in strokes) {
      if (stroke.isNotEmpty) {
        final path = Path();
        path.moveTo(stroke.first.dx, stroke.first.dy);
        for (int i = 1; i < stroke.length; i++) {
          if (stroke[i] != Offset.infinite) {
            path.lineTo(stroke[i].dx, stroke[i].dy);
          } else {
            i++;
            if (i < stroke.length) {
              path.moveTo(stroke[i].dx, stroke[i].dy);
            }
          }
        }
        canvas.drawPath(path, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class ColorButton extends StatelessWidget {
  final Color color;
  final bool isSelected;
  final VoidCallback onTap;

  const ColorButton({
    super.key,
    required this.color,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 30,
        height: 30,
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color: color,
          border: Border.all(
            color: isSelected ? Colors.black : Colors.transparent,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}

class BrushSizeButton extends StatelessWidget {
  final double size;
  final bool isSelected;
  final VoidCallback onTap;

  const BrushSizeButton({
    super.key,
    required this.size,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 30,
        height: 30,
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: isSelected ? Colors.black : Colors.transparent,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ),
    );
  }
}
