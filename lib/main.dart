import 'package:flutter/material.dart';
import 'package:flutter_project/Controllers/bottom_navigation_controller.dart';
import 'package:flutter_project/Routes/app_pages.dart';
import 'package:flutter_project/Routes/app_routes_name.dart';
import 'package:flutter_project/Theme/getx_theme_.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MyThemePreferences().init();
  Get.put(() => BottomNavigationController());

  runApp(
    GetBuilder<BottomNavigationController>(
      init: BottomNavigationController(),
      autoRemove: false,
      builder: (controller) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.light().copyWith(
          primaryColor: Colors.blue,
          secondaryHeaderColor: Colors.white,
        ),
        themeMode: controller.isSwitch.value ? ThemeMode.dark : ThemeMode.light,
        darkTheme: ThemeData.dark().copyWith(
          primaryColor: Colors.black,
          secondaryHeaderColor: Colors.white,
        ),
        getPages: routesList,
        initialRoute: RoutesName.bottomNavigationView,
      ),
    ),
  );
}
