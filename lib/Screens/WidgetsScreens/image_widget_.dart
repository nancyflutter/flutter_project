/* ------------------------------- START ------------------------------------- */

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageWidgetScreen extends StatelessWidget {
  const ImageWidgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AppBar With Image"),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/img.jpg"),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text("image from Asset"),
            SizedBox(
              height: Get.height * 0.2,
              child: const Image(
                image: AssetImage("assets/images/Flutter_logo.png"),
              ),
            ),
            const Text("Image From Network"),
            const Image(
              image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQUVD9klPC5H_l-OjQAPTfDOPtbf32CWTCrdw&usqp=CAU"),
            ),
          ],
        ),
      ),
    );
  }
}

/* ------------------------------- END ------------------------------------- */
/// How to Make Body Background Image apply to AppBar also
// Scaffold(
// extendBodyBehindAppBar: true,
// appBar: AppBar(
// title: Text('How to Flutter', style: TextStyle(
// color: Colors.white,
// fontSize: 28
// ),) ,
// elevation: 0,
// backgroundColor: Colors.transparent,
// ),
// body: Container(
// decoration: BoxDecoration(
// image: DecorationImage(
// image: AssetImage('assets/img.jpg'),
// fit: BoxFit.fill
// )
// ),
// ),
// )
