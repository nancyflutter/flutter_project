import 'package:flutter/material.dart';
import 'package:flutter_project/Pages/ExampleView/example_view.dart';
import 'package:flutter_project/Pages/Home_View/home_view.dart';
import 'package:flutter_project/Theme/getx_theme_.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BottomNavigationController extends GetxController {
  late RxBool isSwitch;
  late MyThemePreferences _preferences;
  static late SharedPreferences sharedPreferences;

  RxBool get isDark => isSwitch;

  int tabIndex = 0;
  Color myPrimaryColor = Get.theme.primaryColor;

  /// tabView
  List<Widget> bottomScreens = const [
    HomeScreen(),
    ExamplesView(),
  ];

  tabChange(int index) {
    tabIndex = index;
    update();
  }

  var showRandomColorTile = true;
  Color? selectedColor = Colors.blue;
  int? selectedColorIndex = Get.theme.primaryColor.value;

  /// Other App View List
  List<String> otherApps = [
    "Learn Maths Tables",
    "Simple Guide for Java Programs",
    "Levelling",
    "Water Drinking",
  ];

  /// Share Icon List
  List<String> shareUrl = [
    "https://www.youtube.com/",
    "https://www.instagram.com/",
    "https://www.facebook.com/",
    "https://www.twitter.com/",
  ];

  BottomNavigationController() {
    isSwitch = RxBool(false);
    _preferences = MyThemePreferences();
    getPreferences();
    update();
  }

  getPreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
    isSwitch = RxBool(await _preferences.getTheme());
    selectedColorIndex = sharedPreferences.getInt(MyThemePreferences.COLOR_KEY) ?? 5;
    selectedColor = Colors.primaries[selectedColorIndex!];
    update();
  }

  // set isDark
  void toggleSwitch({RxBool? value}) {
    isSwitch = value!;
    if (isSwitch.value) {
      showRandomColorTile = false;
      Get.changeTheme(ThemeData.dark());
      update();
    } else {
      showRandomColorTile = true;
      Get.changeTheme(ThemeData.light());
      update();
    }
    _preferences.setTheme(value.value);
    update();
  }

  changeColor(int index) {
    selectedColorIndex = index;
    selectedColor = Colors.primaries[index];
    Get.isDarkMode
        ? Colors.black
        : Get.changeTheme(
            ThemeData.light().copyWith(primaryColor: selectedColor),
          );
    _preferences.setColorThemeD(selectedColorIndex!);
    update();
  }

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    sharedPreferences = await SharedPreferences.getInstance();
    isSwitch = RxBool(await _preferences.getTheme());
    selectedColorIndex = sharedPreferences.getInt(MyThemePreferences.COLOR_KEY) ?? 5;
    selectedColor = Colors.primaries[selectedColorIndex!];
    update();
    super.onInit();
  }
}
