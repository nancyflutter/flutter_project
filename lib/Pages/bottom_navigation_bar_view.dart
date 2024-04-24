import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/AppIcons/app_icons.dart';
import 'package:flutter_project/Commons/CommonWidgets/common_backdrop_scaffold.dart';
import 'package:flutter_project/Commons/CommonWidgets/common_share_.dart';
import 'package:flutter_project/Commons/CommonWidgets/common_speed_dial_floating_button.dart';
import 'package:flutter_project/Commons/CommonWidgets/common_text_style_.dart';
import 'package:flutter_project/Controllers/bottom_navigation_controller.dart';
import 'package:flutter_project/Controllers/home_controller.dart';
import 'package:flutter_project/TitleNavigationBar/src/navigation_bar.dart';
import 'package:flutter_project/TitleNavigationBar/src/navigation_bar_item.dart';
import 'package:get/get.dart';

class BottomNavigationBarView extends GetView<BottomNavigationController> {
  final homeController = Get.find<HomeController>();
  BottomNavigationBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavigationController>(
      init: Get.find<BottomNavigationController>(),
      builder: (controller) => SafeArea(
        child: CommonBackDropScaffold(
          backLayerBackgroundColor: controller.isSwitch.value
              ? Colors.black
              : !controller.isSwitch.value
                  ? controller.selectedColor
                  : Colors.white,
          preferredAppBar: AppBar(
            backgroundColor: controller.isSwitch.value
                ? Colors.black
                : !controller.isSwitch.value
                    ? controller.selectedColor
                    : Colors.black,
            leading: const BackdropToggleButton(
              icon: AnimatedIcons.close_menu,
            ),
            elevation: 0,
            title: const Text("Flutter"),
            actions: [
              IconButton(
                onPressed: () {
                  CommonShare().shareUrl("https://www.youtube.com/");
                },
                icon: const Icon(Icons.smart_display),
              ),
              IconButton(
                onPressed: () {
                  CommonShare().shareUrl("https://play.google.com");
                },
                icon: const Icon(Icons.shop),
              ),
              IconButton(
                onPressed: () {
                  CommonShare().shareUrl(
                      "https://play.google.com/store/apps/details?id=com.sts.flutter");
                },
                icon: const Icon(Icons.share),
              ),
              IconButton(
                onPressed: () {
                  CommonShare().shareUrl("urlToShare");
                },
                icon: const Icon(Icons.ads_click),
              ),
            ],
          ),
          backLayer: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                const CommonText(
                    data: "\nFlutter Tutorial - v2.4.7",
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
                const CommonText(
                    data:
                        "\nLearn Flutter Widgets and samples with code- for beginners."),
                const CommonText(
                    data: "More Widgets and samples will be updated ..."),
                const Divider(),
                _primeUserView(context),
                const Divider(),
                _nightThemeView(),
                // spread operator "..."
                if (controller.showRandomColorTile) ...[
                  ListTile(
                    onTap: () {
                      _colorPickerView(context);
                    },
                    title: const CommonText(data: "Change Theme"),
                    leading: IconButton(
                      onPressed: () {
                        _colorPickerView(context);
                      },
                      icon: const Icon(Icons.color_lens, color: Colors.white),
                    ),
                  ),
                ],
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.feedback, color: Colors.white),
                  title: const CommonText(
                      data: "Share your Feedback", fontSize: 18),
                  onTap: () {},
                ),
                const Divider(thickness: 2),
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: CommonText(data: "Other Apps", fontSize: 18),
                ),
                _otherAppsView(),
                const Divider(thickness: 2),
                _iconsView(),
              ],
            ),
          ),
          frontLayer: controller.bottomScreens[controller.tabIndex],
          floatingActionButton: _floatingButtonView(),
          bottomNavigationBar: _titledBottomNavigationBarView(),
        ),
      ),
    );
  }

  Widget _titledBottomNavigationBarView() {
    return TitledBottomNavigationBar(
      activeColor: controller.isSwitch.value
          ? Colors.black
          : !controller.isSwitch.value
              ? controller.selectedColor
              : Colors.white,
      inactiveColor: controller.isSwitch.value
          ? Colors.white
          : !controller.isSwitch.value
              ? Colors.white
              : Colors.white,
      currentIndex: controller.tabIndex,
      onTap: (index) {
        debugPrint("Selected Index: $index");
        controller.tabChange(index);
      },
      items: [
        TitledNavigationBarItem(
          backgroundColor: controller.isSwitch.value
              ? Colors.black
              : !controller.isSwitch.value
                  ? controller.selectedColor!
                  : Colors.white,
          title: Text('Widgets',
              selectionColor: controller.isSwitch.value
                  ? Colors.black
                  : !controller.isSwitch.value
                      ? Get.theme.secondaryHeaderColor
                      : Colors.white),
          icon: Icon(Icons.widgets,
              color: controller.isSwitch.value
                  ? Colors.white
                  : !controller.isSwitch.value // light
                      ? Get.theme.secondaryHeaderColor
                      : Colors.white),
        ),
        TitledNavigationBarItem(
          backgroundColor: controller.isSwitch.value
              ? Colors.black
              : !controller.isSwitch.value
                  ? controller.selectedColor!
                  : Colors.white,
          title: Text('Samples',
              selectionColor: controller.isSwitch.value
                  ? Colors.black
                  : !controller.isSwitch.value
                      ? Get.theme.secondaryHeaderColor
                      : Colors.white),
          icon: Icon(Icons.dvr,
              color: controller.isSwitch.value
                  ? Colors.white
                  : !controller.isSwitch.value
                      ? Get.theme.secondaryHeaderColor
                      : Colors.white),
        ),
      ],
    );
  }

  Widget _floatingButtonView() {
    if (controller.tabIndex == 0) {
      return CommonSpeedDialFloatingButton();
    } else {
      return Container();
    }
  }

  Widget _primeUserView(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.all_inclusive, color: Colors.white),
      title: const CommonText(
          data: "Want to become a prime User of the app", fontSize: 18),
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Prime User Benefits!",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                const Text(
                  "\nNo More Ads.\n\nAll sample related source codes will be unlocked.\n\nAll future updated sample sources will also be unlocked.",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        style:
                            const ButtonStyle(alignment: Alignment.centerLeft),
                        onPressed: () {
                          Navigator.pop(context, "Not Now");
                        },
                        child: Text(
                          "Not Now",
                          style: TextStyle(
                              color: Colors.grey[600],
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      TextButton(
                        style:
                            const ButtonStyle(alignment: Alignment.centerLeft),
                        onPressed: () {
                          Navigator.pop(context, "Buy @ ₹389.00");
                        },
                        child: const Text(
                          "Buy @ ₹389.00",
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _nightThemeView() {
    return Obx(
      () => ListTile(
        onTap: () {
          controller.toggleSwitch(value: controller.isSwitch);
          Get.changeTheme(
              controller.isSwitch.value ? ThemeData.dark() : ThemeData.light());
          controller.isSwitch.refresh();
        },
        title: const CommonText(data: "Night Theme"),
        leading: IconButton(
          onPressed: () {
            controller.toggleSwitch(value: controller.isSwitch);
            Get.changeTheme(controller.isSwitch.value
                ? ThemeData.dark()
                : ThemeData.light());
            controller.isSwitch.refresh();
          },
          icon: Icon(
            controller.isSwitch.value
                ? Icons.brightness_4_sharp
                : Icons.brightness_7_rounded,
            color: Colors.white,
          ),
        ),
        trailing: Switch(
          activeColor: controller.selectedColor,
          value: controller.isSwitch.value,
          onChanged: (value) {
            controller.toggleSwitch(value: value.obs);
            Get.changeTheme(controller.isSwitch.value
                ? ThemeData.dark()
                : ThemeData.light());
            controller.isSwitch.refresh();
          },
        ),
      ),
    );
  }

  Future<dynamic> _colorPickerView(BuildContext context) {
    return showModalBottomSheet(
      useSafeArea: true,
      isDismissible: false,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder:
              (BuildContext context, void Function(void Function()) setState) {
            return Container(
              height: Get.height * 0.600,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: ListView(
                children: [
                  Container(
                    height: 70,
                    decoration: BoxDecoration(
                      color: controller.isSwitch.value
                          ? Colors.black
                          : !controller.isSwitch.value
                              ? controller.selectedColor
                              : Get.theme.primaryColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 50),
                          child: CommonText(
                              data: "Pick a color you like!   ", fontSize: 18),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: CloseButton(
                            onPressed: () {
                              Get.back();
                            },
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 355,
                    width: 350,
                    child: GridView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      // itemCount: Colors.primaries.length,
                      itemCount: Colors.primaries.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                      ),
                      itemBuilder: (context, index) {
                        final color = Colors.primaries[index];
                        bool isSelected =
                            index == controller.selectedColorIndex;
                        return Padding(
                          padding: const EdgeInsets.all(9.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                if (!isSelected) {
                                  controller.selectedColor = color;
                                  controller.selectedColorIndex = index;
                                  controller.changeColor(index);
                                }
                              });
                            },
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: color,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: color,
                                        offset: const Offset(3, 3),
                                        blurRadius: 5,
                                        // spreadRadius: 10,
                                      ),
                                    ],
                                  ),
                                ),
                                if (isSelected) const Icon(Icons.check),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    ).then((value) {
      final controller = Get.find<BottomNavigationController>();
      controller.update();
    });
  }

  Widget _otherAppsView() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        height: 220,
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.otherApps.length,
          itemBuilder: (context, index) {
            var data = controller.otherApps[index];
            return ListTile(
              title: CommonText(data: data),
              leading: const Icon(Icons.shop, color: Colors.white),
              onTap: () {
                CommonShare().shareUrl(data);
              },
            );
          },
        ),
      ),
    );
  }

  Widget _iconsView() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 30, left: 15, right: 15),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                CommonShare().shareUrl(controller.shareUrl[0]);
              },
              icon: Icon(
                YouTube.youtube,
                color: controller.isSwitch.value ? Colors.white : Colors.black,
              ),
            ),
            IconButton(
              onPressed: () {
                CommonShare().shareUrl(controller.shareUrl[1]);
              },
              icon: Icon(InstagramIcon.instagram,
                  color:
                      controller.isSwitch.value ? Colors.white : Colors.black),
            ),
            IconButton(
              onPressed: () {
                CommonShare().shareUrl(controller.shareUrl[2]);
              },
              icon: Icon(FacebookIcon.facebook,
                  color:
                      controller.isSwitch.value ? Colors.white : Colors.black),
            ),
            IconButton(
              onPressed: () {
                CommonShare().shareUrl(controller.shareUrl[3]);
              },
              icon: Icon(TwitterIcon.twitter,
                  color:
                      controller.isSwitch.value ? Colors.white : Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
