import 'package:flutter/material.dart';
import 'package:flutter_project/Commons/CommonWidgets/common_text_field_widget.dart';

class LogInDesignSeven extends StatelessWidget {
  const LogInDesignSeven({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/nature.jpg"), fit: BoxFit.cover),
      ),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: ClipPath(
              clipper: RoundedDiagonalPathClipper(),
              child: Container(
                color: Colors.amber,
                height: 500,
                width: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FlutterLogo(
                          size: 50,
                        ),
                        Text(
                          "Flutter",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: CommonTextField(
                        fillColor: Colors.transparent,
                        labelText: "UserName",
                        prefixIcon: Icon(Icons.person_outline),
                      ),
                    ),
                    const CommonTextField(
                      fillColor: Colors.transparent,
                      hintText: "PassWord",
                      labelText: "PassWord",
                      prefixIcon: Icon(Icons.lock_outline),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: CircleAvatar(
                        maxRadius: 25,
                        backgroundColor: Colors.pink,
                        child: IconButton(
                          // style: ButtonStyle(elevation:MaterialStatePropertyAll(50)),
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_forward_sharp),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class RoundedDiagonalPathClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    var roundnessFactor = 30.0;
    path.moveTo(0, size.height * 0.33);
    path.lineTo(0, size.height - roundnessFactor);
    path.quadraticBezierTo(0, size.height, roundnessFactor, size.height);
    path.lineTo(size.width - roundnessFactor, size.height);
    path.quadraticBezierTo(
        size.width, size.height, size.width, size.height - roundnessFactor);
    path.lineTo(size.width, roundnessFactor * 2);
    path.quadraticBezierTo(size.width - 30, 35,
        size.width - roundnessFactor * 1.5, roundnessFactor * 1.5);
    path.lineTo(
        roundnessFactor * 0.6, size.height * 0.33 - roundnessFactor * 0.3);
    path.quadraticBezierTo(
        0, size.height * 0.33, 0, size.height * 0.33 + roundnessFactor);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
