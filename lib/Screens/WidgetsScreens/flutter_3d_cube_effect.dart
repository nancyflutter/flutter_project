import 'dart:math';

import 'package:flutter/material.dart';

class Flutter3DCubeEffect extends StatefulWidget {
  const Flutter3DCubeEffect({super.key});

  @override
  State<Flutter3DCubeEffect> createState() => _Flutter3DCubeEffectState();
}

class _Flutter3DCubeEffectState extends State<Flutter3DCubeEffect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: const SafeArea(
          top: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('Flutter 3D Cube Effect'),
              Expanded(
                child: Pseudo3dSlider(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Pseudo3dSlider extends StatefulWidget {
  const Pseudo3dSlider({super.key});

  @override
  State<Pseudo3dSlider> createState() => _Pseudo3dSliderState();
}

class _Pseudo3dSliderState extends State<Pseudo3dSlider> {
  Map<String, Offset> offsets = {
    'start': const Offset(70, 100),
    'finish': const Offset(200, 100),
    'center': const Offset(100, 200),
  };

  double originX = 0;
  double x = 0;

  void onDragStart(double originX) => setState(() {
        this.originX = originX;
      });

  void onDragUpdate(double x) => setState(() {
        this.x = originX - x;
      });

  double get turnRatio {
    const step = -150.0;
    var k = x / step;
    k = k > 1 ? 1 : (k < 0 ? 0 : k);
    return 1 - k;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onPanStart: (details) => onDragUpdate(details.globalPosition.dx),
      onPanUpdate: (details) => onDragUpdate(details.globalPosition.dx),
      child: Slider(
        k: turnRatio,
        children: [
          const Side(
            color: Colors.blueAccent,
            number: 1,
          ),
          Side(
            color: Colors.redAccent.shade200,
            number: 2,
          ),
        ],
      ),
    );
  }
}

class Side extends StatelessWidget {
  const Side({Key? key, required this.color, required this.number}) : super(key: key);

  final Color color;
  final int number;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 380,
      color: color,
      child: Center(
        child: Text(
          number.toString(),
          style: const TextStyle(fontSize: 14),
        ),
      ),
    );
  }
}

class Slider extends StatelessWidget {
  Slider({
    Key? key,
    required this.children,
    required this.k,
  }) : super(key: key) {
    assert(children.length == 2, 'wronge nubmer of children');
  }

  final List<Widget> children;
  final double k;

  @override
  Widget build(BuildContext context) {
    var k1 = k;
    var k2 = 1 - k;
    print(k1);
    print(k2);
    return Row(
      children: [
        Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.003)
            ..rotateY(pi / 2 * k1),
          alignment: FractionalOffset.centerRight,
          child: children[0],
        ),
        Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.003)
            ..rotateY(pi / 2 * -k2),
          alignment: FractionalOffset.centerLeft,
          child: children[1],
        )
      ],
    );
  }
}
