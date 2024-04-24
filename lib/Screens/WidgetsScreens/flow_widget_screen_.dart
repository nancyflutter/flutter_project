import 'package:flutter/material.dart';

class FlowWidgetScreen extends StatefulWidget {
  const FlowWidgetScreen({super.key});

  @override
  State<FlowWidgetScreen> createState() => _FlowWidgetScreenState();
}

class _FlowWidgetScreenState extends State<FlowWidgetScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController menuAnimation;
  IconData lastTapped = Icons.home;
  final List<IconData> menuItems = <IconData>[
    Icons.home,
    Icons.camera,
    Icons.chat,
    Icons.map,
    Icons.menu,
  ];

  void _updateMenu(IconData icon) {
    if (icon != Icons.menu) {
      setState(() => lastTapped = icon);
    }
  }

  @override
  void initState() {
    super.initState();
    menuAnimation = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
  }

  Widget flowMenuItem(IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: RawMaterialButton(
          fillColor: Colors.blue,
          splashColor: Colors.amber[100],
          shape: const CircleBorder(),
          constraints: BoxConstraints.tight(const Size(64, 64)),
          onPressed: () {
            _updateMenu(icon);
            menuAnimation.status == AnimationStatus.completed
                ? menuAnimation.reverse()
                : menuAnimation.forward();
          },
          child: Icon(
            icon,
            color: Colors.white,
            size: 32.0,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Flow(
        delegate: FlowMenuDelegate(menuAnimation: menuAnimation),
        children: menuItems
            .map<Widget>((IconData icon) => flowMenuItem(icon))
            .toList(),
      ),
    );
  }
}

class FlowMenuDelegate extends FlowDelegate {
  FlowMenuDelegate({required this.menuAnimation})
      : super(repaint: menuAnimation);

  final Animation<double> menuAnimation;

  @override
  bool shouldRepaint(FlowMenuDelegate oldDelegate) {
    return menuAnimation != oldDelegate.menuAnimation;
  }

  @override
  void paintChildren(FlowPaintingContext context) {
    double dx = 0.0;
    for (int i = 0; i < context.childCount; ++i) {
      dx = context.getChildSize(i)!.width * i;
      context.paintChild(
        i,
        transform: Matrix4.translationValues(
          dx * menuAnimation.value,
          dx * menuAnimation.value,
          dx * menuAnimation.value,
        ),
      );
    }
  }
}
