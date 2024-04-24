import 'package:flutter/material.dart';
import 'package:flutter_project/Controllers/bottom_navigation_controller.dart';
import 'package:flutter_project/Controllers/home_controller.dart';
import 'package:flutter_project/Pages/Home_View/Widgets/wish_list_screen.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';

class CommonSpeedDialFloatingButton extends StatelessWidget {
  final controller = Get.find<HomeController>();
  final bottomController = Get.find<BottomNavigationController>();

  final bool? visible;
  final bool? closeManually;
  final Curve? curve;
  final Color? overlayColor;
  final double? overlayOpacity;
  final double? elevation;
  final ShapeBorder? shape;
  final List<SpeedDialChild>? children;
  final Widget? childOne;
  final Widget? childTwo;
  final Widget? childThree;
  final Color? backgroundColorChildOne;
  final Color? backgroundColorChildTwo;
  final Color? backgroundColorChildThree;
  final void Function()? onTapChildOne;
  final void Function()? onTapChildTwo;
  final void Function()? onTapChildThree;

  void sortWidgets(bool ascending) {
    final data = controller.widgetList.map((widgetlist) => widgetlist).toList();
    data.sort((a, b) => a.title!.compareTo(b.title!));
    if (!ascending) {
      data.sort((a, b) => b.title!.compareTo(a.title!));
    }
    controller.widgetList.assignAll(data);
  }

  CommonSpeedDialFloatingButton({
    super.key,
    this.visible,
    this.closeManually,
    this.curve,
    this.overlayColor,
    this.overlayOpacity,
    this.elevation,
    this.shape,
    this.children,
    this.childOne,
    this.childTwo,
    this.childThree,
    this.backgroundColorChildOne,
    this.backgroundColorChildTwo,
    this.backgroundColorChildThree,
    this.onTapChildOne,
    this.onTapChildTwo,
    this.onTapChildThree,
  });

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      icon: Icons.menu,
      activeIcon: Icons.close,
      backgroundColor: bottomController.isSwitch.value
          ? Colors.black
          : !bottomController.isSwitch.value
              ? bottomController.selectedColor
              : Colors.white,
      foregroundColor: Colors.white,
      activeBackgroundColor: Colors.red,
      activeForegroundColor: Colors.white,
      visible: visible ?? true,
      closeManually: closeManually ?? false,
      curve: curve ?? Curves.bounceIn,
      overlayColor: overlayColor ?? Colors.black,
      overlayOpacity: overlayOpacity ?? 0.1,
      // onOpen: () => print('OPENING DIAL'), // action when menu opens
      // onClose: () => print('DIAL CLOSED'), //action when menu closes
      onOpen: () {},
      onClose: () {
        // controller.search.value = true;
      },
      elevation: elevation ?? 8.0,
      shape: shape ?? const CircleBorder(),
      children: children ??
          [
            SpeedDialChild(
              child: childOne ?? const Icon(Icons.search_rounded),
              backgroundColor:
                  backgroundColorChildOne ?? Get.theme.primaryColor,
              foregroundColor: Colors.white,
              onTap: onTapChildOne ??
                  () {
                    Get.bottomSheet(
                      barrierColor: Colors.transparent,
                      Container(
                        color: Colors.white,
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(9.0),
                                child: TextField(
                                  onChanged: (value) {
                                    controller.searchFilterWidget(title: value);
                                  },
                                  controller: controller.searchController,
                                  decoration: InputDecoration(
                                    labelText: "Widget",
                                    hintText: 'Search...',
                                    prefixIcon: IconButton(
                                      icon: const Icon(Icons.search),
                                      onPressed: () {
                                        // controller.filterWidget();
                                      },
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(23.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.clear),
                              onPressed: () {
                                // controller.search.value =
                                //     !controller.search.value;
                                controller.searchFilterWidget();
                                controller.searchController.clear();
                                Get.back();
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
            ),
            SpeedDialChild(
              child: childTwo ?? const Icon(Icons.sort_by_alpha),
              backgroundColor:
                  backgroundColorChildTwo ?? Get.theme.primaryColor,
              foregroundColor: Colors.white,
              onTap: onTapChildTwo ??
                  () {
                    // Determine the current sorting order
                    bool isAscending = controller.widgetList[0].title!
                            .compareTo(controller.widgetList[1].title!) <=
                        0;
                    // Perform the sorting
                    sortWidgets(!isAscending);
                  },
            ),
            SpeedDialChild(
              child: childThree ?? const Icon(Icons.favorite),
              backgroundColor:
                  backgroundColorChildThree ?? Get.theme.primaryColor,
              foregroundColor: Colors.white,
              onTap: onTapChildThree ??
                  () {
                    Get.to(() => WishListScreen());
                  },
              // label: 'Third Menu Child',
              // labelStyle: const TextStyle(fontSize: 18.0),
              // onTap: () => print('THIRD CHILD'),
              // onLongPress: () => print('THIRD CHILD LONG PRESS'),
            ),
          ],
    );
  }
}

