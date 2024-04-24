import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenTwo extends StatelessWidget {
  const HomeScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
        ),
        drawer: const Drawer(),
        body: ListView(
          children: [
            SizedBox(
              width: Get.width,
              height: Get.height * 0.32,
              child: const Image(
                image: AssetImage("assets/images/nature.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: ListTile(
                title: Text("Title 1"),
                subtitle: Text("Sub Title"),
                trailing: Wrap(
                  children: [
                    Icon(Icons.star, color: Colors.red),
                    Text("1"),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Icon(Icons.call),
                      Text("CALL"),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.near_me),
                      Text("ROUTE"),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.share),
                      Text("SHARE"),
                    ],
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 30,
                right: 20.0,
                left: 20,
              ),
              child: Text(
                  "Description about the page - This this the flutter layout example given by google for the layout implementation. We used that sample here for easy reference. You can check this in google flutter UI Tutorial for more information about this design."),
            )
          ],
        ),
      ),
    );
  }
}
