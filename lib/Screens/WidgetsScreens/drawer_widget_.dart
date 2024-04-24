/* ------------------------------- START ------------------------------------- */

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerWidgetScreen extends StatelessWidget {
  const DrawerWidgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Scaffold(
        drawer: Drawer(
          child: Column(
            children: [
              const Row(
                children: [
                  Expanded(
                    child: DrawerHeader(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                      ),
                      child: Text("Header"),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Get.height * 0.5,
                child: ListView.builder(
                  itemCount: iconList.length,
                  itemBuilder: (context, index) {
                    var data = iconList[index];
                    return ListTile(
                      leading: Icon(data.icons),
                      title: Text("item ${index + 1}"),
                    );
                  },
                ),
              )
            ],
          ),
        ),
        appBar: AppBar(
          title: const Text("Navigation Drawer"),
        ),
        body: const Center(
          child: Text("My Page!"),
        ),
      ),
    );
  }
}

/* ------------------------------- END ------------------------------------- */
class IconModel {
  final IconData? icons;

  IconModel({
    this.icons,
  });
}

var iconList = <IconModel>[
  IconModel(icons: Icons.alarm),
  IconModel(icons: Icons.message),
  IconModel(icons: Icons.email),
  IconModel(icons: Icons.phone),
  IconModel(icons: Icons.camera),
  IconModel(icons: Icons.watch),
  IconModel(icons: Icons.exit_to_app),
];
