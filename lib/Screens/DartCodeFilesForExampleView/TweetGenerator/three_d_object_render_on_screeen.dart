import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';
import 'package:sensors_plus/sensors_plus.dart';

class ObjectRender3D extends StatefulWidget {
  const ObjectRender3D({super.key});

  @override
  State<ObjectRender3D> createState() => _ObjectRender3DState();
}

class _ObjectRender3DState extends State<ObjectRender3D> with SingleTickerProviderStateMixin {
  late Scene _scene;
  Object? _cube;
  double xAngle = 0.0;
  double yAngle = 0.0;
  double zAngle = 0.0;


  @override
  void initState() {
    super.initState();
    //listening to gyroscope event.
    gyroscopeEvents.listen((GyroscopeEvent event) {
      setState(() {
        if (_cube != null) {
          var x = event.x;
          var y = event.y;
          var z = event.z;
          _cube!.rotation.x += y;
          _cube!.rotation.y -= x;
          _cube!.rotation.z += z;
          _cube!.updateTransform();
          _scene.update();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const Scaffold();
  }
}
