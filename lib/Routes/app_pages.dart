import 'package:flutter_project/Bindings/bottom_navigation_binding.dart';
import 'package:flutter_project/Bindings/example_binding.dart';
import 'package:flutter_project/Bindings/home_binding.dart';
import 'package:flutter_project/Pages/ExampleView/example_view.dart';
import 'package:flutter_project/Pages/Home_View/home_view.dart';
import 'package:flutter_project/Pages/bottom_navigation_bar_view.dart';
import 'package:flutter_project/Routes/app_routes_name.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>> routesList = [
  GetPage(
    name: RoutesName.homeScreen,
    page: () => const HomeScreen(),
    binding: HomeBinding(),
  ),
  GetPage(
    name: RoutesName.samplesView,
    page: () =>  const ExamplesView(),
    binding: ExampleBinding(),
  ),
  GetPage(
    name: RoutesName.bottomNavigationView,
    page: () =>  BottomNavigationBarView(),
    binding: BottomNavigationBinding(),
  ),
];


