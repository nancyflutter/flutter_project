import 'package:flutter/material.dart';
import 'package:flutter_project/Commons/CommonWidgets/common_text_field_widget.dart';
import 'package:get/get.dart';

class LogInDesignFive extends StatelessWidget {
  const LogInDesignFive({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.tealAccent,
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: Get.height * 0.82,
                width: Get.width * 1,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(300),
                  ),
                ),
              ),
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.green[900],
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(300),
                  ),
                ),
              ),
              Container(
                height: 90,
                width: 90,
                decoration: const BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(300),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  top: 15.0,
                  left: 15,
                ),
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: Get.height * 0.2),
                child: Column(
                  children: [
                    CommonTextField(
                      textFieldBoxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 5),
                          blurRadius: 10.0,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ],
                      fillColor: Colors.white,
                      hintText: "UserName",
                      prefixIcon: const Icon(Icons.person),
                    ),
                    CommonTextField(
                      textFieldBoxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 5),
                          blurRadius: 10.0,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ],
                      fillColor: Colors.white,
                      hintText: "PassWord",
                      prefixIcon: const Icon(Icons.lock),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: Get.height * 0.73,
                  left: Get.width * 0.82,
                ),
                child: CircleAvatar(
                  maxRadius: 25,
                  backgroundColor: Colors.pink,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_forward_sharp),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint();

    path.lineTo(0, size.height * 0.75);
    path.quadraticBezierTo(size.width * 0.10, size.height * 0.70,
        size.width * 0.17, size.height * 0.90);
    path.quadraticBezierTo(
        size.width * 0.20, size.height, size.width * 0.25, size.height * 0.90);
    path.quadraticBezierTo(size.width * 0.40, size.height * 0.40,
        size.width * 0.50, size.height * 0.70);
    path.quadraticBezierTo(size.width * 0.60, size.height * 0.85,
        size.width * 0.65, size.height * 0.65);
    path.quadraticBezierTo(
        size.width * 0.70, size.height * 0.90, size.width, 0);
    path.close();

    paint.color = Colors.red[100]!;
    canvas.drawPath(path, paint);

    path = Path();
    path.lineTo(0, size.height * 0.50);
    path.quadraticBezierTo(size.width * 0.10, size.height * 0.80,
        size.width * 0.15, size.height * 0.60);
    path.quadraticBezierTo(size.width * 0.20, size.height * 0.45,
        size.width * 0.27, size.height * 0.60);
    path.quadraticBezierTo(
        size.width * 0.45, size.height, size.width * 0.50, size.height * 0.80);
    path.quadraticBezierTo(size.width * 0.55, size.height * 0.45,
        size.width * 0.75, size.height * 0.75);
    path.quadraticBezierTo(
        size.width * 0.85, size.height * 0.93, size.width, size.height * 0.60);
    path.lineTo(size.width, 0);
    path.close();

    paint.color = Colors.red[300]!;
    canvas.drawPath(path, paint);

    path = Path();
    path.lineTo(0, size.height * 0.75);
    path.quadraticBezierTo(size.width * 0.10, size.height * 0.55,
        size.width * 0.22, size.height * 0.70);
    path.quadraticBezierTo(size.width * 0.30, size.height * 0.90,
        size.width * 0.40, size.height * 0.75);
    path.quadraticBezierTo(size.width * 0.52, size.height * 0.50,
        size.width * 0.65, size.height * 0.70);
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.85, size.width, size.height * 0.60);
    path.lineTo(size.width, 0);
    path.close();

    paint.color = Colors.red;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
