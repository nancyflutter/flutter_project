import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenSix extends StatefulWidget {
  const HomeScreenSix({super.key});

  @override
  State<HomeScreenSix> createState() => _HomeScreenSixState();
}

class _HomeScreenSixState extends State<HomeScreenSix> {
  bool switchChild = true;
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: _pageOneGridView(currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.amber,
        selectedItemColor: Colors.red,
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
    );
  }

  Widget _pageOneGridView(int i) {
    if (i == 0) {
      return ListView(
        children: [
          const Center(
            child: Padding(
              padding: EdgeInsets.only(top: 18.0),
              child: Text(
                "Top Brands",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                ),
              ),
            ),
          ),
          SizedBox(
            // width: 200,
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 15,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://googleflutter.com/sample_image.jpg'),
                          fit: BoxFit.fill),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.red,
                          blurRadius: 2.5,
                          spreadRadius: 0.0,
                          offset: Offset(
                            0.0,
                            2.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Best Deals",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 300,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 15,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.red,
                          blurRadius: 6.0,
                          spreadRadius: 0.0,
                          offset: Offset(
                            0.0,
                            2.0,
                          ),
                        )
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child: Image.asset('assets/images/nature.jpg'),
                    ),
                  ),
                );
              },
            ),
          ),
          const Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Offers",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                ),
              ),
            ),
          ),
          AnimatedSwitcher(
            duration: const Duration(seconds: 2),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return ScaleTransition(scale: animation, child: child);
            },
            child: switchChild
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Container(
                      key: UniqueKey(),
                      height: 20.0,
                      width: Get.width,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/nature.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Container(
                      key: UniqueKey(),
                      height: 20.0,
                      width: Get.width,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/img.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                switchChild = !switchChild;
              });
            },
            child: const Text('Click'),
          ),
        ],
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.amber,
          title: const Center(
            child: Text(
              "All Product",
              style: TextStyle(color: Colors.red),
            ),
          ),
        ),
        body: Container(
          color: Colors.amber,
          child: GridView.count(
            crossAxisCount: 3,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            shrinkWrap: true,
            children: List.generate(
              100,
              (index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: Get.height * 0.02,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                      image: DecorationImage(
                          image: AssetImage("assets/images/img_2.jpg"),
                          fit: BoxFit.cover),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.red,
                          blurRadius: 6.0,
                          spreadRadius: 0.0,
                          offset: Offset(
                            0.0,
                            2.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      );
    }
  }
}
