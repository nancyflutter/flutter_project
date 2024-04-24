import 'package:flutter/material.dart';

class TabPageSelectorScreen extends StatefulWidget {
  const TabPageSelectorScreen({super.key});

  @override
  State<TabPageSelectorScreen> createState() => _TabPageSelectorScreenState();
}

class _TabPageSelectorScreenState extends State<TabPageSelectorScreen>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;
  int numOfDots = 6;
  List<Widget> widgets = [
    Container(
      height: 200,
      width: 200,
      color: Colors.red,
    ),
    Container(
      height: 200,
      width: 200,
      color: Colors.yellow,
    ),
    Container(
      height: 200,
      width: 200,
      color: Colors.green,
    ),
    Container(
      height: 200,
      width: 200,
      color: Colors.purple,
    ),
    Container(
      height: 200,
      width: 200,
      color: Colors.orange,
    ),
    Container(
      height: 200,
      width: 200,
      color: Colors.indigo,
    ),
  ];

  @override
  void initState() {
    tabController = TabController(
      length: numOfDots,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          widgets[tabController.index],
          TabPageSelector(
            controller: tabController,
          ),
          TextButton(
            onPressed: () {
              setState(() {
                (tabController.index == numOfDots - 1)
                    ? tabController.index = 0
                    : tabController.index++;
              });
            },
            child: const Text("Next"),
          ),
        ],
      ),
    );
  }
}
