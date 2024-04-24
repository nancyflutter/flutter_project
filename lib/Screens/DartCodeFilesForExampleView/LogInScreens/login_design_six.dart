import 'package:flutter/material.dart';
import 'package:flutter_project/Commons/CommonWidgets/common_text_field_widget.dart';
import 'package:get/get.dart';

class LogInDesignSix extends StatelessWidget {
  const LogInDesignSix({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: SizedBox(
              height: Get.height * 0.25,
              width: Get.width,
              child: const Image(
                image: AssetImage("assets/animation/water_waves.gif"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: Get.height,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: CommonTextField(
                    prefixIcon: Icon(Icons.person_outline),
                  ),
                ),
                const CommonTextField(
                  hintText: "PassWord",
                  labelText: "PassWord",
                  prefixIcon: Icon(Icons.lock_outline),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20, top: 10),
                  child: SizedBox(
                    width: Get.width,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        "LOGIN",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Text(
                    "Forgot your password?",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
