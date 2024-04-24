library widget_with_codeview;

import 'package:flutter/material.dart';
import 'package:flutter_project/Controllers/bottom_navigation_controller.dart';
import 'package:get/get.dart';

import 'source_code_view.dart';

class WidgetWithCodeView extends SourceCodeView {
  final controller = Get.find<BottomNavigationController>();

  // If not given, will just show the SourceCodeView (see https://github.com/X-Wei/widget_with_codeview/issues/10).
  final Widget? child;

  // Can be used to add a hook when switching tabs.
  final void Function(TabController)? tabChangeListener;

  WidgetWithCodeView({
    super.key,
    required super.filePath,
    this.child,
    this.tabChangeListener,
    super.codeLinkPrefix,
    super.showLabelText,
    super.iconBackgroundColor,
    super.iconForegroundColor,
    super.labelBackgroundColor,
    super.labelTextStyle,
    super.headerWidget,
    super.footerWidget,
    super.lightTheme,
    super.darkTheme,
  });

  static const _tabs = <Widget>[
    Tab(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.phone_android, color: Colors.white),
          Text("Output", style: TextStyle(color: Colors.white)),
        ],
      ),
    ),
    Tab(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.code, color: Colors.white),
          Text("Code", style: TextStyle(color: Colors.white)),
        ],
      ),
    ),
  ];

  @override
  WidgetWithCodeViewState createState() => WidgetWithCodeViewState(
        tabChangeListener: tabChangeListener,
        child: child,
      );
}

//? Need to override SourceCodeViewState rather than State<WidgetWithCodeView>.
//! otherwise won't compile, because WidgetWithCodeView extends SourceCodeView.
//! I use this inheritance to use "parameter forwarding" feature in dart 2.17.
class WidgetWithCodeViewState extends SourceCodeViewState
    with SingleTickerProviderStateMixin {
  Widget? child;
  late TabController _tabController;
  void Function(TabController)? tabChangeListener;

  WidgetWithCodeViewState({this.child, this.tabChangeListener});

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    if (tabChangeListener != null) {
      _tabController.addListener(
        () => tabChangeListener!(_tabController),
      );
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  String get routeName => '/${runtimeType.toString()}';

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<BottomNavigationController>();
    final sourceCodeView = super.build(context);
    return Scaffold(
      body: (child == null)
          ? sourceCodeView
          : TabBarView(
              controller: _tabController,
              children: <Widget>[
                _AlwaysAliveWidget(child: child!),
                _AlwaysAliveWidget(child: sourceCodeView),
              ],
            ),
      bottomNavigationBar: (child == null)
          ? null
          : _ColoredTabBar(
              color: controller.isSwitch.value
                  ? Colors.black
                  : !controller.isSwitch.value
                      ? controller.selectedColor!
                      : Colors.blue,
              tabBar: TabBar(
                controller: _tabController,
                tabs: WidgetWithCodeView._tabs,
              ),
            ),
    );
  }
}

// This widget is always kept alive, so that when tab is switched back, its
// child's state is still preserved.
class _AlwaysAliveWidget extends StatefulWidget {
  final Widget child;

  const _AlwaysAliveWidget({Key? key, required this.child}) : super(key: key);

  @override
  _AlwaysAliveWidgetState createState() => _AlwaysAliveWidgetState();
}

class _AlwaysAliveWidgetState extends State<_AlwaysAliveWidget>
    with AutomaticKeepAliveClientMixin<_AlwaysAliveWidget> {
  @override
  Widget build(BuildContext context) {
    super.build(context); // This build method is annotated "@mustCallSuper".
    return widget.child;
  }

  @override
  bool get wantKeepAlive => true;
}

class _ColoredTabBar extends Container implements PreferredSizeWidget {
  @override
  final Color color;
  final TabBar tabBar;

  _ColoredTabBar({Key? key, required this.color, required this.tabBar})
      : super(key: key);

  @override
  Size get preferredSize => tabBar.preferredSize;

  @override
  Widget build(BuildContext context) => Material(
        elevation: 4.0,
        color: color,
        child: tabBar,
      );
}
