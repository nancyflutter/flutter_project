import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenOne extends StatefulWidget {
  const HomeScreenOne({super.key});

  @override
  State<HomeScreenOne> createState() => _HomeScreenOneState();
}

class _HomeScreenOneState extends State<HomeScreenOne> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Home Page"),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(Icons.search),
            ),
          ],
        ),
        body: _pageOneGridView(currentIndex),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          currentIndex: currentIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.description),
              label: "Page 1",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: "Page 2",
            ),
          ],
        ),
      ),
    );
  }

  Widget _pageOneGridView(int i) {
    if (i == 0) {
      return GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        shrinkWrap: true,
        children: List.generate(
          100,
          (index) {
            return Card(
              elevation: 3,
              child: Container(
                height: Get.height * 0.02,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                  image: DecorationImage(
                    image: AssetImage("assets/images/img.jpg"),
                  ),
                ),
                child: Align(
                  alignment: AlignmentDirectional.bottomCenter,
                  child: Text("Item - $index"),
                ),
              ),
            );
          },
        ),
      );
    } else {
      return GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        shrinkWrap: true,
        children: List.generate(
          100,
              (index) {
            return Card(
              elevation: 3,
              child: Container(
                height: Get.height * 0.02,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                  image: DecorationImage(
                    image: AssetImage("assets/images/img_2.jpg"),
                  ),
                ),
                child: Align(
                  alignment: AlignmentDirectional.bottomCenter,
                  child: Text("Item - $index"),
                ),
              ),
            );
          },
        ),
      );
    }
  }
}
