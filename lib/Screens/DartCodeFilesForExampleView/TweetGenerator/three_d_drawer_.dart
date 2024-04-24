import 'dart:math';
import 'package:flutter/material.dart';

class Drawer3DScreen extends StatefulWidget {
  const Drawer3DScreen({Key? key}) : super(key: key);

  @override
  State<Drawer3DScreen> createState() => _Drawer3DScreenState();
}

class _Drawer3DScreenState extends State<Drawer3DScreen> with SingleTickerProviderStateMixin {
  dynamic maxSlide = 1;
  late double startingPos;
  var drawerVisible = false;
  late AnimationController animationController;
  Size screen = const Size(0, 0);
  late CurvedAnimation animator;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    animator = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOutQuad,
      reverseCurve: Curves.easeInQuad,
    );
  }

  @override
  void didChangeDependencies() {
    screen = MediaQuery.of(context).size;
    maxSlide *= screen.width;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: GestureDetector(
        onHorizontalDragStart: onDragStart,
        onHorizontalDragUpdate: onDragUpdate,
        onHorizontalDragEnd: onDragEnd,
        child: Stack(
          children: [
            Container(
              color: Colors.deepPurple[200],
              child: AnimatedBuilder(
                animation: animator,
                builder: (context, widget) {
                  return Transform.translate(
                    offset: Offset(maxSlide * (animator.value - 1), 0),
                    child: Transform(
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..rotateY(pi * (1 - animator.value) / 2),
                      alignment: Alignment.centerRight,
                      child: widget,
                    ),
                  );
                },
                child: Stack(
                  children: [
                    Container(
                      width: 2,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            Colors.black12,
                          ],
                        ),
                      ),
                    ),
                    SafeArea(
                      child: Container(
                        color: Colors.deepPurple[200],
                        width: maxSlide,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 80.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                title: const Text("Profile Screen"),
                                leading: CircleAvatar(
                                  child: Image.asset("assets/images/correct.png"),
                                ),
                              ),
                              const ListTile(
                                title: Text("Home"),
                                leading: Icon(Icons.home),
                              ),
                              const ListTile(
                                title: Text("Settings"),
                                leading: Icon(Icons.settings),
                              ),
                              const ListTile(
                                title: Text("About"),
                                leading: Icon(Icons.help),
                              ),
                              const ListTile(
                                title: Text("Exit"),
                                leading: Icon(Icons.exit_to_app),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    AnimatedBuilder(
                      animation: animator,
                      builder: (_, __) => Container(
                        width: maxSlide,
                        color: Colors.black.withAlpha(
                          (150 * (1 - animator.value)).floor(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.deepPurple[300],
              child: SafeArea(
                child: AnimatedBuilder(
                    animation: animator,
                    builder: (_, __) {
                      return Transform.translate(
                        offset: Offset((screen.width - 60) * animator.value, 0),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 50,
                              height: 50,
                              child: InkWell(
                                onTap: toggleDrawer,
                                child: const Icon(Icons.menu),
                              ),
                            ),
                            Opacity(
                              opacity: 1 - animator.value,
                              child: const Text(
                                "PRODUCT DETAIL",
                                style: TextStyle(fontWeight: FontWeight.w900),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ),
            AnimatedBuilder(
              animation: animator,
              builder: (_, widget) => Opacity(
                opacity: 1 - animator.value,
                child: Transform.translate(
                  offset: Offset((maxSlide + 50) * animator.value, 0),
                  child: Transform(
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateY((pi / 2 + 0.1) * -animator.value),
                    alignment: Alignment.centerLeft,
                    child: widget,
                  ),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Center(
                    child: Text(
                      "Drag right",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(
                    height: 200,
                    width: 200,
                    color: Colors.deepPurple[400],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onDragStart(DragStartDetails details) {
    startingPos = details.globalPosition.dx;
  }

  void onDragUpdate(DragUpdateDetails details) {
    final globalDelta = details.globalPosition.dx - startingPos;
    if (globalDelta > 0) {
      final pos = globalDelta / screen.width;
      if (drawerVisible && pos <= 1.0) return;
      animationController.value = pos;
    } else {
      final pos = 1 - (globalDelta.abs() / screen.width);
      if (!drawerVisible && pos >= 0.0) return;
      animationController.value = pos;
    }
  }

  void onDragEnd(DragEndDetails details) {
    if (details.velocity.pixelsPerSecond.dx.abs() > 500) {
      if (details.velocity.pixelsPerSecond.dx > 0) {
        animationController.forward(from: animationController.value);
        drawerVisible = true;
      } else {
        animationController.reverse(from: animationController.value);
        drawerVisible = false;
      }
      return;
    }
    if (animationController.value > 0.5) {
      animationController.forward(from: animationController.value);
      drawerVisible = true;
    } else {
      animationController.reverse(from: animationController.value);
      drawerVisible = false;
    }
  }

  void toggleDrawer() {
    if (animationController.value < 0.5) {
      animationController.forward();
    } else {
      animationController.reverse();
    }
  }
}
